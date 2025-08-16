
// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

import "forge-std/Test.sol";
import "../src/GnosisSafeProxy.sol";
import "../src/DummySingleton.sol";

contract ProxyChecks is Test {
    GnosisSafeProxy proxy;
    DummySingleton singleton;

    function setUp() public {
        singleton = new DummySingleton();
        proxy = new GnosisSafeProxy(address(singleton));
    }

    function testEtherLocking() public {
        vm.deal(address(0x1234), 1 ether);
        vm.prank(address(0x1234));

        (bool success,) = address(proxy).call{value: 1 ether}("");
        assertTrue(success, "ETH transfer failed");
    }

    function testDelegateCallToSingleton() public {
        (bool success,) = address(proxy).call(abi.encodeWithSignature("setValue(uint256)", 42));
        require(success, "Delegatecall failed");

        uint val = singleton.stored();
        assertEq(val, 42, "Delegatecall fail ho gaya");
    }
}
