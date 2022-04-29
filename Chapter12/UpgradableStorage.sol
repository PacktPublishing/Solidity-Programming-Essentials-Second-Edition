// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract UpgradableStorage {

    bytes32 internal positionOne = keccak256('random');
    bytes32 internal positionTwo = keccak256('random1');
    bytes32 internal positionThree = keccak256('random2');

    function SetEmployeeData(uint256 employeeId, string memory employeeName, string memory placeholder) public {
        bytes32 localPositionOne = positionOne;
        bytes32 localPositionTwo = positionTwo;
        bytes32 localPositionThree = positionThree;
        assembly {
            sstore(localPositionOne, employeeId)
            sstore(localPositionTwo, mload(employeeName))
            sstore(localPositionThree, mload(placeholder))
            sstore(localPositionThree, mload(add(placeholder,0x20)))
        }
    }

    function GetEmployeeData() public returns (uint256 employeeId, string memory employeeName) {
        bytes32 localPositionOne = positionOne;
        bytes32 localPositionTwo = positionTwo;
        bytes32 localPositionThree = positionThree;
        assembly {
            employeeId := sload(localPositionOne)
            employeeName:= mload(0x40)
            mstore(employeeName, sload(localPositionTwo))
            mstore(add(employeeName, 0x20), sload(localPositionThree))
            mstore(0x40, add(employeeName, 0x40))
        }
    }

}