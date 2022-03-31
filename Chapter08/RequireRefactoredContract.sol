// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 

 

contract RequireRefactoredContract {      

    uint256 _totalSupply  = 1000000000000; 
    address _king = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; 

    modifier CheckAddressAndIntegers(uint256 myNumber, address owner) { 
        require(myNumber >= 0); 
        require (_totalSupply + myNumber > _totalSupply); 
        require (owner != address(0)); 
        require (owner == _king); 
        _; 
    } 

    function RequireRefactoredFunction(uint256 myNumber, address owner) public CheckAddressAndIntegers(myNumber, owner) returns (bool status)  {      
        return true;         
    } 
} 