    // SPDX-License-Identifier: GPL-3.0
    pragma solidity >=0.7.0 <0.9.0;

    contract UnderOverFlowContract {

        uint8 public upperBoundary;
        uint8 public lowerBoundary;

        constructor() {
            upperBoundary = 255;
            lowerBoundary = 0;
        }

        function AddtoUpperBoundary(uint8 value) public view returns (uint8) {
            return upperBoundary + value;
        }

        function ReducefromLowerBoundary(uint8 value) public view returns (uint8) {
            return lowerBoundary - value;
        }

    }