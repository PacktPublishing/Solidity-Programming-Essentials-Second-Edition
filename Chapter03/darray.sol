
// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract darray {

    uint256[] myarray;

    function addtoarray(uint256 _number) public returns (uint256, uint256) {
        myarray.push(_number);
        return (_number, myarray.length);
    }

    function arraylength() public view returns (uint256) {
        return myarray.length;
    }

    function getarrayvalue(uint256 _index) public view returns (uint256) {
        return myarray[_index];
    }

    function popValue() public  {
         myarray.pop();
    }

    function deleteItem(uint256 _index) public  {
         delete myarray[_index];
    }


}

// initial length of dynamic array is 0
// pushing increases the length of array 1
// calling an array that has no value with zero index is an error
// calling an array with one item with zero index returns the first value. Index 1 will raise an error 
// use array[index] to get the calues