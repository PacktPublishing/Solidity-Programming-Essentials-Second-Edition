// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

contract MultiSigContract {
    address ownerOne;
    address ownerTwo;
    mapping(address => bool) vote;

    constructor()  {
        ownerOne = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
        ownerTwo = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    }

    function Vote() public {
        require (msg.sender == ownerOne || msg.sender == ownerTwo);
        require (vote[msg.sender] == false);
        vote[msg.sender] = true;
    }

    function VoteStatus() public returns (bool) {
        require (vote[ownerOne] == true && vote[ownerTwo] == true);
        
        //execute your logic
        vote[ownerOne] = false;
        vote[ownerTwo] = false;
        return true;
    }

}