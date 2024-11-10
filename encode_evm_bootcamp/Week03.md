## Session 09 - Monday

[GH Link](https://github.com/Encode-Club-Solidity-Bootcamp/Lesson-09)

### Links

- [Ethereum Improvement Proposals](https://eips.ethereum.org/)
- [ERC](https://eips.ethereum.org/erc)
- [OZ - Contracts](https://docs.openzeppelin.com/contracts/5.x/)
- [OZ - ERC20](https://docs.openzeppelin.com/contracts/5.x/erc20)
- [OZ - ERC721](https://docs.openzeppelin.com/contracts/5.x/erc721)

## Exercises

Create a new project5 folder, then:

```shell
mkdir project5
cd project5
npm init -y
npm install --save-dev hardhat
npx hardhat init
# Select "Create a TypeScript project (with Viem)"
# Then pick all default options
```

Delete `ignition/` folder and files inside `contracts/` and `test`.

Then:

```shell
npm install --save-dev @openzeppelin/contracts
```

## 07-NOV-2024 Thursday

[Lesson 12 - Github](https://github.com/Encode-Club-Solidity-Bootcamp/Lesson-12)

- Let's create a new Hardhat project, 'TokenizedVotes'.
- Matheus copied several files from a previous project for easier setup
- We will learn about OZ extension `ERC20Votes.sol`.

## Week 03 - Homework

- Complete the contracts together
- Develop and run scripts for “TokenizedBallot.sol” within your group to give voting tokens, delegating voting power, casting votes, checking vote power and querying results
- Write a report with each function execution and the transaction hash, if successful, or the revert reason, if failed
- Submit your weekend project by filling the form provided in Discord
- Share your code in a github repo in the submission form
