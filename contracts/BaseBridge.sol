// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import '@openzeppelin/contracts/token/ERC1155/IERC1155.sol';
import './Itoken.sol';

contract BridgeBase {
  address public admin;
  IToken public token;
  uint public nonce;
  mapping(uint => bool) public processedNonces;

  enum Step { Burn, Mint }
  event Transfer(
    address from,
    address to,
    uint id ,
    uint amount,
    uint date,
    uint nonce,
    Step indexed step
  );

  constructor(address _token) {
    admin = msg.sender;
    token = IToken(_token);
  }

  function burn(address to,  uint256 id, uint256 amount, bytes memory data) virtual external {
    token.burn(msg.sender,id,amount,data);
    emit Transfer(
      msg.sender,
      to,
      id,
      amount,
      block.timestamp,
      nonce,
      Step.Burn
    );
    nonce++;
  }

  function mint(address to,  uint256 id, uint256 amount, bytes memory data, uint otherChainNonce) virtual external {
    require(msg.sender == admin, 'only admin');
    require(processedNonces[otherChainNonce] == false, 'transfer already processed');
    processedNonces[otherChainNonce] = true;
    token.mint(msg.sender, id , amount,data);
    emit Transfer(
      msg.sender,
      to,
      id,
      amount,
      block.timestamp,
      otherChainNonce,
      Step.Mint
    );
  }
}