pragma solidity ^0.8.4;

contract Coin {
    
    address public minter;                      // declaring variable of type address(160 bits) 
                                                // minter means one who produce/ mint  coin 
    mapping (address => uint) public  balances; // mapping types maps addresses to uint 
    
    event  Sent(address from, address to, uint amount);
    
    constructor() {   //constructor  will executed during the creation of contract & can't be called afterwards. 
        minter = msg.sender; //it permanently store the address of person created contract.
        
    }
    
    function mint(address receiver, uint amount) public {  //this function can only call by creator of the contract.
        require(msg.sender == minter);  // send an amount of newly created coins to another address.
        balances[receiver] += amount;
        
    }
    
    error InsufficientBalance(uint requested, uint available);
    
    function send(address receiver, uint amount ) public { // function for sending coins to another address. 
        if (amount > balances[msg.sender])                 // if condition met / pass.
            revert InsufficientBalance({
                requested: amount,
                available:balance[msg.sender]
                
            });
            
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
        
    }
    
}