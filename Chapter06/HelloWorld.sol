// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 

contract HelloWorld {
  uint private simpleInt;

  function getValue() public view returns (uint) {
     return simpleInt;
  }

  function setValue(uint _value) public {
    simpleInt = _value; 
  }
}

contract Client {

  function UseNewKeyword() public returns (uint) {
   HelloWorld myObj = new HelloWorld();
   myObj.setValue(10);
   return myObj.getValue();
  }
}