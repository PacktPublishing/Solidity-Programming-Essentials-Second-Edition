// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract EtherBox { 
     uint balance; 
     function SetBalance() public { 
        balance = balance + 10; 
     } 
     function GetBalance() public payable returns(uint) { 
        return balance; 
     } 
} 

contract UsingCall { 
     constructor() payable { 
     } 
 
     function SimpleCall() public returns (uint) { 
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
          //status = myaddr.call.gas(200000)(bytes4(sha256("GetBalance()"))); 
          bytes memory payload = abi.encodeWithSignature("SetBalance()"); 
          (bool success, bytes memory returnData) = myaddr.call{gas: 200000}(payload); 
          return success; 
     } 
 
     function SimpleCallwithGasAndValue() public returns (bool) { 
          EtherBox eb = new EtherBox(); 
          address myaddr = address(eb); 
          //status = myaddr.call.gas(200000).value(1)(bytes4(sha256("GetBalance()"))); 
          bytes memory payload = abi.encodeWithSignature("GetBalance()"); 
          (bool success, bytes memory returnData) = myaddr.call{gas: 200000, value: 1 ether}(payload); 
          return success; 
     } 

    function SimpledelegateCallwithGas(address libAddress) public returns (bool) { 
          bytes memory payload = abi.encodeWithSignature("sum(uint256,uint256)", 10,10); 
          (bool success, bytes memory returnData) = libAddress.delegatecall{gas: 2000000}(payload); 
          return success; 
     } 

    function SimpleStaticCallwithGas(address contractAddress) public returns (bool) { 
          bytes memory payload = abi.encodeWithSignature("sum(uint256,uint256)", 10,10); 
          (bool success, bytes memory returnData) = contractAddress.staticcall{gas: 2000000}(payload); 
          return success; 
     } 
} 