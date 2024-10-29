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
