# IOPN Testnet Contracts

Minimal Solidity contracts deployed on IOPN Testnet.

---

## IOPNHello.sol

**Network:** IOPN Testnet  
**Address:** https://testnet.iopn.tech/address/0x1FcEBbA7452F4c78265Ad29B5896675bde74525d

---

## RWAAccessKey.sol

**Network:** IOPN Testnet

**Address:** https://explorer.iopn.io/address/0xfaEfe1721B1B001A92cdebf6Fd1c794B09cC194A

Type: RWA Access Key / Attestation Primitive
A minimal non-transferable access key used to represent off-chain RWA attestations on IOPN.
Designed to gate access to contracts and services based on issuer-approved real-world asset credentials.

---

## RWAConsumer.sol

**Network:** IOPN Testnet
**Address:** https://explorer.iopn.io/address/0xD48b101Fcb525625BD9E8a1811fB1Fc2cD1097cb

Type: RWA-Gated Consumer Contract
A minimal consumer contract demonstrating how on-chain services can be gated using RWA access keys.
Only addresses holding a valid RWAAccessKey can execute protected functions.
