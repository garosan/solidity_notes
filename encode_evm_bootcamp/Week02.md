# EVM Bootcamp Week 2

## Session 05 - Monday

### Working with Hardhat

Follow these commands:

```shell
mkdir hardhat-project
cd hardhat-project
npm init -y
npm install --save-dev hardhat
npx hardhat init
# Select "Create a TypeScript project (with Viem)"
# Then pick all default options
```

Make sure to have these 2 VS Code extensions:

- Mocha Test Explorer
- Solidity by Nomic Foundation

## Session 06 - Tuesday

Let's create a totally new hardhat project recreating the above steps.

Remember to change the `hardhat.config.ts` file, create the `.mocharc.json` and the `.env` file.

```
npx hardhat compile
npx hardhat test
npx hardhat accounts
```

Let's create the template files:

```
rm ./contracts/*
rm ./ignition/*
rm ./test/*
npx hardhat clean
```

We will not be using the ignition feature of Hardhat, we will be using the regular scripts way, so create a `scripts` folder at the top of the file.

Copy the `HelloWorld.sol` code and create a new test file, for now just add a `console.log('Hello World')`.

Now we can start using the Chai Assertion Library.

## Session 07 - Wednesday

## Session 08 - Thursday

[GH Link](https://github.com/Encode-Club-Solidity-Bootcamp/Lesson-08)

### Using scripts to automate operations

We will learn how to use scripts to deploy our contracts.

Reference links:

- [Deploying your contracts](https://hardhat.org/hardhat-runner/docs/guides/deploying)
- [Writing tasks](https://hardhat.org/hardhat-runner/docs/guides/tasks)

To run the script:

`npx hardhat run ./scripts/DeployWithHardhat.ts`

And the script would be looking something like this:

```javascript
import { viem } from "hardhat";
const PROPOSALS = ["Proposal 1", "Proposal 2", "Proposal 3"];

async function main() {
  console.log("Proposals: ");
  PROPOSALS.forEach((element, index) => {
    console.log(`Proposal N. ${index + 1}: ${element}`);
  });
  console.log("\nDeploying Ballot contract");
  const ballotContract = await viem.deployContract("Ballot", [
    PROPOSALS.map((prop) => toHex(prop, { size: 32 })),
  ]);
  console.log("Ballot contract deployed to:", ballotContract.address);
  console.log("Proposals: ");
  for (let index = 0; index < PROPOSALS.length; index++) {
    const proposal = await ballotContract.read.proposals([BigInt(index)]);
    const name = hexToString(proposal[0], { size: 32 });
    console.log({ index, name, proposal });
  }
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
```

### Connecting to a public blockchain
