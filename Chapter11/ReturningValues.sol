    // SPDX-License-Identifier: GPL-3.0
    pragma solidity >=0.7.0 <0.9.0;

    contract ReturningValues {

        function usingReturnOpcode() public pure returns (uint256) {
            assembly {
                let temp := 10
                mstore(0x0, temp)
                return(0x0, 32)
            }
        }

        function usingReturnVariable() public pure returns (uint256 retval) {
            assembly {
                let temp := 10
                retval := temp
            }
        }
    }