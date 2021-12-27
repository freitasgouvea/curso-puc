
  
//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.9;

interface IERC20 {
    function balanceOf(address who) external view returns (uint256);
    function transfer(address to, uint256 value) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function transferFrom(address from, address to, uint256 value) external returns (bool);
    function approve(address spender, uint256 value) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract Faucet {
    
    uint256 public balance;
    IERC20 public coin;
    
    constructor(address _erc20Address) {
        coin = IERC20(_erc20Address);
    }
    
    function depositarTokens(uint _quantity) public returns(bool) {
        require(coin.allowance(msg.sender,address(this)) >= _quantity, "Faucet: aprovacao insuficente" );
        require(coin.transferFrom(msg.sender, address(this), _quantity), "Faucet: falha na transferencia");
        balance += _quantity;
        return true;
    }
    
    function sacarTokens() public returns(bool) {
        require(balance >= 10000, "Faucet: balanco insuficente");
        require(coin.balanceOf(msg.sender) < 100, "Faucet: balanco maior que 100 Coins");
        require(coin.transfer(msg.sender, 10000), "Faucet: falha na transferencia");
        balance -= 10000;
        return true;
    }
    
}
