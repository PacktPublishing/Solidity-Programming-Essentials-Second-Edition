// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 

 

contract MoreRequireUsageContract {      

    uint256 _totalSupply  = 1000000000000; 
    address _king = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; 

    function MoreRequireUsageFunction(uint256 myNumber, address owner) public payable returns (bool status)  {      
        require((_totalSupply + myNumber) > _totalSupply); 
        require(myNumber >= 0); 
        require(owner != address(0)); 
        require(owner == _king);
        return true;         

    } 

 

} 