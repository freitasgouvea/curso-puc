pragma solidity 0.8.9;

contract Loteamento {
    
    address public dono;
    mapping(uint => Lote) public listaDeLotes;
    
    struct Lote {
        uint numeroDoLote;
        uint precoDoLote;
        address proprietario;
        bool disponivel;
    }
    
    constructor() {
        dono = msg.sender;
    }
    
    function criarLote(uint _numero, uint _preco) public {
        require(msg.sender == dono, "Apenas o dono pode criar lotes");
        require(listaDeLotes[_numero].numeroDoLote != _numero, "Esse lote ja existe");
        listaDeLotes[_numero] = Lote(_numero, _preco, dono, true);
    }
    
    function comprarLote(uint _numero) public payable {
        require(listaDeLotes[_numero].numeroDoLote == _numero, "Lote inexistente");
        require(listaDeLotes[_numero].disponivel, "Lote indisponivel");
        require(msg.value == listaDeLotes[_numero].precoDoLote, "Valor incorreto");
        payable(listaDeLotes[_numero].proprietario).transfer(msg.value);
        listaDeLotes[_numero] = Lote(_numero, msg.value, msg.sender, false);
    }
    
    function transferirLote(uint _numero, address _novoProprietario) public {
        require(listaDeLotes[_numero].numeroDoLote == _numero, "Lote inexistente");
        require(msg.sender == listaDeLotes[_numero].proprietario, "Apenas o proprietario pode transferir");
        listaDeLotes[_numero] = Lote(_numero, listaDeLotes[_numero].precoDoLote, _novoProprietario, false);
    }
    
    function anunciarLote(uint _numero, uint _preco) public {
        require(listaDeLotes[_numero].numeroDoLote == _numero, "Lote inexistente");
        require(msg.sender == listaDeLotes[_numero].proprietario, "Apenas o proprietario pode colocar a venda");
        listaDeLotes[_numero] = Lote(_numero, _preco, listaDeLotes[_numero].proprietario , true);
    }
    
    function cancelarAnuncioLote(uint _numero) public {
        require(listaDeLotes[_numero].numeroDoLote == _numero, "Lote inexistente");
        require(msg.sender == listaDeLotes[_numero].proprietario, "Apenas o proprietario pode cancelar o anuncio");
        require(listaDeLotes[_numero].disponivel, "Este lote nao esta a venda");
        listaDeLotes[_numero].disponivel = false;
    }
}
