// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

interface IBanking {

    function NewBankingCustomer(uint256 customerid, address custaddress ) external;
    function GetBankingCustomer(uint256 customerid ) external returns (address);

}

contract mystorage {

    mapping (uint256 => address) public customers;

    function GetCustomer(uint256 customerid) internal returns (address) {
        return customers[customerid];
    }

    function SetCustomer(uint256 customerid, address custaddress) internal returns (bool) {
        customers[customerid] = custaddress;
        return true;
    }

}

contract ManageCustomer is IBanking, mystorage {

    function NewBankingCustomer(uint256 customerid, address custaddress ) override external {
        SetCustomer(customerid, custaddress);
    }

    function GetBankingCustomer(uint256 customerid ) override external returns (address) {
        address addr = GetCustomer(customerid);
        return addr;
    }

}


contract ProxyContract {

    address maincontract;

    function AssignContract(address addr) public {
        maincontract = addr;
    }

    fallback() external payable {
        address mc = maincontract;
        assembly {
            let startAddress := mload(0x40)
            calldatacopy(startAddress, 0, calldatasize())
            let result := call(100000, mc, 0, startAddress, calldatasize(), 0,0 )
            let sz:= returndatasize()
            returndatacopy(startAddress,0,sz)
            if eq(result, 0) {
                revert(0, 0)
            }
            return(startAddress,sz)

        }
    }

}


contract client {

    address maincontract;

    function AssignContract(address addr) public {
        maincontract = addr;
    }

    function NewBankingCustomer(uint256 customerid, address custaddress) public returns(bool) {
        //ProxyContract pc = ProxyContract(maincontract);
        maincontract.call(msg.data);
        return true;
    }

    function GetBankingCustomer(uint256 customerid) public returns(bool) {
        //ProxyContract pc = ProxyContract(maincontract);
        maincontract.call(msg.data);
        return true;
    }

}