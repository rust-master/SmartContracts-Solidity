pragma solidity ^0.8.0;

contract Bidder {
    string public name;
    uint256 public bidAmount = 20000;
    bool public eligible;
    uint256 constant minBid = 1000;

    function setName(string memory _name) public {
        name = _name;
    }

    function setBidAmount(uint256 _bidAmount) public {
        bidAmount = _bidAmount;
    }

    function determinEligibility() public {
        if (bidAmount >= minBid) eligible = true;
        else eligible = false;
    }
}
