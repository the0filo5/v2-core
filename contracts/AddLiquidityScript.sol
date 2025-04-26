// SPDX-License-Identifier: MIT
pragma solidity ^0.5.16;

import "./UniswapV2Pair.sol";
import "TheosTestToken.sol"; // Your actual contract import for token0
import "TheosStableToken.sol";  //Your Actual Contract Import For Token1

contract AddLiquidityScript {
    TheosTestToken public token0;
    TheosStableToken public token1; 
    UniswapV2Pair public pair;

    constructor() public {

        token0 = address('0x88a2c78bd1AA32B6753636e3fCdA896e4E0c549C');  
        token1 = address('0x3d94e6291a3D00fb21986811a326fD5c0ec5e7c3');
        pair = UniswapV2Pair(address('0xB065e914155eFbfEbC0A19da541E3eb05Ae371C6'));
    }

    // Add liquidity by transferring tokens to pair and calling mint

    function addLiquidity(uint amount0, uint amount1) external {
        // Approve tokens to be transferred
        token0.approve(address(pair),amount0);
        token1.approve(address(pair),amount1);

        // Transfer tokens from deployer to pair contract
        token0.transferFrom(msg.sender,address(pair),amount0);
        token1.transferFrom(msg.sender,address(pair),amount1);

        // Mint LP tokens to deployer
        pair.mint(msg.sender);
    }
}