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

[Original Article](https://www.rareskills.io/learn-solidity/erc20-tuotrial)
