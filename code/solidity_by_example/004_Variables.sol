// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
  There are 3 types of variables in Solidity:
  - local (declared inside a function, not stored on-chain)
  - state (declared outside a function, stored on-chain)
  - global (they provide information about the blockchain)
*/

contract Variables {
    string public text = "Hello";
    uint256 public num = 123;

    function returnNumber() public pure returns (uint256) {
        uint256 num2 = 456;
        return num2;
    }

    function returnTimestamp() public view returns (uint256) {
        return block.timestamp;
    }

    // Returns the sender of the message (current call)
    function returnSenderOfTransaction() public view returns (address) {
        return msg.sender;
    }

    // Returns the sender of the transaction (full call chain)
    // In this contrived case, both addresses should be the same
    function returnTransactionOrigin() public view returns (address) {
        return tx.origin;
    }
}
