// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 

 

contract AllAboutInts { 

    uint  stateUInt = 20; //state variable 
    uint  stateInt = 20; //state variable 

    function UIntAssignment(uint incomingValue) public 
    { 
        uint memoryuint = 256; 
        uint256 memoryuint256 = 256; 
        uint8 memoruint8 = 8; //can store value from 0 up to 255 

        //addition of two uint8 
        uint256 result = memoruint8 + memoryuint; 
    } 

     
    function IntAssignment(int incomingValue) public 
    { 
        int memoryInt = 256; 
        int256 memoryInt256 = 256; 
        int8 memoryInt8 = 8; //can store value from -128 to 127 
    } 

} 