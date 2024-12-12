// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
Solidity supports for, while, and do while loops.
Don't write loops that are unbounded as this can hit the gas limit, causing your transaction to fail.
For the reason above, while and do while loops are rarely used.
*/

contract Loop {
    uint256 public counter = 0;

    function loops() public {
        // for loop that will sum 0 + 1 + 2 + 4
        for (uint256 i = 0; i < 10; i++) {
            if (i == 3) {
                // Skip to next iteration with continue
                continue;
            }
            if (i == 5) {
                // Exit loop with break
                break;
            }
            counter += i;
        }

        // while loop
        uint256 j;
        while (j < 10) {
            j++;
        }
    }
}
