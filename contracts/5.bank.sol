// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract bankSilicon {

    //mapping to store amoubt
    address private owner;
    mapping(address => uint) balance; 

    //add balance for the first time to the contract owner.
    constructor() {
        owner = msg.sender;
        balance[owner] += 1000;
    }

    //nodifier for admin only
    modifier ownerOnly {
        require(msg.sender == owner, "Only admin can perform this transaction");
        _;
    }
    

    //function to retreive the balance of a user
    function getBalance(address _address) public view ownerOnly returns(uint) {
        return balance[_address];
    }

    //function to transfer balance from one acc to another.
    function transferBalance(address recipient, uint _balance) public ownerOnly {

        require(recipient != address(0), "Error - Please determine address to transfer the balance to.");
        require(_balance > 0, "Error - Please determine balance to transfer.");
        require(balance[owner] >= _balance, "Error - Inssufficient funds to transfer.");
        require(owner != recipient, "Error - sender and reciever cannot be the same.");

        uint prevSenderBal = balance[owner];
        uint prevReceiveBal = balance[recipient];

        balance[owner] -= _balance;
        balance[recipient] += _balance;

        assert(balance[owner] == prevSenderBal - _balance);
        assert(balance[recipient] == prevReceiveBal + _balance);
    }

}