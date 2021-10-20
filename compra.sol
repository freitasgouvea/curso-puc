pragma solidity 0.8.9;

contract CompraVenda {
    
    string comprador;
    string vendedor; 
    
    string public matricula; 
    string public cartorio;
    
    string dataDeVencimento;
    
    bool quitado = false;
    
    uint public valorTotal;
    uint public valorDaEntrada;
    uint public quantidadeDeParcelas;
    uint public porcentagemDaMulta; 
    uint public valorDaParcela;
    uint public valorEmAberto;
    
    constructor(
        uint _valorTotal,
        uint _valorDaEntrada,
        uint _quantidadeDeParcelas,
        string memory _matricula,
        string memory _cartorio
        ) 
    {
        valorTotal = _valorTotal;
        valorDaEntrada = _valorDaEntrada;
        quantidadeDeParcelas = _quantidadeDeParcelas;
        matricula = _matricula;
        cartorio = _cartorio;
        valorEmAberto = valorTotal;
        valorDaParcela = funcaoValorParcela();
    }
    
    function pagarEntrada(uint _valorPagamento) public returns (uint, string memory) { 
        valorEmAberto = valorTotal - _valorPagamento;
        return(valorEmAberto, "valor em aberto");
    }
    
    function pagarParcela(uint _valorDaParcela) public returns (uint, string memory) {
        valorEmAberto = valorEmAberto - _valorDaParcela;
        return(valorEmAberto, "valor em aberto");
    }
    
    function funcaoValorParcela() public view returns (uint){
        uint calculoValorParcela = (valorTotal-valorDaEntrada)/quantidadeDeParcelas;
        return(calculoValorParcela);
    }
    
    function valorDaMulta(uint _porcentagemDaMulta) public view returns(uint, string memory) {
        uint multa = _porcentagemDaMulta*valorTotal/100;
        return(multa, "valor da multa");
    }
    
}
