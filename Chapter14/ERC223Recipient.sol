// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

 contract ERC223Recipient {

    event TokenReceived(address, uint, bytes);
    function tokenReceived(address _from, uint _value, bytes memory _data) public
    {
        emit TokenReceived(_from, _value, _data);
        
    }
}