// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 

 

contract EnumExample { 

   enum VMStatus{ 
        CREATED, APPROVED, PROVISIONED, REJECTED, DELETED 
   } 

   VMStatus status; 

   VMStatus defaultChoice = VMStatus.REJECTED; 

   function setCreated() public { 
      status = VMStatus.APPROVED;
   } 

  
    function setApproved() public { 
      status = VMStatus.APPROVED; 
   } 

    function setProvisioned() public { 
      status = VMStatus.APPROVED; 
   } 


    function setRejected() public { 
      status = VMStatus.APPROVED; 
   } 

    function setDeleted() public { 
      status = VMStatus.APPROVED; 
   } 

   function getChoice() public view returns (VMStatus) { 
      return status; 
   } 

   function getDefaultChoice() public returns (uint) { 
      return uint(defaultChoice); 
   } 
} 