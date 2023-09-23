//SPDX-License-Identifier:AFL-1.1

///@title: prueba1
///@dev: description
///@custom:dev-run-script file_path

pragma solidity >0.4.4 <0.9.0;


contract PrimerContrato{

function prueba1() public view returns(address){
    return msg.sender;
}

}