// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 

Contract EmployeeStore {

    struct employee {
        Address identifier,
        Name bytes32,
        Age uint8,
        Email bytes32
    }

    struct ContactAddress {
        bytes32 city;
        bytes32 state;
    }

    struct employee {
        address identifier;
        bytes32 name ;
        uint8 age ;
        bytes32 email ;
        ContactAddress contact;
    }


    function AddEmployee(address _identifier, bytes32 _name, uint8 _age, bytes32 _email, bytes32 _state, bytes32 _city) external returns ( bool) {
        ContactAddress memory contactadd = ContactAddress(_city, _state);
        allemployees[_identifier].identifier = _identifier;
        allemployees[_identifier].name = _name;
        allemployees[_identifier].age = _age;
        allemployees[_identifier].email = _email;
        allemployees[_identifier].contact = contactadd;
        employeeReference.push(_identifier);
    }


    function GetAnEmployee(address _identifier) external returns ( bytes32 _name, uint8 _age, bytes32 _email, bytes32 _city, bytes32 _state) {
        employee memory temp = allemployees[_identifier];
        _name = temp.name;
        _age = temp.age;
        _email = temp.email;
        ContactAddress memory addr = temp.contact;
        _city = addr.city;
        _state = addr.state;
    }


    function UpdateEmployee(address _identifier, bytes32 _name, uint8 _age, bytes32 _email, bytes32 _state, bytes32 _city) external returns ( bool) {
        ContactAddress memory contactadd = ContactAddress(_city, _state);
        allemployees[_identifier].identifier = _identifier;
        allemployees[_identifier].name = _name;
        allemployees[_identifier].age = _age;
        allemployees[_identifier].email = _email;
        allemployees[_identifier].contact = contactadd;
    }


    function GetAllEmployee(uint startRecord, uint endrecord) external returns ( bytes32[] memory, uint8[] memory, bytes32[] memory, address[] memory , bytes32[] memory , bytes32[] memory) {
        uint8[] memory _age = new uint8[](employeeReference.length);
        bytes32[] memory _name = new bytes32[](employeeReference.length);
        bytes32[] memory _email = new bytes32[](employeeReference.length);
        address[] memory _identifier = new address[](employeeReference.length);
        bytes32[] memory _state = new bytes32[](employeeReference.length);
        bytes32[] memory _city = new bytes32[](employeeReference.length);
        for(uint i= startRecord; i <= endrecord; i++) {
            address addressinArray = employeeReference[i-1];
            _age[i-1] = allemployees[addressinArray].age;
            _name[i-1] = allemployees[addressinArray].name;
            _email[i-1] = allemployees[addressinArray].email;
            _identifier[i-1] = allemployees[addressinArray].identifier;
            _state[i-1] = allemployees[addressinArray].contact.state;
            _city[i-1] = allemployees[addressinArray].contact.city;
        }
        return ( _name, _age, _email , _identifier , _state , _city);
    }

}