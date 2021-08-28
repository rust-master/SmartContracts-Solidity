pragma solidity ^0.8.0;

contract GasCont {
    
    string public message;
    uint public gas;
    
    // set the message function
    function setMessage(string memory _message) public {
        message = _message;
        gas = gasleft();
    }
}