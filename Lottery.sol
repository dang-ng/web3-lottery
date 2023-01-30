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
    function Random() private view returns (uint){
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, Players)));
    }
    function pickWinner() public {
        require(msg.sender == Manager);
        payable(Players[(Random() % Players.length)]).transfer(address(this).balance);
        Players = new address[](0);
    }
}
