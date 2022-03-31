// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

contract MultiSigContract {
    address ownerOne;
    address ownerTwo;
    mapping(address => bool) vote;

    constructor() public {
        ownerOne = 0xaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa;
        ownerTwo = 0xbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb;
    }

    function Vote() public {
        require (msg.sender == ownerOne || msg.sender == ownerTwo);
        require (vote[msg.sender] == false);
        vote[msg.sender] = true;
    }

    function VoteStatus() public returns (string) {
        require (vote[ownerOne] == true && vote[ownerTwo] == true);
        
        //execute your logic
        vote[ownerOne] = false;
        vote[ownerTwo] = false;
    }

}