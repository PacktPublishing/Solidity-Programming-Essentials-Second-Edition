// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 

 

contract RequireUsageContract {      
    function RequireValidInt8(uint256 myNumber) public  returns (uint256)  {      
        require( myNumber >= 0, “Number cannot be less than 0” ); 
        require( myNumber <= 255, “Number cannot be greater than 255” ); 
    
        return myNumber;         
    } 
 
    function RequireIsEven(uint256 myNumber) public returns (bool)  {      
        require( myNumber % 2 == 0 ); 
 
        return true;         
    } 
     
} 