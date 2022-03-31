pragma solidity ^0.8.3;

contract IndependentContract {

    mapping (address => uint256) balances;

    constructor (uint256 amount) public {
        balances[msg.sender] = amount;
    }
}

contract DependentSmartContract {

    IndependentContract indeContract;

    constructor(address bankc) public {
        indeContract = IndependentContract(bankc);
    }

    function changeContractAddress(address _address) public {
        indeContract = IndependentContract(_address);
    }
}