// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";

/**
 * @dev An extension to the ERC721 Token Standard, implements simple functionality such as minting an NFT
 */
contract SimpleERC721 is ERC721, ERC721Enumerable, ERC721URIStorage, Ownable {
    uint256 private _tokenIdCounter;

    constructor() ERC721("SimpleERC721", "SIMPLE") {}

    /**
    * @dev Public function that mints an NFT and sets its token URI
    */
    function mintItem(address to, string memory uri) public returns (uint256) {
        uint256 tokenId = _tokenIdCounter++;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
        return tokenId;
    }
}
