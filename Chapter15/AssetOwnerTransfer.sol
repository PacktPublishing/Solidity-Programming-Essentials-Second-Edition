// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 

contract ownable {
    address owner;
    
    constructor() {
        owner = msg.sender;
    }

    modifier onlyowner {
        require(msg.sender == owner);
        _;
    }

}

contract AssetBank is ownable {
    struct assetHolders {
        bool hasAsset;
        uint256 assetValue;
    }

    mapping (address => assetHolders) balances;

    constructor() {
    }

    modifier legalOwner {
        require(balances[msg.sender].hasAsset == true);
        _;
    }

    function transferAsset(address toAddress, uint256 amount) external legalOwner returns (bool){
        require(toAddress != address(0));
        require(amount > 0 );
        require(balances[msg.sender].assetValue - amount < amount );
        require(balances[toAddress].assetValue + amount > amount );
        
        balances[msg.sender].assetValue = balances[msg.sender].assetValue - amount;
        balances[toAddress].assetValue = balances[toAddress].assetValue + amount;
        
        if (balances[msg.sender].assetValue <= 0) {
            balances[msg.sender].hasAsset = false;
        }
    }

}