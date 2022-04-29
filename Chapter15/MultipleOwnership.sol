// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

contract multiownable {
    mapping (address => bool) isOwner;
    address owner;
    address[] owners;

    constructor()  {
        owners.push(msg.sender);
        isOwner[msg.sender] = true;
        owner = msg.sender;
    }

    function addowners(address additionalAddresses) public onlyowner {
        owners.push(additionalAddresses);
        isOwner[additionalAddresses] = true;
    }

    modifier onlyowner {
        require(msg.sender == owner);
        _;
    }

    modifier checkOwners {
        require(isOwner[msg.sender] == true);
        _;
    }

}

contract myICO is multiownable {

    uint8 _amount;

    function Withdraw(uint8 amount) checkOwners public {
        _amount = amount;
    }

}