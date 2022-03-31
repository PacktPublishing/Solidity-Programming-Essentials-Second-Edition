// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 


contract StorageToMemoryReferenceTypeAssignment { 

    uint[2] stateArray3 = [uint(1), 2]; 

    function getUInt() public returns (uint) 
    { 
      uint[2] memory localArray = stateArray3; 
      stateArray3[1] = 5; 
      return localArray[1]; // returns 2 
    } 
} 