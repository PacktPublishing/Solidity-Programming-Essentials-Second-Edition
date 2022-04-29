
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9; 

contract EtherBox {

    mapping (address  => uint) balance;
    
    function SimpleSendToAccount(uint amount) public returns (bool) {
        if(balance[msg.sender] >= amount ) {
            balance[msg.sender] -= amount;
            if (payable(msg.sender).send(amount) == true) {
                return true;
            }
            else {
                balance[msg.sender] += amount;
                return false;
            }
        }
    }
    
        
    function SimpleTransferToAccount() public  {
        payable(msg.sender).transfer(1);
    }

    function SimpleSendToAccount() public  {
        payable(msg.sender).send(1);
    }

}

    
    
    