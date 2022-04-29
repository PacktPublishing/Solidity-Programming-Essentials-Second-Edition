// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract MemoryAssembly {

    function AssemblyUsage() public pure returns (uint256) {
        assembly {
            let addresult := add(100,200)

            mstore(0x0, addresult)

            let y := mload(0x0)

            mstore(add(0x0, 0x20), add(y,200))

            //return(0x0, 32)
            return(0x20, 32)
        }
    }

    function AssemblyUsage1() public pure returns (uint256) {
        assembly {
            let addresult := add(100,200)

            mstore(0x40, addresult)

            let y := mload(0x40)

            mstore(add(0x40, 0x20), add(y,200))

            //return(0x0, 32)
            //return(0x60, 32)
            return(0x0, 32)
        }
    }
}