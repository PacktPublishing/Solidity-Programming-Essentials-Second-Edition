// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 

 

contract SimpleRequireContract {      

    function SimpleRequireFunction(uint256 myNumber) public payable returns (bool status, uint256)  {      
        require(myNumber > 0); 
        uint256 tempNumber = 200/myNumber; 
        if (tempNumber > 10) 
            status = true; 
        else     
            status = false;     
        return (status, tempNumber);         
    } 
} 