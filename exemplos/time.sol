pragma solidity 0.8.9;

contract MeuContrato {
    
    uint public dataDeCriacao;
    uint public dataVencimento;
    
    constructor(uint _dias) {
        dataDeCriacao = block.timestamp;
        dataVencimento = block.timestamp + _dias * 864000;
    }
    
    function AtualizarVencimento() public {
        require(block.timestamp <= dataVencimento, "A data de vencimento e maior que a atual");
        dataVencimento = block.timestamp + 30 * 864000; 
        //adiciona 30 dias ao tempo do blocl
        // dataVencimento = dataVencimento + 30 * 864000; 
        // adiciona 30 dias sobre a ultima data de vencimento
    }
    
}
