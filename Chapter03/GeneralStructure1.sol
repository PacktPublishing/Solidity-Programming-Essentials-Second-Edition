 // SPDX-License-Identifier: MIT

//contract definition 

contract generalStructure { 

    //structure definition 
    struct MyStruct { 
        string name; //variable for type string 
        uint myAge; // variable of unsigned integer type 
        bool isMarried; // variable of boolean type 
        uint[] bankAccountsNumbers; // variable - dynamic array of unsigned integer 
    } 

    MyStruct  stateStructure = MyStruct("Ritesh", 10, true, new uint[](2)); 
    MyStruct  stateStructure1; 

    function getAge () public returns (uint) { 
       // local structure     
       MyStruct memory localStructure = MyStruct("Modi", 20 ,false, new uint[](2)); 

       //local pointer to State structure 
       MyStruct memory pointerStructure = stateStructure; 

       // pointerlocalStructure is reference to localStructure 
       MyStruct memory pointerlocalStructure = localStructure; 

       //changing value in localStructure 
       localStructure.myAge = 30; 

       //assigning values to state variable 
       stateStructure1 =   MyStruct("Ritesh", 10, true, new uint[](2)); 

       //returning pointerlocalStructure.Age -- returns 30 
       return pointerlocalStructure.myAge; 
    } 
} 