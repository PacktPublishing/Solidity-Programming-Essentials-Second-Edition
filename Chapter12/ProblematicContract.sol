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

contract Bank {

    mapping (address => uint256) public balances ;

    constructor( uint256 amount)  {
        balances[msg.sender] = amount;
    }

    function Debit(address accountAddress, uint256 amount) public returns (bool) {
        balances[accountAddress] = balances[accountAddress] - amount;
        return true;
    }

    function Credit(address accountAddress,uint256 amount) public returns (bool) {
        balances[accountAddress] = balances[accountAddress] + amount;
        return true;
    }

}

contract BankClient {

    Bank bankContract;

    constructor(address bankc) {
        bankContract = Bank(bankc);
    }

    function NewTransaction( address to, uint256 amount) public returns (bool) {
        bankContract.Debit(msg.sender, amount);
        bankContract.Credit(to, amount);
        return true;
    }

}