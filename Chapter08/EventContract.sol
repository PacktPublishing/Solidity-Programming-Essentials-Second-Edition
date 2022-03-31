// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 


contract EventContract {      

    event LogFunctionFlow(string); 

    function ValidInt8(uint256 myNumber) public  returns (uint8)  {      
        emit LogFunctionFlow("within function ValidInt8"); 
        if (myNumber < 0 || myNumber > 255){ 
            revert("not a valid int8 value"); 
        } 
        emit LogFunctionFlow("Value is within expected range !"); 

        emit LogFunctionFlow("returning value from function"); 
        return uint8(myNumber);         
    } 
} 