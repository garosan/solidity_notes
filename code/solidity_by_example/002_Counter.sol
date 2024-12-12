// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    // Again, the compiler creates a getter function for this state variable
    uint256 public count;

    function get() public view returns (uint256) {
        return count;
    }

    // These functions are nonpayable because they modify a state variable
    function increment() public {
        count += 1;
    }

    // If you try to decrement below 0 the transaction will revert
    function decrement() public {
        count -= 1;
    }
}
