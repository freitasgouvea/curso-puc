// SPDX-License-Identifier: MIT

pragma solidity 0.8.9;

interface IMeuContrato {
    function verMensagem() external view returns(string memory);
}

contract MeuContrato is IMeuContrato {

    string mensagem = "ola";

    function verMensagem() public view returns(string memory) {
        return(mensagem);
    }

}

contract OutroContrato {

    IMeuContrato public meuContrato; // crio uma variavel do outro contrato dentro deste contrato usando a interface

    constructor(address _addressMeuContrato){
        meuContrato = IMeuContrato(_addressMeuContrato);// instancio o outro contrato através do address dele
    }

    function verMensagemDoOutroContrato() public view returns(string memory) {
        return(meuContrato.verMensagem()); // executo uma função do outro contrato neste contrato
    }

}
