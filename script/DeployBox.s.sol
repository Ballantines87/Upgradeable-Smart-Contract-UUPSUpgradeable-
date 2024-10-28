// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Script} from "forge-std/Script.sol";
import {BoxV1} from "../src/BoxV1.sol";
import {ERC1967Proxy} from "../lib/openzeppelin-contracts/contracts/proxy/ERC1967/ERC1967Proxy.sol";

contract DeployBox is Script {
    function run() external returns (address) {
        address proxy = deployBox();
        return proxy;
    }

    function deployBox() private returns (address) {
        BoxV1 boxV1 = new BoxV1(); // this is going to be our implementation / our logic
        ERC1967Proxy proxy = new ERC1967Proxy(address(boxV1), "");
        return address(proxy);
    }
}
