pragma solidity 0.8.9;

contract MeuContrato {
    
    address public vendedor;
    address public comprador;
    
    constructor(){
        vendedor = msg.sender;
    }
    
    function SalvarAddress() public {
        comprador = msg.sender;
    }
    
    function VerAddress() public view returns(address) {
        return (msg.sender);
    }

}

contract Externo {
    
    function ChamarVerAddress(address _contractAddress) public view returns(address) {
        return(MeuContrato(_contractAddress).VerAddress());
    }
    
}
