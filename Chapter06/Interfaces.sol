// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9; 

interface IHelloWorld {
   function GetValue() external view returns (uint);
   function SetValue(uint _value) external;
}

contract HelloWorld is IHelloWorld{
  uint private simpleInteger;
 
  function GetValue() public view returns (uint) {
    return simpleInteger;
  }

  function SetValue(uint _value) public {
   simpleInteger = _value;
  }
}

contract Client {
 function GetSetIntegerValue() public returns (uint) {
    IHelloWorld myObj = new HelloWorld();
    myObj.SetValue(100);
    return myObj.GetValue() + 10;
  }
}