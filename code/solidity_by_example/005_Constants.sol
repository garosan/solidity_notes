// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Constants are variables that cannot be modified.
// Their value is hard coded and using constants can save gas cost.

contract Constants {
    address public constant MY_ADDRESS =
        0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
    uint8 public constant MAX_PARTICIPANTS = 16;
}
