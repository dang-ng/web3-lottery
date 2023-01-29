//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

contract Lottery {
    address public Manager;
    address[] public Players;

    constructor(){
        Manager = msg.sender;
    }
    function Enter() public payable {
        require(msg.value > .01 ether);
        Players.push(msg.sender);
    }
}
