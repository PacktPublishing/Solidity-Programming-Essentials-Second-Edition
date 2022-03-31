// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 

contract ConversionDemo {
    
    function ConversionExplicitUINT8toUINT256() pure public returns (uint){ 
        uint8 myVariable = 10; 
        uint256 someVariable = myVariable; 
        return someVariable; 
    }

    function ConversionExplicitUINT256toUINT8() pure public returns (uint8){ 
        uint256 myVariable = 10; 
        uint8 someVariable = uint8(myVariable); 
        return someVariable; 
    } 

    function Conversions() pure public { 
        uint256 myVariable = 10000134; 
        uint8 someVariable  = 100; 
        bytes4 byte4 = 0x65666768; 

        // bytes1 byte1 = 0x656667668; //error  
        bytes1 byte1 = 0x65; 

        //  byte1 = byte4; //error, explicit conversion needed here 
        byte1 = bytes1(byte4) ; //explicit conversion 
        byte4 = byte1;  //Implicit conversion 
        // uint8 someVariable = myVariable; // error, explicit conversion needed here 

        myVariable = someVariable; //Implicit conversion  
        string memory name = "Ritesh"; 
        bytes memory nameInBytes = bytes(name); //explicit string to bytes conversion 
        name = string(nameInBytes); //explicit bytes to string conversion 
    } 
}




