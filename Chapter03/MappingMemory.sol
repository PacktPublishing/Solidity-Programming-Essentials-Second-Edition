// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 

 

contract MappinginMemory { 

    mapping (uint => address) Names; 
    uint counter; 

    function addtoMapping(address addressDetails) public returns (uint) { 
      counter = counter + 1; 
      mapping (uint => address) storage localNames = Names; 

      localNames[counter] = addressDetails;
      return counter;  
    } 

   function getMappingMember(uint id) public view returns (address) { 
      return Names[id]; 
    } 
} 