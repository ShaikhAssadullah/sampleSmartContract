// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelloWorld {

    //global variables
    uint public count = 0;
    string message = "hello, this is my first smart contract.";


    //constructor
    constructor (string memory _message) {
        message = _message;
    }

    //functions
    function increment() public  {
        count++;
    } 

    function decrement() public {
        count--;
    }

    function hello() public pure returns(string memory) {
        string memory message2 = "hello, this is 2nd message.";
        return message2;
    }

    function getMessage() public view returns(string memory){
        return message;
    }
}