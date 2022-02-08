// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import '@openzeppelin/contracts/token/ERC721/IERC721.sol';

contract Airdrop {
    uint public tokenId;
    mapping(uint => address) public nftToOwner;
    mapping(address => bool) public eligibleOwner;

    function airdropNFT(address[] memory _recipients) external {
        for(uint i = 0; i < _recipients.length; i++) {
            nftToOwner[tokenId] = _recipients[i];
            IERC721(_recipients[i]).transferFrom(msg.sender, _recipients[i], tokenId);
        }
    }

    // insert condition for airdrop eligibility in this function
    function whitelistRecipients(address[] memory _recipients) external {
        for(uint i = 0; i < _recipients.length; i++) {
            eligibleOwner[_recipients[i]] = true;
        }
    }

    function claim() external {
        require(eligibleOwner[msg.sender], "Not eligible for airdrop");
        eligibleOwner[msg.sender] = false;
        IERC721(nftToOwner[tokenId]).transferFrom(nftToOwner[tokenId], msg.sender, tokenId);
    }
}