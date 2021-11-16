// SPDX-License-Identifier: MIT

pragma solidity 0.8.9;

contract Mae {
    
    address public owner;
    
    modifier onlyOwner {
      require(msg.sender == owner, "Somente o proprietario pode fazer isso");
      _;
    }
    
    constructor() {
        owner = msg.sender;
    }
    
}

contract Filho is Mae {
    
    function executar() onlyOwner public view returns(string memory) {
        return ("ok, proprietario que chamou a funcao");
    }
    
}
