# Structure of a Contract

[Link](https://docs.soliditylang.org/en/v0.8.28/structure-of-a-contract.html)

Contracts can contain state variables, functions, function modifiers, events, errors, struct types and enum types. Furthermore, contracts can inherit from other contracts.

There are also special kinds of contracts called libraries and interfaces.

## State Variables

State variables can be either permanently stored in contract storage or temporarily stored in transient storage which is cleaned at the end of each transaction.

Example:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    uint storedData; // State variable
    // ...
}
```

- See [data locations](https://docs.soliditylang.org/en/v0.8.28/introduction-to-smart-contracts.html#locations) for valid storage locations for state variables.
- See [types](https://docs.soliditylang.org/en/v0.8.28/types.html#types) for valid state variable types.
- See [Visibility and Getters](https://docs.soliditylang.org/en/v0.8.28/contracts.html#visibility-and-getters) for possible choices for visibility.

## Functions

Functions are executable units of code. Functions are usually defined inside a contract, but helper functions can also be defined outside of contracts.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleAuction {
    function bid() public payable { // Function
        // ...
    }
}

// Helper function defined outside of a contract
function helper(uint x) pure returns (uint) {
    return x * 2;
}
```

Function calls can be internal or external and have different levels of visibility. Functions accept parameters and return variables.

## Function Modifiers

## Events

## Errors

## Struct Types

## Enum Types

Enums can be used to create custom types with a finite set of _constant values_.

Example:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Purchase {
    enum State { Created, Locked, Inactive } // Enum
}
```

[More info](https://docs.soliditylang.org/en/v0.8.28/types.html#enums)
