pragma solidity ^0.8.2;

import "./ERC721.sol";

contract SuperMarioWorld is ERC721 {

    string public name; //ERC721Metadata

    string public symbol; //ERC721Metadata
    
    uint256 public tokenCount; //keep track NFT's minted, and will be unique ID for NFT

    constructor(string memory _name, string memory _symbol) {
        name = _name;
        symbol = _symbol;
    }

    // Returns a URL that points to the matadata
    function tokenURI(uint256 tokenId) public view returns (string memory) { //ERC721Metadata
        require(_owners[tokenId] != address(0), "TokenId does not exist");
        return _tokenURIs[tokenId];
    }

    // Creates a new NFT inside our collection
    function mint(string memory _tokenURI) public {
        
        tokenCount += 1;
        _balances[msg.sender] += 1;
        _owners[tokenCount] = msg.sender;
        _tokenURIs[tokenCount] = _tokenURI;

        emit Transfer(address(0), msg.sender, tokenCount); //address(0) indicates minting event

    }
    
    function supportsInterface(bytes4 interfaceId) public pure override returns(bool) {
        return interfaceId == 0x80ac58cd || interfaceId == 0x5b5e139;
    }
}