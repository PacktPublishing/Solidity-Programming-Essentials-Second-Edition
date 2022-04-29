// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 

 

contract Order {      

    uint256 _balance ; 

    constructor() payable { 
        _balance = msg.value; 
    } 

     
    function NewOrder(address payable _seller) public  {      
        uint256 oldBalance = _balance; 
        _balance = _balance - 1000000000000000000; 
        _seller.send(1 ether); 
        assert( _balance == (oldBalance - 1000000000000000000) );         
    } 
} 