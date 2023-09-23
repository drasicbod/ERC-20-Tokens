pragma solidity >=0.8.4 <0.9.0;
//SPDX-License-Identifier: MIT

contract Restaurante{
 address payable public Owner;
    //El conjunto de mesas está constituida por el número de mesa del restaurante y la cantidad de clientes que las integran
    struct mesas{
      uint numeroMesa;
      string nombreCliente;
      uint totalClientes;
    }

    uint[4] numeroMesa=[1,2,3,4]; 
    mapping(uint => mesas) public mesa;

    //Definimos una mesa como abierta al público. El restaurante tiene capacidad para 5 mesas
   
    function  AlgunaMesaDisponible () public view returns(bool){
        bool disponible=false;
      for(uint i=0; i<=5; i++){
            if(mesa[numeroMesa[i]].totalClientes==0){
               disponible=true;
            }
       }
        return disponible;
    }

    //Cada mesa tiene capacidad para 6 clientes
    modifier NoExcedeAforo (uint _numeroMesa){
        require(mesa[numeroMesa[_numeroMesa]].totalClientes<=6,"La mesa esta completa");
        _;
    }

    //Llega un nuevo cliente al restaurante.
    function NuevoClienteNuevaMesa(string memory _cliente, uint _numeroMesa) public {

        mesa[numeroMesa[_numeroMesa]]=mesas(_numeroMesa,_cliente,1);

    }

    function NuevoClienteViejaMesa(uint _numeroMesa) public NoExcedeAforo(_numeroMesa){

        mesa[numeroMesa[_numeroMesa]].totalClientes++;

    }
     function verMesa(uint _numeroMesa) public view returns(uint){
         return mesa[numeroMesa[_numeroMesa]].totalClientes;
    }

    function vaciarMesa(uint _numeroMesa) internal {
        mesa[numeroMesa[_numeroMesa]]=mesas(_numeroMesa,"NADIE",0);
    }

}