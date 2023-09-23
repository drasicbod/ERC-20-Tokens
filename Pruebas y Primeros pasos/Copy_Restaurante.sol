pragma solidity >=0.8.4 <0.9.0;
//SPDX-License-Identifier: MIT

contract Restaurante{

    //El conjunto de mesas está constituida por el número de mesa del restaurante y la cantidad de clientes que las integran
    struct mesas{
      uint numeroMesa;
      string nombreCliente;
      uint totalClientes;
    }


    uint[4] numeroMesa=[1,2,3,4]; 
    mapping(uint => mesas) public mesa;
    bool disponible=false;
    mesa(1)
    //Definimos una mesa como abierta al público. El restaurante tiene capacidad para 5 mesas
   
    function  AlgunaMesaDisponible (uint _numeroMesa) public view returns(bool){
        
       /* 
      for(uint i=0; i<=5; i++){
            if(mesa(numeroMesa[i]).totalClientes==0){
               disponible=true;
            }
       }
       */

        return disponible;
    }
}