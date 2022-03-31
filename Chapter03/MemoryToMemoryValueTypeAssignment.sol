// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 

 
contract MemoryToMemoryValueTypeAssignment { 

    function getUInt() public returns (uint) 
    { 
      uint localVar1 = 40; 
      uint localVar2 = 80; 
      localVar1 = localVar2; 
      localVar2 = 100; 
      return localVar1; // returns 80 
    } 
} 