// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9; 

contract FunctionPloymorphism
{
  function GetVariableData(int8 data) public pure returns(int8)
  {
     return data;
   }

  function GetVariableData(int16 data) public pure returns(int16)
  {
     return data;
   }
}