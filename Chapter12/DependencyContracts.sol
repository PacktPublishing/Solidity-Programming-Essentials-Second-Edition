pragma solidity ^0.8.3;

contract IndependentContract {

    mapping (address => uint256) balances;

    constructor (uint256 amount) public {
        balances[msg.sender] = amount;
    }

}

contract DependentSmartContract {

    IndependentContract indeContract;

    constructor(address indc) public {
        indeContract = IndependentContract(indc);
    }
}