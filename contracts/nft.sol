// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';

contract NFT is ERC721 {
    constructor() public ERC721("MyNft", "NFT") {
        _safeMint(msg.sender, 0);
    }
}