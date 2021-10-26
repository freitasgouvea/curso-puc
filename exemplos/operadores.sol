pragma solidity 0.8.9;

contract MeuContrato {
    
    uint public variavel = 10;
    
    function Somar(uint _valor) public {
        variavel = variavel + _valor;
    }
    
    function Subtrair(uint _valor) public {
        variavel = variavel - _valor;
    }
    
    function Multiplicar(uint _valor) public {
        variavel = variavel * _valor;
    }
    
    function Dividir(uint _valor) public {
        variavel = variavel / _valor;
    }
    
}
