pragma solidity ^0.5.0;

contract People{
    uint256 public peopleCount=0;
    
    uint256 openingTime = 1614641016; /*current time by unix dpoch converter*/
    
    mapping(uint => Person) public people; /*uint is gonna be the key and the person is gonna be the value*/
    
    address owner;
    
    /*this makes the tansaction possible only to the address owner*/
    modifier onlyOwner() {
       require(msg.sender == owner);
       _; 
    }
    
    modifier onlyWhileOpen(){
        require(block.timestamp >= openingTime);
        _;
    }
    
    struct Person{
        uint _id;
        string _FirstName; 
        string _LastName;
    }
    
    
    constructor() public{
        owner = msg.sender;
    }
    
    
    function addPerson(string memory _firstname, string memory _lastname) public onlyOwner onlyWhileOpen {
        incrementCount();
        people[peopleCount] = Person(peopleCount, _firstname, _lastname);
    }
    
    function incrementCount() internal{
        peopleCount += 1; 
    }
    
    
    
}
