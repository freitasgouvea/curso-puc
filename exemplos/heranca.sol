// SPDX-License-Identifier: MIT

pragma solidity 0.8.9;

contract Ownable {
    
  address public owner;

  constructor() {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    require(msg.sender == owner, "Ownable: caller is not the owner");
    _;
  }

}

contract MyContract is Ownable {
    
    function teste() onlyOwner public view returns(string memory) {
        return("MyContract: caller is the owner");
    }
    
}
