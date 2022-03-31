pragma solidity ^0.8.3;

interface IBanking {

    function NewBankingCustomer(uint256 customerid, address custaddress ) public;
    function GetBankingCustomer(uint256 customerid ) public returns (address);

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

    function NewBankingCustomer(uint256 customerid, address custaddress ) public {
        SetCustomer(customerid, custaddress);
    }

    function GetBankingCustomer(uint256 customerid ) public returns (address) {
        address addr = GetCustomer(customerid);
        return addr;
    }

}


contract ProxyContract {

    address maincontract;

    function AssignContract(address addr) public {
        maincontract = addr;
    }

    function() external payable {
        address mc = maincontract;
        assembly {
            let aa := mload(0x40)
            calldatacopy(aa,0,calldatasize)
            let result := call(100000, mc, 0, aa, calldatasize, 0,0 )
            let sz:= returndatasize
            returndatacopy(aa,0,sz)
            if eq(result, 0) {
                revert(0, 0)
            }
            return(aa,sz)

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
        return maincontract.call(msg.data);
    }

    function GetBankingCustomer(uint256 customerid) public returns(bool) {
        //ProxyContract pc = ProxyContract(maincontract);
        maincontract.call(msg.data);
        return true;
    }

}