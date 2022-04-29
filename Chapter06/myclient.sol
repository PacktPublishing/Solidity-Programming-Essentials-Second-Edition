// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "./IMath.sol";

contract Client {
    function CallSquare(address targetContract, uint256 inputValue) public returns (uint256) {
        IMaths targetMathematics = IMaths(targetContract);
        return targetMathematics.GetSquare(value);
    }
}

