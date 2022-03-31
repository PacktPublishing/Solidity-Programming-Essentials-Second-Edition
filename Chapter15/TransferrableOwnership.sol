// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 

contract ownable {
    address owner;
    
    constructor() public {
        owner = msg.sender;
    }

    modifier onlyowner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address newOwner) onlyowner public {
        owner = newOwner;
    }

}

contract myICO is ownable {
    uint8 _amount;

    function Withdraw(uint8 amount) onlyowner public {
        _amount = amount;
    }

}