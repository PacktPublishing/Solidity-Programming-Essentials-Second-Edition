// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract StorageAssembly {

    uint256 StateVariable;
    function assemblyUsage() public returns (uint256 newstatevariable, uint256 newderivedvariable) {
        assembly {
            sstore(0x0, 100)
            newstatevariable := sload(0x0)
            sstore(0x1, 200)
            newderivedvariable := sload(0x1)
        }
    }

    function getStateVariable() public view returns(uint256) {
        return StateVariable;
    }

    function getNewDerivedVariable() public view returns(uint256 slot1) {
        assembly {
            slot1 := sload(0x1)
        }
    }

    function updateStateVariable(uint256 intValue) public returns (uint newValue){
        assembly{
            newValue := add(intValue,sload(0x1))
            sstore(0,newValue)
        }
    }
}