// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
    RWAConsumer
    IOPN demo contract consuming RWAAccessKey permissions.
*/

interface IRWAAccessKey {
    function hasValidKey(address user) external view returns (bool);
}

contract RWAConsumer {
    IRWAAccessKey public rwaKey;

    event ProtectedActionExecuted(address indexed user, uint256 timestamp);

    constructor(address rwaAccessKey) {
        require(rwaAccessKey != address(0), "INVALID_KEY_ADDRESS");
        rwaKey = IRWAAccessKey(rwaAccessKey);
    }

    /// @notice Example function gated by RWA access key
    function protectedAction() external {
        require(rwaKey.hasValidKey(msg.sender), "NO_RWA_ACCESS");

        emit ProtectedActionExecuted(msg.sender, block.timestamp);
    }
}
