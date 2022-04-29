// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
import "./first.sol"; 
         contract Second { 
                address firstAddress;  
                int public _data; 
               constructor(address _first) { 
                   firstAddress = _first; 
               } 
              function SetData() public { 
                 First h = First(firstAddress); 
                _data = h.GetDouble(21); 
             } 
       } 