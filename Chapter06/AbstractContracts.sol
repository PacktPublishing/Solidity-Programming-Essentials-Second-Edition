// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9; 

abstract contract AbstractHelloWorld {
  function GetValue() virtual public view returns (uint);
  function SetValue(uint _value) virtual public;

  function AddNumber(uint _value) virtual public returns (uint) {
    return _value;
  }
}

contract HelloWorld is AbstractHelloWorld{
  uint private simpleInteger;

  function GetValue() override public view returns (uint) {
    return simpleInteger;
  }
 
  function SetValue(uint _value) override public {
   simpleInteger = _value;
  }

  function AddNumber(uint _value) override public view returns (uint){
   return (simpleInteger + _value);
  }
}

contract Client {
  AbstractHelloWorld myObj;

  constructor() {
    myObj = new HelloWorld();
  }

  function GetIntegerValue() public returns (uint) {
    myObj.SetValue(100);
    return myObj.AddNumber(200) + 10;
  }
}