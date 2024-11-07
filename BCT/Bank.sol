//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract Bank{

    address public accHolder;

constructor() {

    accHolder = msg.sender;
}

uint256 balance=0;

function withdraw() public payable {
       require(msg.value > 0, "Withdraw am,out should be greater  than 0");
       require(msg.sender == accHolder, "You are not acc owner");
       payable(msg.sender).transfer(balance);
       balance = 0;
}

function deposite() public payable {
    require(msg.value > 0, "You are not acc owner");
    balance+= msg.value;
}

function showBalance() view public returns(uint){
    return balance;
}
}
