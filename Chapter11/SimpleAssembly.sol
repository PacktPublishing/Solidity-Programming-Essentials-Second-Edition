// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

 contract SimpleAssembly {

    function AssemblyUsage() public pure returns (uint256) {
        
        uint256 i = 10;

        assembly {
            i := 100
        }

        assembly {
            i := 200
        }

        return i;
    }
}


contract AssemblyVariablesAndSimpleFunctions {
    
    function AssemblyUsage() public pure returns (uint256) {
        uint256 i;
        assembly {
            // this is a comment
            /*
                this is a 
                multiline comment
            */

            let stringVal := "ritesh modi"
            let uintVal := 100
            let byteVal := 0x100

            let newvariable := add(10,30)
            i := newvariable
        }
        return i;
    }
}