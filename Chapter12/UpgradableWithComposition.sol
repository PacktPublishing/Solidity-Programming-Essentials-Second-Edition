// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract BankStorage {
    mapping (address => uint256) public balances ;

    function SetBalance(address addr, uint256 amount) public returns (bool) {
        balances[addr] = amount;
    }

    function GetBalance(address addr) public returns (uint256) {
        return balances[addr];
    }

}


contract Bank{

    BankStorage store;

    constructor (uint256 amount, address bankstorage) public {
        store = BankStorage(bankstorage);
        store.SetBalance(msg.sender, amount);
    }

    function SetBankStorage(address bankstorage) public {
        store = BankStorage(bankstorage);
    }

    function Debit(address accountAddress, uint256 amount) public returns (bool) {
        store.SetBalance(accountAddress, (store.GetBalance(accountAddress) - amount));
        return true;
    }

    function Credit(address accountAddress,uint256 amount) public returns (bool) {
        store.SetBalance(accountAddress, store.GetBalance(accountAddress) + amount);
        return true;
    }

}


contract BankClient {

    Bank bankContract;

    constructor(address bankc) public {
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


contract NewBank {

    BankStorage store;

    constructor (uint256 amount, address bankstorage) public {
        store = BankStorage(bankstorage);
        store.SetBalance(msg.sender, amount);
    }

    function SetBankStorage(address bankstorage) public {
        store = BankStorage(bankstorage);
    }

    function Debit(address accountAddress, uint256 amount) public returns (bool) {
        uint256 tempBalance = store.GetBalance(accountAddress) - amount;
        require(tempBalance >= amount);
        store.SetBalance(accountAddress, tempBalance);
        return true;
    }

    function Credit(address accountAddress,uint256 amount) public returns (bool) {
        uint256 tempBalance = store.GetBalance(accountAddress) + amount;
        require(tempBalance >= amount);
        store.SetBalance(accountAddress, tempBalance);
        return true;
    }

}