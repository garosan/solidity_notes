# Lesson 02 - Building HelloWorld.sol in Remix

[Notes](https://github.com/Encode-Club-Solidity-Bootcamp/Lesson-02)

## Anatomy of a contract (relevant to me)

- Contract Structure
  - SPDX License Identifier
  - Pragmas
  - Imports
  - Comments
  - Contract definition
- Variables
- Storage areas
  - Account storage
  - Memory
  - Stack
- Constructor function
- Functions
- Visibility
- Typing
- Return values

What are objects (contracts and interfaces)

## Interfaces

An interface in Solidity is like a "blueprint" for a smart contract. It defines the functions that a contract must implement without providing the actual implementation.

Key Characteristics of an Interface

- Function Declarations Only:
  - An interface only contains the function signatures (name, input, and output) but no function body or logic.
  - Functions in an interface must be declared as external.
- No State Variables or constructors
- Child must implement all:
  - A contract that implements an interface must define all the functions declared in the interface

Why Use Interfaces?

- **Standardization**: Interfaces are used to ensure that contracts follow a certain standard. For example, the ERC-20 and ERC-721 token standards are implemented using interfaces.
- **Interoperability**: Contracts can interact with other contracts without needing to know their internal implementation.
- **Code Reusability**: By defining an interface, multiple contracts can implement it differently but still be compatible with each other.

## Contract interaction

> TODO: Really understand better this part.

### Part 1

- Contract interactions using virtual environments in Remix
- Viewing state changes through functions

### Part 2

- State changing calls in public testnets
- Using interfaces to interact with other contracts

```solidity
interface HelloWorldInterface {
    function helloWorld() external view returns (string memory);
    function setText(string memory newText) external;
}

contract HelloWorld is HelloWorldInterface {
    ...
}
```

### Part 3

- Payable functions
- Experimenting with payable calls

```solidity
function setText(string memory newText) public payable {
    text = newText;
}
```

## Clean code and documentation

- The Style guide
- Documentation
- NatSpec Format

### References for clean code and documentation

<https://docs.soliditylang.org/en/latest/style-guide.html>

<https://docs.soliditylang.org/en/latest/natspec-format.html#natspec>
