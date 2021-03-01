pragma solidity ^0.5.0;

contract Crud {
    
    struct User {   /*no instances created here*/
        uint id;
        string name;
    }
    
    User[] public users;
    uint public nextId = 1;
    
    function create(string memory name) public {
        users.push(User(nextId, name));
        nextId++;
    } 
    
    
    /*memory because string it's a complex type*/
    /*In solidity a function can return multiple values*/
    function read(uint id) view public returns(uint, string memory){
        uint i=find(id);
        return(users[i].id, users[i].name);
    }
    
    
    function update(uint id, string memory name) public {
        uint i = find(id);
        users[i].name = name;
    }
    
    
    /*when i destroy an user, the id still exist.. that's not the correct way, i need to excalate the other array elements in order
    to get the revert message--- i set next id to 1 in order to avoid this*/
    function destroy(uint id) public{       
        uint i = find(id);
        delete users[id];
    }
    
    
    /*this function finds the i value in an array*/
    function find(uint id) view internal returns(uint) {
        for(uint i=0; i < users.length; i++) {
            if(users[i].id == id) {
                return i;
            }
        }
    revert('User does not exist!');
    }
    
    
    
}
