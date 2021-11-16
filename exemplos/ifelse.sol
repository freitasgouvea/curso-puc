// SPDX-License-Identifier: alo

pragma solidity 0.8.9;

contract MeuContrato {
    
    address public vendedor;
    uint public parcela;
    uint public precoTotal;
    uint internal saldo;
    
    constructor(uint _preco, uint _quantidadeDeParcelas) {
        vendedor = msg.sender;
        precoTotal = _preco;
        parcela = precoTotal/_quantidadeDeParcelas;
    }
    
    function pagar() public payable {
        require(msg.value == parcela, "Valor incorreto");
        if(saldo + msg.value == precoTotal) {
            payable(vendedor).transfer(saldo);
            saldo = 0;
        } else {
            saldo = saldo + msg.value;
        }
    }
    
    function verSaldo() public view returns(uint){
        return(saldo);
    }
    
}
