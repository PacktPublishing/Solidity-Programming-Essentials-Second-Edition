// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "./mylib.sol";

contract LibraryClient { 
     
     function GetExponential(uint256 firstVal, uint256 secondVal) public returns(uint256) { 
        return MyMathlibrary.exponential(firstVal, secondVal); 
     } 


} 
