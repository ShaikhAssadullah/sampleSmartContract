// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GetSenderAddress {

    address private adminAddress;
    string public message;

    constructor() {
        adminAddress = msg.sender;
    } 

    function isAdmin() public view returns (bool){
        if(msg.sender == adminAddress) {
            return true;
        }
        else return false;
    }
    
    function errorPermissions() public returns (string memory){
        message = "error - insufqficient permissions";
        return message;
    }
    
    function getSenderAddress() public view returns(address) {
        
        if(isAdmin()) {
           return msg.sender;
        }
    }
}