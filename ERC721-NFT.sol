pragma solidity 0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract MyNFT is ERC721URIStorage {
  uint public counter;

  constructor() ERC721("CryptoYNFT", "YNFT") {
    counter = 0;
  }

  function createNFTs(string memory tokenURI) public returns (uint) {
    uint tokenId = counter;
    _safeMint(msg.sender, tokenId);
    _setTokenURI(tokenId, tokenURI);
    counter ++;
    return tokenId;
  }

  function burn(uint256 tokenId) public virtual {
    require(_isApprovedOrOwner(msg.sender, tokenId), "You are not the owner nor approved!");
    super._burn(tokenId);
  }
}
