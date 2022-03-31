// SPDX-License-Identifier: MIT


pragma solidity ^0.8.9; 

contract MemoryToStorageValueTypeAssignment { 

    uint stateVar = 20; 

    function getUInt() public returns (uint) 
    { 
      uint localVar = 40; 
      stateVar = localVar; 
      localVar = 50; 
      return stateVar; // returns 40 
    } 
} 