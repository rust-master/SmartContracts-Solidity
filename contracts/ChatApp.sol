pragma solidity ^0.8.0;

// write chatapp contract in solidity
contract ChatApp {
    // the chat message
    string public message;
    // the chat message sender
    address public sender;
    // the chat message timestamp
    uint public timestamp;
    // the chat message signature
    bytes public signature;
    // the chat message signature hash
    bytes public signatureHash;
    // the chat message signature valid
    bool public signatureValid;
    // write get and set methods for message
    function getMessage() view public returns (string memory) {
        return message;
    }
    function setMessage(string memory _message) public {
        message = _message;
    }
}