// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0; 

contract CryptoFunctions {
    
    function cryptoDemo() public returns (bytes32, bytes32){
        return (sha256("r"), keccak256("r"));
    }
    
}



     

