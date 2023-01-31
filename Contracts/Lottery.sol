//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

contract Lottery {
    address public Manager;
    address[] public Players;

    constructor(){
        Manager = msg.sender;
    }
    function getPlayers() public view returns (address[] memory){
        return Players;
    }
    function Enter() public payable {
        require(msg.value > .01 ether);
        Players.push(msg.sender);
    }
    function Random() private view returns (uint){
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, Players)));
    }
    function pickWinner() public restricted {
        payable(Players[(Random() % Players.length)]).transfer(address(this).balance);
        Players = new address[](0);
    }
    modifier restricted(){
        require(msg.sender == Manager);
        _;
    }
}
