pragma solidity 0.8.9;

contract CompraEVenda {
    
    string public comprador;
    string vendedor;
    string matricula;
    string cartorio;
    string dataDeVencimento;
    bool quitado = false;
    uint public valorTotal = 10000;
    uint public valorDaEntrada;
    uint public valorEmAberto;
    uint public valorDaParcela;
    uint quantidadeDeParcelas;
    uint porcentagemDaMulta;
    
    function PagarEntrada(uint _valorPagamento) public returns(uint, string memory) {
        valorDaEntrada = _valorPagamento;
        valorEmAberto = valorTotal - _valorPagamento;
        return(valorEmAberto, "valor em aberto");
    }

}
