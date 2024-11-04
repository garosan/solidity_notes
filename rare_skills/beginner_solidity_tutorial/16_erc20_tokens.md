# ERC20 Tokens

ERC20 tokens typically have a name and a symbol. For example, ApeCoin has the name "ApeCoin" but the symbol "APE". The name of the token generally doesn’t change, so we'll set it in the constructor and not provide any functions to change it later. We'll make these variables public so that anyone can check the name and symbol of the contract.

We also need to store everyone's balances.

Code so far:

```solidity
contract ERC20 {
    string public name;
    string public symbol;

    mapping(address => uint256) public balanceOf;

    constructor(string memory _name, string memory _symbol) {
        name = _name;
        symbol = _symbol;
    }
}
```

We say `balanceOf` because that is part of the ERC20 [specification](https://eips.ethereum.org/EIPS/eip-20). ERC20 as a specification means that people can call the function `balanceOf` on your contract, supply an address, and get how many tokens that address owns.

Everyone's balance is zero right now, so we need a way to bring tokens into existence. We'll allow a special address, the person who deployed the contract, to create tokens at will:

```solidity
contract ERC20 {
    string public name;
    string public symbol;

    mapping(address => uint256) public balanceOf;
    address public owner;

    constructor(string memory _name, string memory _symbol) {
        name = _name;
        symbol = _symbol;

        owner = msg.sender;
    }

    function mint(address to, uint256 amount) public {
        require(msg.sender == owner, "only owner can create tokens");
        balanceOf[owner] += amount;
    }
}
```

It is general practice that the function mint() takes to and amount as the parameter argument. It allows for the contract deployer to mint tokens to other accounts. **For the sake of simplicity in this article, the function `mint()` only allows the deployer of the mint tokens into his account.**

To keep track of how many tokens there are in existence, the ERC20 specification requires a public function or variable called totalSupply that tells us how many tokens have been created:

```solidity
contract ERC20 {
    string public name;
    string public symbol;

    mapping(address => uint256) public balanceOf;
    address public owner;

    uint256 public totalSupply;

    constructor(string memory _name, string memory _symbol) {
        name = _name;
        symbol = _symbol;

        owner = msg.sender;
    }

    function mint(address to, uint256 amount) public {
        require(msg.sender == owner, "only owner can create tokens");
        totalSupply += amount;
        balanceOf[owner] += amount;

    }

    function transfer(address to, uint256 amount) public {
        require(balanceOf[msg.sender] >= amount, "you aint rich enough");
        require(to != address(0), "cannot send to address(0)");
        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
    }
}
```

### Decimals

Remember this is the largest number a `uint256` can represent:

`115792089237316195423570985008687907853269984665640564039457584007913129639935`

To be able to describe "decimals", we say the 18 zeros to the right are the fractional part of the coin:

`10000000000000000000000000000000000000000000000000000000000.000000000000000000`

Thus, if our ERC20 has 18 decimals, we can have at most `10000000000000000000000000000000000000000000000000000000000` full coins.

That's 10 octodecillion coins or 1 quadrillion x 1 quadrillion x 1 quadrillion x 1 trillion.

We shouldn't need more than this for our applications.

18 decimal places is pretty standard, but some coins use 6 decimal places.

As a sidenote:

- Bitcoin (BTC) has 8 decimal places. The smallest unit, called a _Satoshi_, is 0.00000001 BTC.
- Ethereum (ETH) has 18 decimal places. The smallest unit, called a _Wei_, is 0.000000000000000001 ETH.
- Solana (SOL) has 9 decimal places. The smallest unit, called a _Lamport_, is 0.000000001 SOL.

So with these additions, our token should look like this now:

```solidity

contract ERC20 {
    string public name;
    string public symbol;

    mapping(address => uint256) public balanceOf;
    address public owner;
    uint8 public decimals;

    uint256 public totalSupply;

    constructor(string memory _name, string memory _symbol, uint8 decimals) {
        name = _name;
        symbol = _symbol;
        decimals = 18;

        owner = msg.sender;
    }

    function mint(address to, uint256 amount) public {
        require(msg.sender == owner, "only owner can create tokens");
        totalSupply += amount;
        balanceOf[owner] += amount;
    }
}
```

If you are paying attention, I did throw a curve ball at you here. The number type for the decimals variable is `uint8`, not `uint256`. uint8 can only represent numbers up to 255. However, a `uint256` has 77 zeros. Thus, it isn't possible to have more than 77 decimal places if you want to have one whole coin. So the standard dictates we use a `uint8` since the number of decimals can never be very large.

### Transfer

Let's go back to our transfer function to explain one thing:

```solidity
function transfer(address to, uint256 amount) public {
    require(balanceOf[msg.sender] >= amount, "you aint rich enough");
    require(to != address(0), "cannot send to address(0)");
    balanceOf[msg.sender] -= amount;
    balanceOf[to] += amount;
}
```

Take a look at this line of code:

`require(to != address(0), “cannot send to address(0))`

What is this doing? Well, nobody "owns" the zero address, so tokens sent there are un-spendable. By convention, sending a token to the zero address should reduce the totalSupply so we want to have a separate function for that.

### Allowance

Allowance enables an address to spend someone else's tokens, up to a limit that they specify.

Why would you allow someone to spend tokens for you? This is a very long story, but to summarize, think about how you would “know” someone transferred you ERC20 tokens. All that happens is a function gets executed and a mapping changed values. You didn’t “receive” the tokens, they just became associated with your address.

[Original Article](https://www.rareskills.io/learn-solidity/erc20-tuotrial)

### `transferFrom`
