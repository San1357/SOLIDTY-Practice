pragma solidity >=0.4.16  < 0.9.0; // line specify code is written for this specific version 


contract Storage {
    uint storedData;                     //declaring state variable of type uint(256 bits)
    
    function set(uint x) public {        //function1 set  will set value .
        storedData = x;
        
        
    }
    
    function get() public view returns (uint){   // function2 get will retrieve value 
        return storedData;
    }
}
