// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 

contract HelloWorld {

  uint private simpleInt;
  
  constructor() {
    simpleInt = 5;
  }

  function GetValue() public view returns (uint) {
    return simpleInt;
  }

  function SetValue(uint _value) public {
    simpleInt = _value;
  }
}