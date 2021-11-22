// SPDX-License-Identifier: MIT

pragma solidity 0.8.9;

contract CarteiraDeVacina {
  
  struct Vacina {
    uint index;
    string tipo;
    uint data;
  }
  
  Vacina[] public arrayDeVacina; // o array salva dados e objetos em sequencia. o index comeca no zero: array[0], array[1], array[2]...
  
  function adicionarVacina(string memory _tipo) public {
    arrayDeVacina.push(Vacina(arrayDeVacina.length, _tipo, block.timestamp)); // array.push = adiciona um membro ao array
  }
  
  function quantidadeTotalDeVacinas() public view returns(uint) {
     return (arrayDeVacina.length); // array.length = retorna a quantidade de membros do array
  }
  
  function quantidadeDeDoses(string memory _tipo) public view returns(uint){
      uint quantidade;
      // for loop: o codigo e executado em loop passando por cada um dos membros do array for (inicializador; condicao; finalizador)
      uint i;
      for(i = 0; i < arrayDeVacina.length; i ++) {
          // o solidity nao consegue comparar strings. para isso é necessario gerar um hash com a funcao criptografica keccak256 
          // e traduzir a string com o abi.encodePacked
          if (keccak256(abi.encodePacked(arrayDeVacina[i].tipo)) == keccak256(abi.encodePacked(_tipo))) {
              quantidade++;
          }
      }
      return(quantidade);
  }

}
