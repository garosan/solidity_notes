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
