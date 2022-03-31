// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 

 

contract IfElseExample { 


    enum requestState {created, approved, provisioned, rejected, deleted, none} 


    function StateManagement(uint8 _state) public returns (int result) { 
       requestState currentState = requestState(_state); 

       if(currentState == requestState(1)){ 
           result = 1; 
       } else if ((currentState == requestState.approved) || (currentState == requestState.provisioned)) { 
           result = 2; 
       } else { 
           currentState == requestState.none; 
           result = 3; 
       } 
    } 
} 