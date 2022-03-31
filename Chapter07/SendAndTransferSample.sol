
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9; 

contract EtherBox {

    mapping (address => uint) balance;
    
    function SimpleSendToAccount(uint amount) public returns (bool) {
        if(balance[msg.sender] >= amount ) {
            balance[msg.sender] -= amount;
            if (msg.sender.send(amount) == true) {
                return true;
            }
            else {
                balance[msg.sender] += amount;
                return false;
            }
        }
    }
    
        
    function SimpleTransferToAccount() public  {
        msg.sender.transfer(1);
    }

    function SimpleTransferToAccount() public  {
        msg.sender.send(1);
    }

}

    
    
    