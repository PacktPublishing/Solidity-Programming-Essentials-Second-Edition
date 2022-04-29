// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "./IMath.sol";


contract Mathematics is IMaths  {
    function GetSquare(uint256 value) external pure returns (uint256) {
        return value ** 2;
    }
}

