pragma solidity ^0.8.9; 
 
error InvalidIntegerValue(uint256 intValue);

contract RevertContract {      
     
    function RevertValidInt8(uint256 myNumber) public  returns (uint8)  {      
        if (myNumber < 0 || myNumber > 255){ 
            revert InvalidIntegerValue(myNumber);
        } 
    
        return uint8(myNumber);         
    } 
} 