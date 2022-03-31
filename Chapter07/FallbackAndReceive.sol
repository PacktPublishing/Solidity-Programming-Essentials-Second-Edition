// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9; 

contract EtherBox {
    uint balance;
    event logme(string);
    
    function SetBalance() public {
        balance = balance + 10;
    }
    
    function GetBalance() public payable returns(uint) {
       return balance;
    }

    receive() external payable {
            emit logme("receive called");
        }

    fallback() external payable {
        emit logme("fallback called");
    }
}

contract UsingCall {
    constructor() payable  {
    }

    function SimpleCall() public returns (uint) {
       // bool status = true;
        EtherBox eb = new EtherBox();
        address myaddr = address(eb);
        bytes memory payload = abi.encodeWithSignature("SetBalance()");
        (bool success, bytes memory returnData) = myaddr.call(payload);
        require(success);
        return eb.GetBalance();
    }

    function SimpleCallwithGas() public returns (bool) {
        EtherBox eb = new EtherBox();
        address myaddr = address(eb);
        //status =   myaddr.call.gas(200000)(bytes4(sha256("GetBalance()")));
        bytes memory payload = abi.encodeWithSignature("SetBalance()");
        (bool success, bytes memory returnData) = myaddr.call{gas: 200000}(payload);
        return success;
    }

    function SimpleCallwithGasAndValue() public returns (bool) {
        EtherBox eb = new EtherBox();
        address myaddr = address(eb);
        bytes memory payload = abi.encodeWithSignature("GetBalance()");
        (bool success, bytes memory returnData) = myaddr.call{gas: 200000, value: 1 ether}(payload);
        return success;
    }
    
    function SimpleCallwithGasAndValueWithWrongName() public returns (bool) {
        EtherBox eb = new EtherBox();
        address myaddr = address(eb);
        bytes memory payload = abi.encodeWithSignature("GetBalance1()");
        (bool success, bytes memory returnData) = myaddr.call(payload);
        return success;
    }

    function SendEther() public returns (bool) {
        EtherBox eb = new EtherBox();
        address payable myaddr = payable(eb);
        myaddr.transfer(1000000000000000000);
        return true;
    }
}
