// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 

 

contract GeneralMapping { 

    mapping (uint => address) Names; 
    uint counter; 

    function addtoMapping(address addressDetails) public returns (uint) 
    { 
        counter = counter + 1; 
        Names[counter] = addressDetails; 
        return counter; //returns false 
    } 

   function getMappingMember(uint id) public view returns (address) 
    { 
      return Names[id]; 
    }
} 