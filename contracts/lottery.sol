// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract Lottery {
    address payable[] public players;
    address public manager;
    
    constructor() {
        manager = msg.sender;
    }
    
    receive() external payable {
        require(msg.value == 0.1 ether);
        players.push(payable(msg.sender));
    }
    
    function getBalance() public view returns(uint) {
        require(msg.sender == manager);
        return address(this).balance;
    }
}
