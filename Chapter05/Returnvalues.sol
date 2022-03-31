// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 

contract ReturnValues { 

    uint counter; 

    function setNumber() public { 
       counter = block.number; 
    } 


    function getBlockNumber() public view returns (uint) { 
        return counter; 
    } 

     
    function getBlockNumber1() public view returns (uint result) { 
        result =  counter; 
    } 
} 