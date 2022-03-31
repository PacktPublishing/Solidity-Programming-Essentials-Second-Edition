// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 

 

contract whileLoop { 

    mapping (uint => uint) blockNumber; 
    uint counter; 

    event uintNumber(uint); 

    function setNumber() public { 
        blockNumber[counter++] = block.number; 
    } 

 
    function getNumbers() public { 
       uint i = 0; 
       while (i < counter) { 
           emit uintNumber( blockNumber[i]  ); 
           i = i + 1; 
       } 
    } 
} 