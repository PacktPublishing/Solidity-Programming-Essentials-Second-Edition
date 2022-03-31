// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 

 

contract StorageToStorageReferenceTypeAssignment { 

    uint[2] stateArray1 = [uint(1), 2]; 
    uint[2] stateArray2 = [uint(3), 4]; 

    // does not copy. these are two separate state variables. The values are individual  
    function getUInt() public returns (uint) 
    { 
        stateArray1 = stateArray2; 
        stateArray2[1] = 5; 
        return stateArray1[1]; // returns 4 
    } 
} 