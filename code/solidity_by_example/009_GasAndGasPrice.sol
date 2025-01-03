// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
You pay gas spent * gas price amount of ether for a tx
- gas spent is the total amount of gas used in a transaction
- gas price is how much ether you are willing to pay per gas

There are 2 upper bounds to the amount of gas you can spend
- gas limit (max amount of gas you're willing to use for a txn)
- block gas limit (max amount of gas allowed in a block, set by the network)

If you use up all your gas your transactions will fail, state changes 
will be undone and the gas spent will not be refunded.
*/

contract Gas {
    uint256 public i = 0;

    function forever() public {
        while (true) {
            i += 1;
        }
    }
}

// Running the above code yields this error in Remix:
// transact to Gas.forever errored: Error occurred: out of gas.
