// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9; 

contract PureFunction {
    function GetTenerValue(int _data) public pure returns (int)  {
            return _data * 10;
    }
}