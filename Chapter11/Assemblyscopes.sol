    // SPDX-License-Identifier: GPL-3.0
    pragma solidity >=0.7.0 <0.9.0;

    contract AssemblyScopes {
        function getValues() public pure returns (uint256 retval) {
            assembly {
                let outerValue := 10
                {
                    let innerValue := 20
                    {
                        innerValue := 30
                    }
                }
                {
                    // Variable name already taken in this scope
                    //let outerValue := 40

                    //cannot use innerValue as it is not visible
                    //innerValue := 50
                }
                // retval := innerValue
                 retval := outerValue
            }
        }

    }