// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 

 
contract ForLoopExampleBreak { 

    mapping (uint => uint) blockNumber; 
    uint counter; 

    event uintNumber(uint); 

    function setNumber() public { 
        blockNumber[counter++] = block.number; 
    } 

 
    function getNumbers() public { 
        for (uint i=0; i < counter; i++){ 
            if (i == 1) 
                break; 
            emit uintNumber(blockNumber[i]); 
        } 
    } 
} 