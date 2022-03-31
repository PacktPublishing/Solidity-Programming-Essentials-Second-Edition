// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 

contract MappingLooping { 
    mapping (uint => address) Names; 
    uint counter; 

    function addtoMapping(address addressDetails) public returns (uint) 
    { 
      counter = counter + 1; 
      Names[counter] = addressDetails; 
      return counter;  
    } 

   function getMappingMember() public view returns (address[] memory) { 
      address[] memory localBytes = new address[](counter); 
      for(uint i=1; i<= counter; i++){ 
          localBytes[i - 1] = Names[i]; 
      } 
      return localBytes; 
    } 
} 