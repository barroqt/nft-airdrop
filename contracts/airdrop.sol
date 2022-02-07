// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import '@openzeppelin/contracts/token/ERC721/IERC721.sol';

contract Airdrop {
    uint public tokenId;
    mapping(uint => address) public nftToOwner;

    function airdropNFT(address[] memory _recipients) external {
        for(uint i = 0; i < _recipients.length; i++) {
            nftToOwner[tokenId] = _recipients[i];
            IERC721(_recipients[i]).transferFrom(msg.sender, _recipients[i], tokenId);
        }
    }

    // whitelist owners

    // claim
}