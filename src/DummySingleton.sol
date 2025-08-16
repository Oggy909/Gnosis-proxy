
// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract DummySingleton {
    uint256 public stored;

    function setValue(uint256 val) public {
        stored = val;
    }
}
