pragma solidity >=0.8.4 <0.9.0;
pragma experimental ABIEncoderV2;
//SPDX-License-Identifier: MIT

contract SmartContract1 {
    
    // Almacenamiento de la informacion del Factory
    mapping (address => address) public MiContratoPersonal;
    
    function Factory() public {
        address direccion_nuevo_contrato = address (new SmartContract2(msg.sender, 14, 5)); 
        MiContratoPersonal[msg.sender] = direccion_nuevo_contrato;
    }
}

contract SmartContract2 {
    
    address public owneer;
    uint c_a;
    int c_b;

    constructor (address _direccion, uint a, uint b) public {
        owneer = _direccion;
        c_a=a;
        c_b=int(b);
    }

    int resultado;
    function suma() public returns(int){
        resultado = int(c_a)-int(c_b);
        return resultado;
    }
    
}

