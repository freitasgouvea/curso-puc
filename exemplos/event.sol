// SPDX-License-Identifier: MIT

pragma solidity 0.8.9;

contract MeuContrato {
    
    address public vendedor;
    uint public preco;
    
    event Pagamento(address comprador, uint valor);
    
    constructor(uint _preco) {
        vendedor = msg.sender;
        preco = _preco * 1 ether;
    }
    
    function pagar() public payable {
        require(msg.value == preco, "Valor incorreto");
        payable(vendedor).transfer(msg.value);
        emit Pagamento(msg.sender, msg.value);
    }
    
}
