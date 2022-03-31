// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 

 

contract Order {      

    uint256 _balance ; 

    constructor() public payable { 
        _balance = msg.value; 
    } 

     
    function NewOrder(address payable _seller) public returns (uint256)  {      
        uint256 oldBalance = _balance; 
        _balance = _balance - 10000000000000000; 
        _seller.send(1 ether); 
        assert(_balance == (oldBalance – 10000000000000000 ));         
    } 
} 