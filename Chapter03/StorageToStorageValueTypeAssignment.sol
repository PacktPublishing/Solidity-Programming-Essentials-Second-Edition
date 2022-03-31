// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 

 
contract StorageToStorageValueTypeAssignment { 
    uint stateVar1 = 20; 
    uint stateVar2 = 40; 

    // does not copy. these are two separate state variables. The values are individual  
    function getUInt() public returns (uint) 
    { 
        stateVar1 = stateVar2; 
        stateVar2 = 50; 
        return stateVar1; // returns 40 
    } 
} 