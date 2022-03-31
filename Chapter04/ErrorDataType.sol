// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 

contract ErrorDataType {
    
    function hoistingDemo() returns (uint){
        
        uint8 someVar = 100;
        someVar = 300; //error

        
    }
    
}




