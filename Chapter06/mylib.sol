// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

library MyMathlibrary {
    function sum( uint256 a, uint256 b) public returns (uint256) {
        return a + b ;
    }

    function exponential( uint256 a, uint256 b) public returns (uint256) {
        return a ** b ;
    }
}

contract MyMathContract {
    function sum( uint256 a, uint256 b) public returns (uint256) {
        return a + b ;
    }
}