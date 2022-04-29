// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 

contract EmployeeStore {

    struct ContactAddress {
        string city;
        string state;
    }

    struct employee {
        address identifier;
        string name ;
        uint8 age ;
        string email ;
        ContactAddress contact;
    }

    mapping (address => employee) allemployees;
    address[] employeeReference;

    function AddEmployee(address _identifier, string memory _name, uint8 _age,  string memory _email, string memory _state,  string memory _city) external returns ( bool) {
        ContactAddress memory contactadd = ContactAddress(_city, _state);
        allemployees[_identifier].identifier = _identifier;
        allemployees[_identifier].name = _name;
        allemployees[_identifier].age = _age;
        allemployees[_identifier].email = _email;
        allemployees[_identifier].contact = contactadd;
        employeeReference.push(_identifier);
    }


    function GetAnEmployee(address _identifier) external returns ( string memory _name, uint8 _age, string memory _email, string memory _city, string memory _state) {
        employee memory temp = allemployees[_identifier];
        _name = temp.name;
        _age = temp.age;
        _email = temp.email;
        ContactAddress memory addr = temp.contact;
        _city = addr.city;
        _state = addr.state;
    }


    function UpdateEmployee(address _identifier, string memory _name, uint8 _age, string memory _email, string memory _state, string memory _city) external returns ( bool) {
        ContactAddress memory contactadd = ContactAddress(_city, _state);
        allemployees[_identifier].identifier = _identifier;
        allemployees[_identifier].name = _name;
        allemployees[_identifier].age = _age;
        allemployees[_identifier].email = _email;
        allemployees[_identifier].contact = contactadd;
    }


    function GetAllEmployee(uint startRecord, uint endrecord) external returns ( string[] memory, uint8[] memory, string[] memory, address[] memory , string[] memory , string[] memory) {
        uint8[] memory _age = new uint8[](employeeReference.length);
        string[] memory _name = new string[](employeeReference.length);
        string[] memory _email = new string[](employeeReference.length);
        address[] memory _identifier = new address[](employeeReference.length);
        string[] memory _state = new string[](employeeReference.length);
        string[] memory _city = new string[](employeeReference.length);
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