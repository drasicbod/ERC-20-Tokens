pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";

// Nombre y símbolo del contrato
//string public name = "Mis NFTs";
//string public symbol = "MNFT";

// Implementamos la interfaz ERC721
contract MyNFTs is ERC721 {
    // Constructor
    constructor() public {
        // Establecemos el nombre y el símbolo del contrato
        _setName(name);
        _setSymbol(symbol);
    }

    // Función para crear un NFT
    function createNFT(string memory _name, string memory _description) public {
        // Generamos una identificación única para el NFT
        uint256 id = _totalSupply() + 1;
        // Asignamos la propiedad del NFT al usuario que llama a la función
        _mint(msg.sender, id);
        // Establecemos el nombre y la descripción del NFT
        _setTokenURI(id, "https://mi-sitio-web.com/nft/" + id + "/metadata.json");
    }
}