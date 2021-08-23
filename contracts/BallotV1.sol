pragma solidity ^0.8.0;

contract Ballot {
    
    struct Voter {
        uint weight;
        bool voted;
        uint vote;
    }

    struct Proposal {
        uint voteCount;
    }

    address chairperson;
    mapping(address => Voter) voters;
    Proposal[] proposals;

    constructor(uint _numProposals) {
        chairperson = msg.sender;
        voters[chairperson].weight = 2;
        proposals.length = _numProposals;
    }
    
    function register(address toVoter) public {
        if (msg.sender != chairperson || voters[toVoter].voted) return;
        voters[toVoter].weight = 1;
        voters[toVoter].voted = false;
    }

    function vote (uint toProposal) public {
        Voter storage sender = voters[msg.sender];
        if (sender.voted || toProposal >= proposals.length) return;
        sender.vote = toProposal;
        sender.voted = true;
        proposals[toProposal].voteCount = proposals[toProposal].voteCount + sender.weight;
    }

    function winningProposal() public constant returns (uint) {
        uint winnigCountProposal = 0;
        for (uint i = 0; i < proposals.length; i++) {
            if (proposals[i].voteCount > winningCountProposal) {
                winningCountProposal = proposals[i].voteCount;
            }
        }
        return winningCountProposal;
    }
} 