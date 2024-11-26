## Session 09 - Monday

[GH Link](https://github.com/Encode-Club-Solidity-Bootcamp/Lesson-09)
[Youtube Video](https://www.youtube.com/watch?v=v4qM45Gv_ac)

Reviewed on 26-NOV-2024

Read this:
https://eips.ethereum.org/EIPS/eip-20

EIP-20 at a glance:

```solidity
function name() public view returns (string);       // Optional
function symbol() public view returns (string);     // Optional
function decimals() public view returns (uint8);    // Optional

function totalSupply() public view returns (uint256);
function balanceOf(address _owner) public view returns (uint256 balance);
function transfer(address _to, uint256 _value) public returns (bool success);
function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
function approve(address _spender, uint256 _value) public returns (bool success);
function allowance(address _owner, address _spender) public view returns (uint256 remaining);

// Events
event Transfer(address indexed _from, address indexed _to, uint256 _value);
event Approval(address indexed _owner, address indexed _spender, uint256 _value);
```

Example Implementations:

- [OpenZeppelin implementation](https://eips.ethereum.org/assets/eip-20/OpenZeppelin-ERC20.sol)
- [ConsenSys Implementation](https://eips.ethereum.org/assets/eip-20/Consensys-EIP20.sol)

Create a new tokens folder, then:

```shell
mkdir tokens
cd tokens
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

Create MyERC20.sol

Install OZ like this:

npm install --save-dev @openzeppelin/contracts

**Be aware to not install from the master branch, but from the latest release**

This is how the `hardhat.config.ts` file must look:

```typescript
import { task, type HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox-viem";

const config: HardhatUserConfig = {
  solidity: "0.8.27",
};

task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.viem.getWalletClients();
  for (const account of accounts) {
    console.log(account.account.address);
  }
});

export default config;
```
