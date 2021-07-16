pragma solidity ^0.8.0;

contract SingleStorage {
    string value;
    
    constructor() {
        value = "Myvalue";
    }
    
    function get() public view returns(string memory) {
        return value;
    }
    
    function set(string memory _value) public {
        value = _value;
    }
}