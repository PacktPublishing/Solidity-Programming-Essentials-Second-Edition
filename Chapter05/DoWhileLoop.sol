pragma solidity ^0.8.9; 

 

// SPDX-License-Identifier: MIT

contract DowhileLoop { 

    mapping (uint => uint) blockNumber; 
    uint counter; 

    event uintNumber(uint); 

    function setNumber() public  { 
        blockNumber[counter++] = block.number; 
    } 

 
    function getNumbers() public { 
       uint i = 0; 
       do  { 
           emit uintNumber( blockNumber[i]  ); 
           i = i + 1; 
       } while (i < counter); 
    } 
} 