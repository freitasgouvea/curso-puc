pragma solidity 0.8.9;

contract CartaoDeVacina {

    string constant public nome = "Flavio Neto";
    
    string public unidade;
    uint public cnes;
    uint public data;  
    uint private lote;
    string private fabricante;
    string public vacinador;
    
    bool public imunizado = false;
    address public wallet;

}
