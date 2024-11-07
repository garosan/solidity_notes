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

In transaction execution, the EVM executes tasks (e.g., function calls to a smart contract) by interpreting the instructions in Opcodes

When the EVM executes tasks, it is limited to the amount of gas provided by the transaction and the overall limitations of the EVM.

### How is the EVM designed?

The EVM operates off of a stack-based memory structure and contains memory components such as Memory, Storage, and Stack (which are used to read/write to the blockchain and manage state).

The EVM is considered _quasi-turing complete_: It can solve problems given a set of instructions but is limited by the amount of gas provided.

## What are Ethereum accounts?

## Connecting to blockchains
