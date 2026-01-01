// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

contract IOPNHello {
    string public message;

    constructor() {
        message = "Hello IOPN";
    }

    function setMessage(string calldata newMessage) external {
        message = newMessage;
    }
}
