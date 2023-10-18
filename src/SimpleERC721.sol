// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";
import "openzeppelin-contracts/contracts/utils/Strings.sol";

/**
 * @dev An implementation of the ERC721 Token Standard, adds simple functionality to the OpenZepplin contract
 */
contract SimpleERC721 is ERC721, Ownable {
    using Strings for uint256;

    uint256 public tokenIdCounter;
    string public baseURI;
    uint256 public TOTAL_SUPPLY = 10_000;
    uint256 public MINT_PRICE = 0.01 ether;

    constructor(string memory _name, string memory _symbol, string memory _baseURI, address initialOwner) ERC721(_name, _symbol) Ownable(initialOwner) {
        baseURI = _baseURI;
    }

    //    /**
    //    * @dev Public function that mints an NFT and sets its token URI
    //    */
    //    function mintItem(address to, string memory uri) public returns (uint256) {
    //        uint256 tokenId = tokenIdCounter++;
    //        _safeMint(to, tokenId);
    //        _setTokenURI(tokenId, uri);
    //        return tokenId;
    //    }

    function updateTotalSupply(uint256 _supply) public onlyOwner {
        TOTAL_SUPPLY = _supply;
    }

    function updatePrice(uint256 _price) public onlyOwner {
        MINT_PRICE = _price;
    }
}
