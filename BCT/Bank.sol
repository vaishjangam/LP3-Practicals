//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;
contract BankAcc{
    address public accHolder;
    uint256 Balance=0;

    constructor(){
        accHolder=msg.sender;
    }

    function Withdraw() public payable {
        require(Balance > 0, "You don't have enough balance");
        require(msg.sender == accHolder, "You are not Account Holder");
        payable( msg.sender).transfer(Balance);
        Balance=0;

    }
    function Deposite() public payable{
        require(msg.sender == accHolder, "You are not Account Holder");
        require(msg.value > 0, "Deposite amount should be grater than 0");
        Balance+=msg.value;

    }
    function showBalance() view public returns(uint){
        require(msg.sender == accHolder, "You are not Account Holder");
        return Balance;
    }

}
