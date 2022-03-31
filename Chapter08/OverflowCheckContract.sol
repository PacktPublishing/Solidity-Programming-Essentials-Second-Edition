// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 

 
contract OverflowCheckContract {      

    function OverflowCheckFunction(uint256 myNumber) public returns (uint8)  {      
        require(myNumber >= 0); 
        require(myNumber <= 255); 
        uint8 val = 20; 
        assert (myNumber + val <= 255); 
        return uint8(myNumber + val); 
    } 
} 