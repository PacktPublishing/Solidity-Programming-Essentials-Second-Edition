// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract SimpleDivision {
    function Divide2Nums(uint256 numone, uint256 numtwo) public returns (uint256) {
       // require(numtwo > 0, "numtwo is less than or equal to zero");
        return numone/numtwo;
    }

}

contract TryCatchExample {
    SimpleDivision sa;

    event myevent(uint256, string);
    event mybytes(bytes);
    
    constructor() {
        sa = new SimpleDivision();
    }

    function GetDivision(uint256 a, uint256 b) public returns (bool) {
        try sa.Divide2Nums(a,b) returns (uint256 ab) {
            emit myevent(b, "pure success");
            return true;
        }
        catch Error(string memory reason) {
            emit myevent(b, reason);
            return false;
        }
        catch Panic(uint errorCode) {
            emit myevent(errorCode, "pure failure");
        }
        catch (bytes memory lowLevelData) {
            emit mybytes(lowLevelData);
            return false;
        }
    }
}