# Gnosis-proxy
demonstrating Ether Locking &amp; Unsafe Delegatecall vulnerabilities in GnosisSafeProxy smart contract.

This repository contains a Proof of Concept (PoC) demonstrating two vulnerabilities in the **GnosisSafeProxy** smart contract:  

- **Ether Locking (Permanent Freezing of Funds)**  
- **Unsafe Delegatecall (Proxy Hijack Risk)**  

## 📌 Vulnerability Summary  
1. **Ether Locking**  
   Any ETH sent to the contract is permanently locked and cannot be withdrawn.  

2. **Unsafe Delegatecall**  
   The proxy forwards all calls to the singleton using `delegatecall`.  
   If the singleton is malicious or misconfigured, it can hijack storage/state.  

## 🔬 Proof of Concept  
Forge tests demonstrate both vulnerabilities.  

```bash
forge test -vvv
