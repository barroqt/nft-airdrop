const NFT = artifacts.require('nft.sol');
const airdrop = artifacts.require('airdrop');

contract('airdrop', recipients => {
    let nft;
    const [r1, r2, r3, _] = recipients;

    beforeEach(async () => {
        nft = await NFT.new();
        await airdrop.whitelistRecipients(recipients);
    });

    it('should airdrop a NFT to each eligible recipient', async () => {
        await airdrop.airdropNFT([r1, r2, r3]);
        await airdrop.claim({from: r1});
        await airdrop.claim({from: r2});
        await airdrop.claim({from: r3});
        const owner1 = await nft.ownerOf();
        const owner2 = await nft.ownerOf();
        const owner3 = await nft.ownerOf();
        assert(owner1 === r1);
        assert(owner2 === r2);
        assert(owner3 === r3);
    })
});