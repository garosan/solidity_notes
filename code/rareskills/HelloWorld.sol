// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyFirstContract {
    function returnsANumber() public pure returns (uint256) {
        return 100;
    }

    function returnsABool() public pure returns (bool) {
        return true;
    }
}
