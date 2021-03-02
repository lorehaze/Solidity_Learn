pragma solidity ^0.5.0;

//msg.sender is always the person who initiate the transaction even if the smart contract is calling the function
//tr.origin is the object that initiate the transaction.. if a smart contract is calling, it's address will be the origin

contract ERC20Token{
    string public name ;
     mapping(address => uint256) public balances;
    
    function mint() public{
        balances[tx.origin] ++; //buy 1 token
    }
}

contract MyContract {

    address payable wallet;
    address token;
    
    //if i use address indexed _buyer i need to know the specific person's address, i restrict the access
    //possible use case: i want to filter peoples applicable to me
    
    event Purchase(         //inform about address and amount
        address _buyer,
        uint256 _amount
    );
    
    constructor(address payable _wallet, address _token) public {
        wallet = _wallet;
        token = _token;
    }

    function() external payable {       //external are callable only from the outside 
        buyToken();
    }

    function buyToken() public payable{ //payable allows the function to accept transactions
    ERC20Token _token = ERC20Token(address(token));
    wallet.transfer(msg.value);
    
    _token.mint();
        //send to the wallet
        emit Purchase(msg.sender,1);  //when the purchase is complete, the event will inform the buyer of the address and amount
    }
}
