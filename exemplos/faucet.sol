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
    uint256 public limit;
    IERC20 public coin;
    
    constructor(address _erc20Address, uint256 _limit) {
        coin = IERC20(_erc20Address);
        limit = _limit;
    }
    
    function deposit(uint _quantity) public returns(bool) {
        require(coin.allowance(msg.sender,address(this)) >= _quantity, "Faucet: insufficient approval" );
        require(coin.transferFrom(msg.sender, address(this), _quantity), "Faucet: failed transfer from");
        balance += _quantity;
        return true;
    }
    
    function withdraw(uint _quantity) public returns(bool) {
        require(_quantity < limit, "Faucet: request more than limit" );
        require(balance >= _quantity, "Faucet: isufficient faucet balance");
        require(coin.transfer(msg.sender, _quantity), "Faucet: failed transfer");
        balance -= _quantity;
        return true;
    }
}
