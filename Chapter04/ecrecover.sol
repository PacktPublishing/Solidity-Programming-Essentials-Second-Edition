// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;


contract AddressValidations {
    function ExtractAddress(bytes32 hash, uint8 v, bytes32 r, bytes32 s) public returns(address) {
        bytes memory prefix = "\x19Ethereum Signed Message:\n32";
        bytes32 prefixedHash = keccak256(abi.encodePacked(  prefix, hash));
        return ecrecover(prefixedHash, v, r, s);
    }

    function ExtractAddressAnotherVersion(bytes32 hash, bytes memory sig) public returns(address) {
        if (sig.length != 65) {
            return address(0);
        }
        bytes32 rValue;
        bytes32 sValue;
        uint8 vValue;

        assembly {
            rValue := mload(add(sig, 32))
            sValue := mload(add(sig, 64))
            vValue := byte(0, mload(add(sig, 96)))
        }

        if (vValue < 27) {
            vValue += 27;
        }

        bytes memory prefix = "\x19Ethereum Signed Message:\n32";
        bytes32 prefixedHash = keccak256(abi.encodePacked(  prefix, hash));
        address recoveredAddress = ecrecover(prefixedHash, vValue, rValue, sValue);

        return (recoveredAddress);
 
    }
}
