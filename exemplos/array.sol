// SPDX-License-Identifier: MIT

pragma solidity 0.8.9;

contract CarteiraDeVacina {
  
  struct Vacina {
    uint index;
    string tipo;
    uint data;
  }
  
  Vacina[] public arrayDeVacina;
  
  function adicionarVacina(string memory _tipo) public {
    arrayDeVacina.push(Vacina(arrayDeVacina.length, _tipo, block.timestamp));
  }
  
  function quantidadeTotalDeVacinas() public view returns(uint) {
     return (arrayDeVacina.length);
  }
  
  function quantidadeDeDoses(string memory _tipo) public view returns(uint){
      uint quantidade;
      uint i;
      for(i = 0; i < arrayDeVacina.length; i ++) {
          if (keccak256(abi.encodePacked(arrayDeVacina[i].tipo)) == keccak256(abi.encodePacked(_tipo))) {
              quantidade++;
          }
      }
      return(quantidade);
  }

}
