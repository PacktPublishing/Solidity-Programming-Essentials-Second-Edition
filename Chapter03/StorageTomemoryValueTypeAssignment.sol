// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 

contract StorageTomemoryValueTypeAssignment { 

    uint stateVar = 20; 

    function getUInt() public returns (uint) 
    { 
      uint localVar = 40; 
      localVar = stateVar; 
      stateVar = 50; 
      return localVar; // returns 20 
   } 
} 