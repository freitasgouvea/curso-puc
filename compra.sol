pragma solidity 0.8.9;

contract CompraVenda {
    
    address public comprador;
    address public vendedor; 
    
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
        string memory _cartorio,
        address _vendedor
        ) 
    {
        vendedor = _vendedor;
        valorTotal = _valorTotal;
        valorDaEntrada = _valorDaEntrada;
        quantidadeDeParcelas = _quantidadeDeParcelas;
        matricula = _matricula;
        cartorio = _cartorio;
        valorEmAberto = valorTotal;
        valorDaParcela = funcaoValorParcela();
    }
    
    function pagarEntrada(uint _valorPagamento) public returns (uint, string memory) {
        require(_valorPagamento == valorDaEntrada, "Valor da entrada incorreto.");
        require(valorEmAberto == valorTotal, "Entrada ja foi paga.");
        comprador = msg.sender;
        valorEmAberto = valorTotal - _valorPagamento;
        return(valorEmAberto, "valor em aberto");
    }
    
    function pagarParcela(uint _valorPagamento) public returns (uint, string memory) {
        require(_valorPagamento == valorDaParcela, "Valor da parcela incorreto");
        require(valorEmAberto <= valorTotal-valorDaEntrada, "Entrada nao foi foi paga.");
        require(comprador == msg.sender, "Obrigado, somente o comprador pode executar essa funcao");
        valorEmAberto = valorEmAberto - _valorPagamento;
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
