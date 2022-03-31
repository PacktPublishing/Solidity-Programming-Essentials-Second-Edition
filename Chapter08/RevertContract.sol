// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 

contract RevertContract {      

    function RevertValidInt8(uint256 myNumber) public  returns (uint8)  {      
        if (myNumber < 0 || myNumber > 255){ 
            revert("not a valid int8 value"); 
        } 
        return uint8(myNumber);         
    } 
} 