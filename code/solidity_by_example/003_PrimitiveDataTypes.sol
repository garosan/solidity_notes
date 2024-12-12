// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Primitives {
    bool public boo = true;

    uint8 public u8 = 1;
    uint256 public u256 = 456;
    uint public u = 123; // uint is an alias for uint256

    int8 public i8 = -1;
    int256 public i256 = 456;
    int public i = -120; // int is an alias for int256

    // min and max of int
    int8 public minInt = type(int8).min; // equal to -128
    int8 public maxInt = type(int8).max; // equal to 127

    address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

    /*

    In Solidity, bytes are used to represent a sequence of raw bytes.
    Remember, each byte contains 8 bits (1s or 0s).

    There are two main types of bytes:

     - fixed-sized byte arrays
        - These have a fixed length, like bytes1, bytes2, up to bytes32.
        - Example: bytes1 can hold exactly 1 byte (8 bits).
     - dynamically-sized byte arrays.
        - Simply written as bytes, and their size can change during runtime.
        - Example: bytes is similar to an array byte[].
    */
    bytes1 a = 0xb5; // 0xb5 is hexadecimal, translates to binary as [10110101]
    bytes1 b = 0x56; // 0x56 translates to binary as [01010110]

    // Default values
    // Unassigned variables have a default value
    bool public defaultBoo; // false
    uint256 public defaultUint; // 0
    int256 public defaultInt; // 0
    address public defaultAddr; // 0x0000000000000000000000000000000000000000
}
