## Session 05 - Monday

- [Video de la sesión](https://www.youtube.com/watch?v=YOf9UtGexSc)
- [Notas Github](https://github.com/Encode-Club-Solidity-Bootcamp/Lesson-05)

### Notas relevantes de la sesión

Checamos que tengamos Node instalado usando 'node -v'

Lo más recomendado si tenemos Windows es usar WSL y así también podemos usar Node version manager o nvm.

Ahora vamos a clonar el repo de Open Zeppelin y hacer npm install:

```bash
git clone https://github.com/OpenZeppelin/openzeppelin-contracts.git
cd .\openzeppelin-contracts\
npm install
```

Ahora corremos este comando 'npm run compile'. Si todo salió bien debemos ver un mensaje de 'Compiled 275 Solidity files successfully (evm target: cancun)'.

Luego podemos ver todo lo que hay adentro de la carpeta test...hacemos una prueba:

npm run test ./test/token/ERC20/ERC20.test.js

126 passing tests nos arroja.

Pdemos echar un vistazo al file que corrimos: ERC20/ERC20.test.js

Hacemos un cambio en la linea 78 del .sol y volvemos a correr las pruebas para ver cómo truenan las pruebas ahora.

### Hardhat from scratch

Ahora vamos a ver cómo configurar un proyecto desde 0 con Hardhat.

Leer estos links:

- https://hardhat.org/hardhat-runner/docs/getting-started#overview
- https://hardhat.org/hardhat-runner/docs/guides/typescript
- https://hardhat.org/hardhat-runner/docs/advanced/vscode-tests

Para el proyecto:

```shell
mkdir project
cd project
npm init
npm install --save-dev hardhat
```

Then:

```shell
npx hardhat init
    "Create a TypeScript project (with Viem)"
# Pick all default options
code .
```

Añadir la task de 'Accounts' en el hardhat.config.ts file:

## Session 06 - Tuesday

- [Video de la sesión](https://www.youtube.com/watch?v=9_ykqoHoZGM)
- [Notas Github](https://github.com/Encode-Club-Solidity-Bootcamp/Lesson-06)

Repetimos todos los pasos:

```shell
mkdir project2
cd project2
npm init -y
npm install --save-dev hardhat


npx hardhat init
    "Create a TypeScript project (with Viem)"
# Pick all default options
code .
```

Now copy the .env with this info:

```
MNEMONIC="here is where your extracted twelve words mnemonic phrase should be put"
PRIVATE_KEY="<your wallet private key should go here>"
POKT_API_KEY="********************************"
INFURA_API_KEY="********************************"
INFURA_API_SECRET="********************************"
ALCHEMY_API_KEY="********************************"
ETHERSCAN_API_KEY="********************************"
```

And copy the `hardhat.config.ts` file:

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

Now check that these 3 commands are working:

```shell
npx hardhat compile
npx hardhat test
npx hardhat accounts
```

To start from scratch we are going to

```shell
rm ./contracts/*
rm -rf ignition
rm ./test/*
```

`npx hardhat clean` removes the artifacts folder.

## Session 07 - Wednesday

- [Video de la sesión](https://www.youtube.com/watch?v=1OSiN2I1lfQ)
- [Notas Github](https://github.com/Encode-Club-Solidity-Bootcamp/Lesson-07)

Take a look at this Ballot contract from the Solidity docs:

https://docs.soliditylang.org/en/latest/solidity-by-example.html

We should create a new folder for our project following this process again:

```shell
mkdir project2
cd project2
npm init -y
npm install --save-dev hardhat


npx hardhat init
    "Create a TypeScript project (with Viem)"
# Pick all default options
code .
```

Now copy the .env with this info:

```
MNEMONIC="here is where your extracted twelve words mnemonic phrase should be put"
PRIVATE_KEY="<your wallet private key should go here>"
POKT_API_KEY="********************************"
INFURA_API_KEY="********************************"
INFURA_API_SECRET="********************************"
ALCHEMY_API_KEY="********************************"
ETHERSCAN_API_KEY="********************************"
```

And copy the `hardhat.config.ts` file:

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

Now check that these 3 commands are working:

```shell
npx hardhat compile
npx hardhat test
npx hardhat accounts
```

To start from scratch we are going to

```shell
rm ./contracts/*
rm -rf ignition
rm ./test/*
mkdir scripts/
```

Lo último que hemos estado viendo es cómo agregar pruebas usando loadFixture y todos los hoops que tenemos qué brincar para obtener los valores exactos que requerimos para que nuestras pruebas funcionen correctamente.

For the rest of the lesson we just saw different examples of how the tests would break if not using the correct parameters.

## Session 08 - Thursday

- [Video de la sesión](https://www.youtube.com/watch?v=OIdAUG1ggr4)
- [Notas Github](https://github.com/Encode-Club-Solidity-Bootcamp/Lesson-08)

Here we will learn to write deployment scripts.

To run a script:
npx hardhat run ./scripts/Test.ts

### 25-NOV-2024

Empezamos utilizando el proyecto que ya teníamos con Ballot.sol

El archivo se va a llamar scripts/DeployWithHardhat.ts

```typescript
import { viem } from "hardhat";
import { toHex, hexToString, formatEther } from "viem";
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

Y corremos `npx hardhat run ./scripts/DeployWithHardhat.ts`

Ahora sí vamos a configurar nuuestro archivo hardhat.config.ts para deployar a una testnet real.

`hardhat.config.ts`:

```typescript
import { task, type HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox-viem";

const config: HardhatUserConfig = {
  solidity: "0.8.27",
  networks: {
    sepolia: {
      url: "https://ethereum-sepolia-rpc.publicnode.com",
    },
  },
};

task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.viem.getWalletClients();
  for (const account of accounts) {
    console.log(account.account.address);
  }
});

export default config;
```

Y corremos `npx hardhat run ./scripts/DeployWithHardhat.ts --network sepolia`

You should get a DefaultWalletClientNotFoundError error. This is expected to happen because deploying a contract requires sending a transaction, and thus we need to specify an account to sign and pay for it.

Create a .env file in the root of your project:

```shell
PRIVATE_KEY=****************************************************************
POKT_API_KEY="********************************"
INFURA_API_KEY="********************************"
INFURA_API_SECRET="********************************"
ALCHEMY_API_KEY="********************************"
ETHERSCAN_API_KEY="********************************"
```

Now just follow the instructions from the correct section in here:
https://github.com/Encode-Club-Solidity-Bootcamp/Lesson-08

Hacemos npm install .env, hacemos los cambios necesarios en el hardhat.config.ts file y corremos otra vez el comando y ya podemos desplegar un contrato a una network pública!

Ahora si queremos pasar argumentos a nuestro deploy script lo hacemos de esta manera, usando ts-node:

`npx ts-node --files ./scripts/DeployWithViem.ts "arg1" "arg2" "arg3"`

Crear este file `DeployWithViem.ts`:

```typescript
async function main() {
  const proposals = process.argv.slice(2);
  if (!proposals || proposals.length < 1)
    throw new Error("Proposals not provided");
  console.log("Proposals:");
  proposals.forEach((element, index) => {
    console.log(`Proposal N. ${index + 1}: ${element}`);
  });
}
```

[0x5472756d70000000000000000000000000000000000000000000000000000000, 0x4b616d616c610000000000000000000000000000000000000000000000000000, 0x414d4c4f00000000000000000000000000000000000000000000000000000000]

2 repos for reference:
https://github.com/rodoard/tokenized-ballot/tree/main/scripts
https://github.com/Munaiz123/EncdeBootCamp_Group1/blob/main/Week2/Week2Submission.md


## Homework

• Develop and run scripts for “Ballot.sol” within your group to give voting rights, casting votes, delegating votes and querying results
• Write a report with each function execution and the transaction hash, if successful, or the revert reason, if failed

https://airtable.com/appdPRDngl0IGEYKT/shrhpnL6cmZ5bMSI6



