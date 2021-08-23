pragma solidity ^0.8.0;

contract Coin {
    address minter;
    mapping (address => uint) balances;
    
    event Sent(address from, address to, uint value);

    constructor() {
        minter = msg.sender;
    }

    function mint(address receiver, uint value) public {
        if (msg.sender != minter) return;
        balances[receiver] += value;
    }

    function send(address receiver, uint value) public {
        if (balances[msg.sender] < value) return;
        balances[msg.sender] -= value;
        balances[receiver] += value;
        emit Sent(msg.sender, receiver, value);
    }
}