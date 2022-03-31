// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9; 

contract EtherBox {

    event logme(string);
    fallback() external payable {
        emit logme("fallback called");
    }
}