// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
contract First { 
        int public mydata; 
        function GetDouble(int _data) public returns (int _output) { 
                   mydata = _data * 2; 
                   return mydata; 
         } 
     } 