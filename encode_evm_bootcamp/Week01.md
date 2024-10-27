# EVM Bootcamp Week 1

## Session 01 - Monday

Instructor: Matheus Pagain (@matheuspagani77)

Week 1: Solidity, Remix
Week 2: Scripts, Deployments w/Hardhat
Week 3: Building tokens, etc.
Week 4: Fullstack development (frontend and backend)
Week 5 & 6: Scalability, security, gas optimizations, DeFi

We can start thinking about blockchain from a usability point of view. As we can say that internet is a place for searching for cat pictures, what can blockchain be used for?

- [Etherscan](https://etherscan.io/)

Our gateway to the blockchain is a wallet.

- [Metamask.io - How to use multiple MetaMask wallets](https://support.metamask.io/managing-my-wallet/using-metamask/how-to-use-multiple-metamask-wallets/)
- [The Journey from Secret Recovery Phrase (Mnemonic Phrase) to Address](https://medium.com/mycrypto/the-journey-from-mnemonic-phrase-to-address-6c5e86e11e14)

So if the internet is a place to search for cat pictures, blockchain is a place for making transactions with your wallet.

- Funding my wallet with a Faucet,

- [Sepolia Etherscan](https://sepolia.etherscan.io/)

- [Example Transaction from Google Faucet to my wallet](https://sepolia.etherscan.io/tx/0x6102ee028a9c4f565bf20b3f59c93825d28b2a563471ab1d7196d8323ee281ad)

If you click on `State` you can see info about the sender and the receiver of the transaction, the block producer address and the _before_ and _after_ balance of each.

Its important to read and understand these concepts at some point:

- [Accounts](https://ethereum.org/en/developers/docs/accounts/)
- [Transactions](https://ethereum.org/en/developers/docs/transactions/)
- [Blocks](https://ethereum.org/en/developers/docs/blocks/)
- [Gas](https://ethereum.org/en/developers/docs/gas/)
- [Consensus mechanisms](https://ethereum.org/en/developers/docs/consensus-mechanisms/)
- [The EVM](https://ethereum.org/en/developers/docs/evm/)
- [Single Slot Finality](https://ethereum.org/en/roadmap/single-slot-finality)

- If you check [Sepolia transactions](https://sepolia.etherscan.io/txs) you will see that a lot of them are not transacting any money.

- If you click on a random transaction like [this one](https://sepolia.etherscan.io/tx/0x14d53b5a0f374ad64d44a773434cb5cc84e4e0db2dd5b671fbfd57d70e36fd2c) and you click on _More details_ you will see a bunch of lines and numbers in the input data field. What is this input data?

From [this article](https://info.etherscan.com/understanding-transaction-input-data/):

The Input Data field is a useful feature in a transaction because it enables smart contracts to be executed with different parameters or arguments, allowing for flexibility and customization. Additionally, arbitrary data can be included in the Input Data field, enabling users to attach additional information or metadata to their transactions, like a hacker sending a message to the affected party.

Matheus made a swap on Uniswap with his testnet tokens. Then he showed the transaction data that was showing in his Metamask when he did the transaction was the same that appeared in the input data field in Etherscan.

We are going to learn Solidity directly from the [official documentation](https://docs.soliditylang.org/en/v0.8.28/).

Also, here's the [official Remix documentation](https://remix-ide.readthedocs.io/en/latest/)

Now let's start coding!

Our first Hello World smart contract:

```solidity
// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract HelloWorld {

    constructor() {}

    function helloWorld() public view returns (string memory) {}

}
```

Try to compile this contract in Remix and then you'll see that at the bottom you have access to 2 new things:

- The ABI
- The bytecode

This is just a curiosity, but you can check a map of the language grammar [here](https://docs.soliditylang.org/en/v0.8.28/layout-of-source-files.html).
