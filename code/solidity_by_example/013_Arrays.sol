// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Arrays {
    // Several ways to initialize an array
    uint256[] public arr;
    uint256[] public arr2 = [1, 2, 3];

    // Fixed sized array, all elements initialize to 0
    uint256[10] public myFixedSizeArray;

    function get(uint256 i) public view returns (uint256) {
        return arr[i];
    }

    // Solidity can return the entire array. But this should be avoided for
    // arrays that can grow indefinitely in length.
    function getArr() public view returns (uint256[] memory) {
        return arr;
    }
}
