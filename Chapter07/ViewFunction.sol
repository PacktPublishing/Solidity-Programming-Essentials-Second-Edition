// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9; 

contract ViewFunction {
    function GetTenerValue(int _data) public view returns (int)  {
            return _data * 10;
    }
}

