// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 


contract ForLoopExample { 

    mapping (uint => uint) blockNumber; 
    uint counter; 

    event uintNumber(uint); 

    function SsetNumber() public { 
        blockNumber[counter++] = block.number; 
    } 


    function getNumbers()  public{ 
        for (uint i=0; i < counter; i++){ 
            emit uintNumber( blockNumber[i]  ); 
        } 
    } 
} 