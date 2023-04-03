// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Final is ERC20 {
    constructor() ERC20("Final", "FIN") {
        _mint(msg.sender, 1000000000000000000000000);
    }

    function faucet(uint256 amount) public {
        _mint(msg.sender, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}