//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./WorldToken.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

// The WorldToken contract inherits the ERC20 contract
contract WorldStaking {
    // we can interact with other contracts by declaring them as state variables
    WorldToken worldToken;
    address deadaddress = address(0xdeadbeef);

    // warning: none of this code works. just for proof of concept
    function stake(uint256 amount) public {
        worldToken.faucet(amount);
        worldToken.approve(msg.sender, amount);
        worldToken.transferFrom(msg.sender, address(this), amount);
        IERC20(deadaddress).transfer(msg.sender, amount);
    }
}