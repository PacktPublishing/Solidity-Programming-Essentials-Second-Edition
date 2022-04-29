// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9; 

 

//contract definition 

contract GeneralStructure { 

    //state variables 

    int public stateIntVariable; // variable of integer type 
    string stateStringVariable; //variable of string type 
    address personIdentifier; // variable of address type 
    MyStruct human; // variable of structure type 
    bool constant hasIncome = true; //variable of constant nature 

    //structure definition 
    struct MyStruct { 
        string name; //variable for type string 
        uint myAge; // variable of unsigned integer type 
        bool isMarried; // variable of boolean type 
        uint[] bankAccountsNumbers; // variable - dynamic array of unsigned integer 
    } 

    //modifier declaration 
    modifier onlyBy(){ 
        if (msg.sender == personIdentifier) { 
            _; 
        } 
    } 

    
    // event declaration 
    event ageRead(address, int); 

    //enumeration declaration 
    enum gender {male, female} 

    //function definition  
    function getAge (address _personIdentifier) onlyBy() payable external returns (uint) { 
       human =  MyStruct("Ritesh", 10, true, new uint[](3)); //using struct MyStruct 
       gender _gender = gender.male; //using enum  
       emit ageRead(personIdentifier, stateIntVariable); //raising event 
    } 
} 