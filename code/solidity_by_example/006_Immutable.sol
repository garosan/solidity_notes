// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Values of immutable variables can be set inside the constructor but
// cannot be modified afterwards. You use constants when you know the
// values beforehand, immutable when the value will be known at deploy time.

contract Immutable {
    address public immutable DEPLOYER_ADDRESS;
    uint8 public immutable NUMBER_OF_ROUNDS_TO_PLAY;

    constructor(uint8 _numberOfRoundsToPlay) {
        DEPLOYER_ADDRESS = msg.sender;
        NUMBER_OF_ROUNDS_TO_PLAY = _numberOfRoundsToPlay;
    }
}
