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

contract MyVault {
    
    mapping(address => uint) public balance;
    IERC20 public coin;
    
    constructor(address _erc20Address) {
        coin = IERC20(_erc20Address);
    }
    
    function aprovarDeposito(uint _quantity) public returns(bool) {
        require(coin.approve(address(this), _quantity), "MyVault: falha na aprovacao");
        return true;
    }
    
    function depositarTokens(uint _quantity) public returns(bool) {
        require(coin.transferFrom(msg.sender, address(this), _quantity), "MyVault: falha na transferencia");
        balance[msg.sender] += _quantity;
        return true;
    }
    
    function aprovarSaque(uint _quantity) public returns(bool) {
        require(coin.approve(address(this), _quantity), "MyVault: falha na aprovacao");
        return true;
    }
    
    function sacarTokens(uint _quantity) public returns(bool) {
        require(coin.transferFrom(address(this), msg.sender, _quantity ), "MyVault: falha na transferencia");
        balance[msg.sender] -= _quantity;
        return true;
    }
    
}
