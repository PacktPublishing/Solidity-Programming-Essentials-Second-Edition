// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9; 

contract ContractWithoutModifier {
    address owner;
    int public mydata;
    
    constructor(){
        owner = msg.sender;
    }
    
    function AssignDoubleValue(int _data) public  {
        if(msg.sender == owner) {
            mydata = _data * 2;
        }
    }
    
    function AssignTenerValue(int _data) public  {
        if(msg.sender == owner) {
            mydata = _data * 10;
        }
    }
}

