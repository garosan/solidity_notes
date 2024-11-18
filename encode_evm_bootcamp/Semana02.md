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
