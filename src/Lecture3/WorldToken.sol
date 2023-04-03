//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// The WorldToken contract inherits the ERC20 contract
contract WorldToken is ERC20 {
    constructor() ERC20("World Token", "WORLD") {
        _mint(msg.sender, 1000000000000000000000000);
    }

    // The "faucet" function implements polymorphism by adding unique functionality to the WorldToken contract despite it inheriting ERC20
    function faucet(uint256 amount) public {
        _mint(msg.sender, amount);
    }
}