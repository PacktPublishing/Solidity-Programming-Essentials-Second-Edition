// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9; 

contract ParentContract {
  uint internal simpleInteger;

  function SetInteger(uint _value) public {
    simpleInteger = _value;
  }

  function GetInteger() virtual public view returns (uint) {
    return 10;
  }
}

contract ChildContract is ParentContract {
  function GetInteger() override public view returns (uint) {
    return simpleInteger;
  }
}

contract Client {
  ParentContract pc = new ChildContract();
  
  function WorkWithInheritance() public returns (uint) {
      pc.SetInteger(100);
      return pc.GetInteger();
     }
}