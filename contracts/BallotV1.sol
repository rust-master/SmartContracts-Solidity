pragma solidity ^0.8.0;

contract Ballot {
    struct Voter {
        uint256 weight;
        bool voted;
        uint256 vote;
    }

    struct Proposal {
        uint256 voteCount;
    }

    address chairperson;
    mapping(address => Voter) voters;
    Proposal[] proposals;

    constructor(uint256 _numProposals) {
        chairperson = msg.sender;
        voters[chairperson].weight = 2;
        proposals.length = _numProposals;
    }

    function register(address toVoter) public {
        if (msg.sender != chairperson || voters[toVoter].voted) return;
        voters[toVoter].weight = 1;
        voters[toVoter].voted = false;
    }

    function vote(uint256 toProposal) public {
        Voter storage sender = voters[msg.sender];
        if (sender.voted || toProposal >= proposals.length) return;
        sender.vote = toProposal;
        sender.voted = true;
        proposals[toProposal].voteCount =
            proposals[toProposal].voteCount +
            sender.weight;
    }

    function winningProposal() public constant returns (uint256) {
        uint256 winnigCountProposal = 0;
        for (uint256 i = 0; i < proposals.length; i++) {
            if (proposals[i].voteCount > winningCountProposal) {
                winningCountProposal = proposals[i].voteCount;
            }
        }
        return winningCountProposal;
    }
}
