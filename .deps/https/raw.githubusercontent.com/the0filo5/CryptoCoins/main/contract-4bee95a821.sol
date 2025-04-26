// SPDX-License-Identifier: PANAXIA LTD
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.27;

import {AccessControl} from "@openzeppelin/contracts@5.3.0/access/AccessControl.sol";
import {ERC20} from "@openzeppelin/contracts@5.3.0/token/ERC20/ERC20.sol";
import {ERC20Burnable} from "@openzeppelin/contracts@5.3.0/token/ERC20/extensions/ERC20Burnable.sol";

/// @custom:security-contact panaxiacap@gmail.com
contract TheosTestCoin is ERC20, ERC20Burnable, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    constructor(address recipient, address defaultAdmin, address minter)
        ERC20("Theos TestCoin", "TTC")
    {
        _mint(recipient, 1000000 * 10 ** decimals());
        _grantRole(DEFAULT_ADMIN_ROLE, defaultAdmin);
        _grantRole(MINTER_ROLE, minter);
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }
}
