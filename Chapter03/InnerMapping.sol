// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 


contract DemoInnerMapping { 

    mapping (uint => mapping(address => string)) accountDetails; 

    uint counter; 

    function addtoMapping(address addressDetails, bytes memory name) public returns (uint) { 
        string memory names = string(name); 
        counter = counter + 1; 
        accountDetails[counter][addressDetails] = names; 
        return counter;  
    } 


   function getMappingMember(address addressDetails) public view returns (bytes memory) { 
        // 0xca35b7d915458ef540ade6068dfe2f44e8fa733c 
      return bytes( accountDetails[counter][addressDetails]); 
    } 
} 