// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 


contract ForLoopExampleContinue { 

    mapping (uint => uint) blockNumber; 
    uint counter; 

    event uintNumber(uint); 

    function setNumber() public  { 
        blockNumber[counter++] = block.number; 
    } 


    function getNumbers() public { 
        for (uint i=0; i < counter; i++){ 
            if ((i > 5) ) 
               { continue;} 
            emit uintNumber(blockNumber[i]); 
        } 
    } 
} 