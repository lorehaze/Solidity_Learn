pragma solidity ^0.5.0;

/*pure keyworkds says that i don't want to modify the blockchain*/

contract HelloWorld {
    function hello() pure public returns(string memory) { /*with "returns" i can return any type by specifyinv the type in brackets / memory says that i don't want to store it*/
        return 'Hello World';
    }
}
