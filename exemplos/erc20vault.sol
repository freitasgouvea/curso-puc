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
    
    /* para executar as funcoes de deposito e saque e necessario previamente o msg.sender aprovar 
    este contrato gastar a quantidade desejada usando a funcao approve no contrato da coin */
    
    function depositarTokens(uint _quantity) public returns(bool) {
        require(coin.allowance(msg.sender,address(this)) >= _quantity, "MyVault: aprovacao insuficente" );
        require(coin.transferFrom(msg.sender, address(this), _quantity), "MyVault: falha na transferencia");
        balance[msg.sender] += _quantity;
        return true;
    }
    
    function sacarTokens(uint _quantity) public returns(bool) {
        require(balance[msg.sender] >= _quantity, "MyVault: balanco insuficente");
        require(coin.allowance(msg.sender,address(this)) >= _quantity, "MyVault: aprovacao insuficente" );
        require(coin.transferFrom(address(this), msg.sender, _quantity ), "MyVault: falha na transferencia");
        balance[msg.sender] -= _quantity;
        return true;
    }
    
}
