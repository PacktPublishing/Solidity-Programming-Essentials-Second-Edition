// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9; 

contract SumContract {
  function Sum(uint a, uint b) public returns (uint) {
     return a + b;
  }
}

contract MultiContract is SumContract {
  function Multiply(uint a, uint b) public returns (uint) {
     return a * b;
  }
}

contract DivideContract is SumContract {
  function Multiply(uint a, uint b) public returns (uint) {
     return a / b;
  }
}

contract SubContract is SumContract, MultiContract,DivideContract {
  function Sub(uint a, uint b) public returns (uint) {
     return a - b;
  }
}

contract client {
  function WorkWithInheritance() public returna (uint) {
     uint a = 20;
     uint b = 10;
     SubContract subt = new SubContract();
     return subt.Sum(a,b);
  }
}