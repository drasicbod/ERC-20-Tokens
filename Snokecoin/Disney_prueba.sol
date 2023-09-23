// SPDX-License-Identifier: MIT
pragma solidity >=0.4.4 <0.7.0;
pragma experimental ABIEncoderV2;
import "./ERC20.sol";


contract Disney{
    
    // --------------------------------- DECLARACIONES INICIALES ---------------------------------
    
    // Instancia del contato token
    ERC20Basic private token;

    

     // Direccion de Disney (owner)
    address payable public owner;
    
    // Constructor 
    constructor (uint256 total, string memory _name, string memory _symbol, uint8 _decimals) public {
        token = new ERC20Basic(total,_name, _symbol, _decimals);
        owner = msg.sender;
    }

using SafeMath for uint256;

    struct Cliente{
        address wallet;
        uint quantityTokens;
        string[] atraccionesTotales;
    }

    address[] Clientes;
    mapping (address => Cliente) persona;
    
    struct Atraccion{
        string nombre;
        uint coste;
    }
    string[] Atracciones;
    mapping (string => Atraccion) detalleAtraccion;

    
    
    function precioToken(uint _numTokens) public pure returns(uint){
        return 1;
    }

    //devuelve el valance de tokens disponibles a la venta
    uint availableTokens=100;
    function balanceOf() public view returns(uint){
        return availableTokens;
    }

    function entraAlParque() public{
        bool clienteNuevo=true;
        for(uint i=0; i<Clientes.length; i++){ //El cliente no puede estar registrado en la bbdd del parque
            if(Clientes[i]==msg.sender){clienteNuevo=false;}
        }
        if(clienteNuevo==true){
        Clientes.push(msg.sender);
        persona[msg.sender].wallet=msg.sender;
        } 
    }

    function comprarTokens(uint _numTokens) public payable{
        entraAlParque();
        require(msg.value>=precioToken(_numTokens), "No hay suficiente dinero.");
        require(balanceOf()>=_numTokens, "No hay suficiente dinero.");
        availableTokens-=_numTokens;
        token.transfer(msg.sender, _numTokens);
        persona[msg.sender].quantityTokens+=_numTokens;
        msg.sender.transfer(msg.value - precioToken(_numTokens));

    }

    modifier Unicamente(address _direccion) {
        require(_direccion == msg.sender, "No tienes permisos para ejecutar esta funcion.");
        _;
    }

    //Creamos una nueva atracción
    function nuevaAtraccion(string memory _atraccion, uint _cuestaTokens) public Unicamente(msg.sender){
        Atracciones.push(_atraccion);
        detalleAtraccion[_atraccion]=Atraccion(_atraccion,_cuestaTokens);        
    }


    //nos subimos a una atracción
    function atraccion(string memory _atraccion) public{
        require(persona[msg.sender].quantityTokens>=detalleAtraccion[_atraccion].coste, "No tienes suficientes tokens.");
        token.transferencia_disney(msg.sender, address(this), detalleAtraccion[_atraccion].coste);
        persona[msg.sender].atraccionesTotales.push(_atraccion);
        persona[msg.sender].quantityTokens-=detalleAtraccion[_atraccion].coste;
    }
}