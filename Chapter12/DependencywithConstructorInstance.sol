// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract IndependentContract {

    mapping (address => uint256) balances;

    constructor (uint256 amount) {
        balances[msg.sender] = amount;
    }
}

contract DependentSmartContract {

    IndependentContract indeContract;

    constructor(address bankc) {
        indeContract = IndependentContract(bankc);
    }

    function changeContractAddress(address _address) public {
        indeContract = IndependentContract(_address);
    }
}