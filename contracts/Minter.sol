pragma solidity ^0.8.0;

contract Coin {
    address minter;
    mapping(address => uint256) balances;

    event Sent(address from, address to, uint256 value);

    constructor() {
        minter = msg.sender;
    }

    function mint(address receiver, uint256 value) public {
        if (msg.sender != minter) return;
        balances[receiver] += value;
    }

    function send(address receiver, uint256 value) public {
        if (balances[msg.sender] < value) return;
        balances[msg.sender] -= value;
        balances[receiver] += value;
        emit Sent(msg.sender, receiver, value);
    }
}
