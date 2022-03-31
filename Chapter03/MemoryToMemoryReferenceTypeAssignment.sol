// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 

 
contract MemoryToMemoryReferenceTypeAssignment { 

    function getUInt() public returns (uint) 
    { 
        uint[] memory someVar = new uint[](1); 
        someVar[0] = 23; 
        uint[] memory  otherVar = someVar;  
        someVar[0] = 45; 
        return (otherVar[0]); //returns 45 
    } 
} 