# QuickNode Guides - Ethereum - Getting Started

## What is Ethereum?

Ethereum is a decentralized and open-sourced blockchain network that allows anyone in the world to participate and interact with it.

In Ethereu, you can store digital assets, conduct payments, and interact with decentralized applications (dApps).

### What is Ethereum used for?

- **Ethereum Wallets**: wallets allow you to store cryptocurrency, send cryptocurrency and interact with decentralized applications (dApps). Ethereum wallets generally contain more than one account and are secured by cryptography. Each account tied to your wallet has a public and private key which is used when sending and receiving transactions.

- **Smart contracts**: Smart contracts are programs deployed on the blockchain that automate decision-making based on the contract rules. Smart contracts are immutable (generally speaking) and rely on the security of Ethereum (i.e., the Proof-of-Stake consensus mechanism).

- **Use cases**:
  - Financial services: Decentralized Finance (DeFi) (e.g., payments, trading exchanges, lending protocols, derivatives.
  - Collectibles: NFTs (e.g., collectibles such as digital and physical assets)
  - Gaming
  - Logistics (e.g., supply chain management)

## What is the EVM?

The Ethereum Virtual Machine (EVM) is a core piece of Ethereum that helps power the blockchain and smart contracts.

The EVM is the computation engine that powers Ethereum. It is contained within the client software (e.g., Geth, Nethermind, etc.) that you need to run a node. Nodes on Ethereum keep copies of transaction data, which the EVM processes to update the distributed ledger.

The EVM participates in block creation and transaction execution. In block creation, the EVM sets standards for managing the state from block to block. These states are stored in a **Merkle Patricia Trie** and hold the ground truth state for Ethereum.

In transaction execution, the EVM executes tasks (e.g., function calls to a smart contract) by interpreting the instructions in _opcodes_ (something similar to Assembly language). _But_, it happens like this:

- A smart contract developer writes smart contract code in Solidity or another language
- The developer compiles the files and the result is bytecode
- The bytecode contains all the instructions the EVM needs to run the contract, and it’s what gets deployed to the blockchain.
- Within the bytecode there are **opcodes** that the EVM recognizes and executes. Opcodes are essentially the "commands" the EVM reads from the bytecode to know what to do.

When the EVM executes tasks, it is limited to the amount of gas provided by the transaction and the overall limitations of the EVM.

### How is the EVM designed?

The EVM operates off of a stack-based memory structure and contains memory components such as Memory, Storage, and Stack (which are used to read/write to the blockchain and manage state).

The EVM is considered _quasi-turing complete_: It can solve problems given a set of instructions but is limited by the amount of gas provided.

### How does the EVM operate?

Now we will explain how smart contract code (bytecode) is broken down into Opcodes.

Let's take a look at the bytecode from the Simple storage contract from the Remix IDE (This is the actual bytecode as of 06-NOV-2024):

```
6080604052348015600e575f80fd5b506101438061001c5f395ff3fe608060405234801561000f575f80fd5b5060043610610034575f3560e01c80632e64cec1146100385780636057361d14610056575b5f80fd5b610040610072565b60405161004d919061009b565b60405180910390f35b610070600480360381019061006b91906100e2565b61007a565b005b5f8054905090565b805f8190555050565b5f819050919050565b61009581610083565b82525050565b5f6020820190506100ae5f83018461008c565b92915050565b5f80fd5b6100c181610083565b81146100cb575f80fd5b50565b5f813590506100dc816100b8565b92915050565b5f602082840312156100f7576100f66100b4565b5b5f610104848285016100ce565b9150509291505056fea26469706673582212209a0dd35336aff1eb3eeb11db76aa60a1427a12c1b92f945ea8c8d1dfa337cf2264736f6c634300081a0033
```

Note that the EVM currently only uses around 140 unique opcodes; By design there can be a maximum of 256 single-byte opcodes: 256 possible unique values (from 0x00 to 0xFF).

You can use [evm.codes/playground](https://www.evm.codes/playground) to input the bytecode above and see how it is translated to opcodes.

#### The Ethereum State Transition Function

The **Ethereum State Transition Function** is a formula that the EVM processes every time it executes a transaction. This function makes sure transactions adhere to the standard and are technically valid (e.g., correct nonce and valid signature):

`Y(S, T)= S'`

Given an old valid state (S) and a new set of valid transactions (T), the Ethereum state transition function Y(S, T) produces a new valid output state S'.

## What are Ethereum accounts?

## Connecting to blockchains
