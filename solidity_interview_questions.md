# Solidity Interview Questions from RareSkills

[Original Article](https://www.rareskills.io/post/solidity-interview-questions)

## Easy

1. What is the difference between private, internal, public, and external functions?

- **Answer:** Private functions can only be called within the contract, internal can be called by contracts that inherit this contract, public can be called by anyone and external can only be called from outside the contract.

2. Approximately, how large can a smart contract be?

- **Answer:** EIP-170 introduced a compiled byte-code size limit of 24kb, which would amount to 300-500 lines of code aproximately.

3. What is the difference between create and create2?

- **Answer**: `create` deploys a contract with a deterministic address based on the sender and the nonce, `create2` uses a salt to deterministically generate a contract address.

4. What major change with arithmetic happened with Solidity 0.8.0?

- **Answer**: Overflows and underflows are not allowed unless we use an `unchecked` block.

5. What special CALL is required for proxies to work?
6. How do you calculate the dollar cost of an Ethereum transaction?
7. What are the challenges of creating a random number on the blockchain?
8. What is the difference between a Dutch Auction and an English Auction?
9. What is the difference between transfer and transferFrom in ERC20?
10. Which is better to use for an address allowlist: a mapping or an array? Why?
11. Why shouldn’t tx.origin be used for authentication?
12. What hash function does Ethereum primarily use?
13. How much is 1 gwei of Ether?

- **Answer**: 1 gwei is 1 with 9 zeros of wei. 1gwei would be 0.000000001 worth of ether.

14. How much is 1 wei of Ether?

- **Answer**: 1 ether is 1 with 18 zeros of wei. 1 wei is 0. + 17 zeros + 1 worth of ether.

15. What is the difference between assert and require?
16. What is a flash loan?
17. What is the check-effects-interaction pattern?
18. What is the minimum amount of Ether required to run a solo staking node?

- **Answer**: 32 ethers.
