pragma solidity ^0.5.0;

contract SimpleStorage {

    string public data;
    
    function set(string memory _data) public {
        data = _data;
        
    }
        
        /* view reads the value of the storage in a smart contract - read only*/
    function get() view public returns(string memory){
        return data;
    }
    
}
