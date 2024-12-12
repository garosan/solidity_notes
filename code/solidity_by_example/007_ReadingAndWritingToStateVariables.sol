// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// To write or update a state variable you need to send a transaction.
// You can read state variables for free, withouth any transaction fees.

contract SimpleStorage {
    uint256 public num;

    // You need to send a tx to write to a state variable.
    function set(uint256 _num) public {
        num = _num;
    }

    // The function is 'view', you can read from state variable without sending a tx.
    function get() public view returns (uint256) {
        return num;
    }
}
