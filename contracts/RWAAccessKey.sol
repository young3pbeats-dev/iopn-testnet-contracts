// SPDX-License-Identifier: MIT
pragma solidity ^0.8.31;

/*
    RWAAccessKey
    IOPN-oriented Real World Asset access primitive.

    Non-transferable access key (soulbound-style)
    representing an off-chain RWA attestation.
*/

contract RWAAccessKey {
    address public issuer;

    struct RWAKey {
        string assetId;        // Off-chain RWA identifier
        uint256 issuedAt;      // Timestamp of issuance
        bool active;           // Revocable flag
    }

    /// @dev user => RWA key
    mapping(address => RWAKey) private keys;

    event KeyIssued(address indexed user, string assetId);
    event KeyRevoked(address indexed user);

    modifier onlyIssuer() {
        require(msg.sender == issuer, "NOT_ISSUER");
        _;
    }

    constructor() {
        issuer = msg.sender;
    }

    /// @notice Issue a new RWA access key (one per address)
    function issueKey(address user, string calldata assetId) external onlyIssuer {
        require(user != address(0), "INVALID_USER");
        require(!keys[user].active, "KEY_ALREADY_EXISTS");

        keys[user] = RWAKey({
            assetId: assetId,
            issuedAt: block.timestamp,
            active: true
        });

        emit KeyIssued(user, assetId);
    }

    /// @notice Revoke an existing key
    function revokeKey(address user) external onlyIssuer {
        require(keys[user].active, "NO_ACTIVE_KEY");

        keys[user].active = false;
        emit KeyRevoked(user);
    }

    /// @notice Check if an address holds a valid RWA key
    function hasValidKey(address user) external view returns (bool) {
        return keys[user].active;
    }

    /// @notice Read full key data
    function getKey(address user)
        external
        view
        returns (string memory assetId, uint256 issuedAt, bool active)
    {
        RWAKey memory key = keys[user];
        return (key.assetId, key.issuedAt, key.active);
    }
}
