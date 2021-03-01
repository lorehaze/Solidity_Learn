pragma solidity ^0.5.0;

contract AdvancedStorage {
    uint[] public ids;
    
    /* here i don't specify view or pure because i want to modify the storage of the blockchain*/ 
    function add(uint id) public {
        ids.push(id);   /*push allow me to add elements in the array*/
    } 
    
    /*here i specify the view keyword because it's a read only function*/
    function get(uint position) view public returns(uint) {
        return ids[position]; /*square bracket syntax to return element in an array*/
    }
    
    function getAll() view public returns(uint[] memory) {  /*here i need "memory" because i'm using array*/
        return ids; /*return the entire array*/
    }
    
    function length() view public returns(uint) {
        return ids.length;     /*get the length of an array*/
    }
    
}
