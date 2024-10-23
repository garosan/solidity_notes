# Layout of a Solidity Source File

Source files can contain an arbitrary number of contract definitions, import , pragma and using for directives and struct, enum, function, error and constant variable definitions.

What is a [contract definition](https://docs.soliditylang.org/en/latest/structure-of-a-contract.html#contract-structure)?
What is a [using for](https://docs.soliditylang.org/en/latest/contracts.html#using-for) directive?

## SPDX License Identifier

The Solidity compiler encourages the use of machine-readable SPDX license identifiers.

The compiler does not validate that the license is part of the [list of allowed licenses](https://spdx.org/licenses/) but it does include the supplied string in the bytecode metadata.

If you do not want to specify a license or if the source code is not open-source, please use the special value UNLICENSED.

## Pragmas

The `pragma` keyword is used to enable certain compiler features or checks. If you import another file, the pragma from that file does not automatically apply to the importing file.

### Version pragma

Source files can (and should) be annotated with a version pragma to reject compilation with future compiler versions that might introduce incompatible changes.
