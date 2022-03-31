// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9; 

contract ContractWithModifier {
    address owner;
    int public mydata;
    
    constructor(){
        owner = msg.sender;
    }
    
    modifier isOwner {
        // require(msg.sender == owner);
        if(msg.sender == owner) {
            _;
        }
    }
    
    function AssignDoubleValue(int _data) public isOwner {
            mydata = _data * 2;
    }
    
    function AssignTenerValue(int _data) public  {
            mydata = _data * 10;
    }
}