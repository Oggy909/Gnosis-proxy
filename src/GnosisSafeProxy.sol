
// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract GnosisSafeProxy {
    address public singleton;

    constructor(address _singleton) {
        singleton = _singleton;
    }

    fallback() external payable {
        assembly {
            let _singleton := sload(0)
            calldatacopy(0, 0, calldatasize())
            let success := delegatecall(gas(), _singleton, 0, calldatasize(), 0, 0)
            returndatacopy(0, 0, returndatasize())
            switch success
            case 0 { revert(0, returndatasize()) }
            default { return(0, returndatasize()) }
        }
    }
}
