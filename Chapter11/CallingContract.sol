
// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract TargetContract {
    function GetAddition(uint256 firstVal, uint256 secondVal,uint256 thirdVal) public pure returns(uint256){  
        return firstVal + secondVal + thirdVal;
    }

}

contract CallingContract {
    TargetContract targetContract;

    constructor(){  
        targetContract = new TargetContract();  
    }

    function InvokeTarget(uint256 firstVal, uint256 secondVal, uint256 thirdVal) public returns (uint256 retval){
        address addr = address(targetContract);  
        bytes4 functionSignature = bytes4(keccak256("GetAddition(uint256,uint256,uint256)")); 

        assembly {
            let freePointer := mload(0x40)   
            mstore(freePointer,functionSignature) 
            mstore(add(freePointer,0x04),firstVal) 
            mstore(add(freePointer,0x24),secondVal) 
            mstore(add(freePointer,0x44),thirdVal)

            let success := call(      
                                100000, 
                                addr, 
                                0,    
                                freePointer,    
                                0x64, 
                                freePointer,    
                                0x20) 

            retval := mload(freePointer) 
            
        }
    }

    function checkIfContract(address contractAddress) public view returns (bool) {
        uint length;
        assembly {
                length := extcodesize(contractAddress)
        }
        if (length > 0) {
            return true;
        } 

        return false;
    }
    
}