// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 

contract ParentContract {
  uint internal simpleInteger;

  function SetInteger(uint _value) external {
    simpleInteger = _value;
  }
}

contract ChildContract is ParentContract {
  bool private simpleBool;
 
  function GetInteger() public view returns (uint) {
    return simpleInteger;
  }
}

contract Client {
  ChildContract pc = new ChildContract();
  
  function workWithInheritance() public returns (uint) {
      pc.SetInteger(100);
      return pc.GetInteger();
     }
}