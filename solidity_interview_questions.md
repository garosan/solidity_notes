# Solidity Interview Questions from RareSkills

[Original Article](https://www.rareskills.io/post/solidity-interview-questions)

## Easy

1. What is the difference between private, internal, public, and external functions?

- Private functions can only be called within the contract, internal can be called by contracts that inherit this contract, public can be called by anyone and external can only be called from outside the contract.

2. Approximately, how large can a smart contract be?

- EIP-170 introduced a compiled byte-code size limit of 24kb, which would amount to 300-500 lines of code aproximately.
