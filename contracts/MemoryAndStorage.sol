// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MemoryAndStorage {    
    //a dynamicly constructed variable instance to create and store user data.
    struct User { //mistake: following the above mistake, the id should be of type address.
        address id;
        uint balance;
    }
    //mapping to store users data. //mistake: it has key of uint. I believe id should always be address.
    mapping(address => User) public users; 
    
    //@description - function to add a new user
    //@param id - ID of the user to add.
    //@param balance - balance to be assigned to the user.
    function addUser(address id, uint balance) public {
        users[id] = User(id, balance);
    }

    //@description - function to update user balance
    //@param id - ID of the user to add.
    //@param balance - balance to be assigned to the user.
    //mistake 2: to add balance, it used " = ". It should use " += " assignment operator instead.
    function updateBalance(address id, uint balance) public {
        users[id].balance += balance;
    }

    //@description - function to retreive balance of a user
    //mistake: to return the balance, the function shoud have returns(uint) declared
    //@param id - ID of the user to add.
    //@return uint - balance of the user
    function getBalance(address id) public view returns(uint){
        return users[id].balance;
    }
}