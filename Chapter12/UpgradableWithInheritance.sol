// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract BankStorage {
    mapping (address => uint256) public balances ;
}

contract Bank is BankStorage {

    constructor (uint256 amount)  {
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

    constructor(address bankc)  {
        bankContract = Bank(bankc);
    }

    function NewBankAddress(address bankc) public {
        bankContract = Bank(bankc);
    }

    function NewTransaction( address to, uint256 amount) public returns (bool) {
        bankContract.Debit(msg.sender, amount);
        bankContract.Credit(to, amount);
        return true;
    }

}



contract NewBank is BankStorage {

    constructor (uint256 amount)  {
        balances[msg.sender] = amount;
    }

    function Debit(address accountAddress, uint256 amount) public returns (bool) {
        require(balances[accountAddress] + amount >= amount);   
        balances[accountAddress] = balances[accountAddress] - amount;
        return true;
    }

    function Credit(address accountAddress,uint256 amount) public returns (bool) {
        require(balances[accountAddress] - amount <= amount);
        balances[accountAddress] = balances[accountAddress] + amount;
        return true;

    }

}