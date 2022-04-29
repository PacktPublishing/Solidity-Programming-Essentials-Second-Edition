// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9; 

contract ownable {
    address owner;
    
    constructor()  {
        owner = msg.sender;
    }

    modifier onlyowner {
        require(msg.sender == owner);
        _;
    }

}

contract Stoppable is ownable {
    bool isStopped;

    constructor()  payable {
        isStopped = false;
    }

    function stopActivities() external onlyowner {
        isStopped = true;
    }

    function startActivities() external onlyowner {
        isStopped = false;
    }

    modifier shouldbestopped {
        require(isStopped == false);
        _;
    }

    function withdraw(uint256 amount) external shouldbestopped returns (bool) {

        //msg.sender.transfer(1 ether);
       return true;
    }

}