// SPDX-License-Identifier: MIT

pragma solidity ^0.8.1;

interface IToken {
  function mint(address to,  uint256 id, uint256 amount, bytes memory data) external;
  function burn(address to,  uint256 id, uint256 amount, bytes memory data) external;
}