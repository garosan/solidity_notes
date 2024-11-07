# QuickNode Guides - Ethereum - MEV

[Article Link](https://www.quicknode.com/guides/ethereum-development/MEV/what-is-mev)

Learn how to protect yourself from MEV by using the Merkle.io add-on from the QuickNode Marketplace

## Transaction Process from User to Blockchain

When a user initiates a transaction, they specify details like the recipient's address, transaction fee, and some arbitrary data. This transaction is then broadcasted to the blockchain network via a node, where the node validates its basic parameters. Upon validation, the transaction enters the node's **mempool**, a holding area for all unconfirmed transactions, and the node begins broadcasting that transaction to a subset of its peers.

From the mempool, miners (in Proof-of-Work systems), validators (in Proof-of-Stake systems), or builders (i.e., MEV opportunity searchers) select transactions to include in the next block, typically favoring those with higher fees.

Once a set of transactions is included in a block and that block is mined, the block is broadcasted to other nodes in the network to be validated and will continue to be built on top of.

## What is MEV (Maximum Extractable Value)?

MEV, in simple terms, can be described as the measure of total value that may be extracted from transaction ordering permissionlessly (i.e., without any special privileges).

With this ability, a miner/validator (soon we'll find out who else participates) can extract additional economic gain on top of the fees and revenue generated when building a block. Where is the additional gain derived from? Well, by having the ability to reorder the block, insert their own transactions or exclude (censor) some transactions, you uncover arbitrage opportunities that can be taken advantage of.

In most cases, it's not block producers who find the arbitrage opportunities. Instead, these opportunities are competitively fought for by other entities (i.e., third parties like "Searchers") who run automated bots (algorithms) on and off-chain and compute which transaction reordering will maximize their profits.

## Types of MEV

- Frontrunning, Backrunning & Sandwiching

Suppose you are a trader planning to buy a significant amount of a certain cryptocurrency on a DEX. Once your transaction is sent to a node which is then broadcasted, your transaction enters the mempool but still remains unconfirmed until a miner or validator includes it in a block. This waiting area for transactions is where an MEV searcher (or "searcher" for simplicity in this guide) comes into play.

These searchers continuously monitor the mempool for potential arbitrage opportunities. When they spot your large trade that is a pending transaction, they can execute a strategy known as frontrunning:

1. Identify: The searcher filters through the mempool to identify any large DEX transactions that they may be able to frontrun and profit from.
2. Execution: The searcher quickly creates their own transaction to buy the same cryptocurrency. They ensure their transaction includes a higher gas fee, incentivizing block proposers to prioritize and process it before yours.
3. Arbitrage Opportunity: After the large trader's transaction has been executed and the price has increased (to the predetermined price the searcher calculated their profit target), the searcher can either hold their unrealized gain or sell their unrealized profit (which in effect, is called "sandwiching").

Although the example above showcases the potential profit opportunity from a trade arbitrage, block proposers also search for other frontrunning opportunities to capture such as **when a user calling a certain smart contract method ends up with more funds then they started with**. This is done by simulating the transaction the user is calling (even if the block proposer doesn't fully understand the transaction), checking to see if the user will end up with more funds, and then trying to front run the user to capture the opportunity first.

Backrunning is the opposite of frontrunning, where block proposers position their transaction right after a significant one, exploiting the potential price discrepancies and arbitrage opportunities between exchanges.

Here is a case of a successful arbitrage trade where an investor converted 1,000 ETH into 1,045 ETH by exploiting the price discrepancy of the ETH/DAI pair between Uniswap and Sushiswap. [Etherscan link](https://etherscan.io/tx/0x5e1657ef0e9be9bc72efefe59a2528d0d730d478cfc9e6cdd09af9f997bb3ef4)

Here's a small breakdown of this transaction:

- Flash Loan Acquisition: The trader borrowed 1,000 ETH from Aave Protocol V2 without upfront collateral. Flash loans allow borrowing large sums, provided the loan is repaid within the same transaction.

- Arbitrage Execution:

  - Uniswap Swap: The trader swapped 1,000 ETH for approximately 1,293,896 DAI on Uniswap.
  - SushiSwap Swap: They then exchanged the 1,293,896 DAI for about 1,045.62 ETH on SushiSwap.
    Profit Realization:

- Loan Repayment: The trader repaid the 1,000 ETH flash loan to Aave.
  Net Profit: After repaying the loan, the trader retained approximately 45.62 ETH as profit.

## Liquidations

On-chain lending protocols on Ethereum and other blockchains today are generally open-source and have liquidation engines that anyone can execute. The user helping facilitate the protocol's healthy workings generally gets some profit from the collateral needed to be paid off. With this, MEV searchers use the same techniques as frontrunning to search the mempool, analyze it, and try to capture this arbitrage opportunity first.

## Just-in-Time Liquidity (JIT)

JIT liquidity refers to the strategy of providing liquidity to a DeFi protocol or liquidity pool only at the precise moment it is needed for a transaction rather than keeping funds locked in the pool indefinitely.

How does it work? This is similar to how a searcher filters through the mempool to find a large trade that could significantly impact a liquidity pool's price. Once identified, a searcher quickly executes a transaction to add liquidity to the relevant pool (hence the term "just-in-time"). Once the large transaction is executed using the liquidity provided by the searcher, the searcher can withdraw their liquidity from the pool and reap the benefits of transaction fees and/or slippage.

The types of MEV mentioned above are a partial list, and other types of opportunities may still be discovered. With that being said, a big advantage to a searcher to take advantage of MEV is latency. Searchers or bots continue to minimize the latency, creating a competitive environment for those who want to profit from MEV.

## Time Bandit Attack

This MEV arbitrage looks to rewrite history to take advantage of the EVM's state. If a miner/validator sees that the block they are proposing has far less revenue opportunity compared to the MEV the block can generate, the miner/validator can try to destabilize consensus and rewrite the block so they can take advantage of the MEV generated themselves.

Read more:

- [MEV Wiki - Time bandit attack](https://www.mev.wiki/attack-examples/time-bandit-attack)
- [Coindesk Podcasts - 'Time Bandit' Attacks on Ethereum: What They Are and How They Work (From 2021)](https://www.coindesk.com/podcasts/mapping-out-eth-2-0/time-bandit-attacks-on-ethereum-what-they-are-and-how-they-work)
- [Lossless - Your Intro into Time Bandit Attacks on ETH](https://losslessdefi.medium.com/your-intro-into-time-bandit-attacks-on-eth-5a578e3ae6a4)

Personal note: All this seems to be a little outdated, even this Flashbots resource https://explore.flashbots.net/ doesn't seem to be maintained or moved to another way of dealing with MEV.
