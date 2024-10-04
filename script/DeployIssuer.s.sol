// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {Issuer} from "../src/Issuer.sol";

contract DeployScript is Script {
    function run() external returns (Issuer) {
        vm.startBroadcast();

        Issuer issuer = new Issuer(
            0x8352E092ED1d59Bb16c04b615158f17a3CC605D2, // The address of the RealEstateToken.sol contract from the DeployRealEstateToken.s.sol script
            0xA9d587a00A31A52Ed70D6026794a8FC5E2F5dCb0
        );

        vm.stopBroadcast();

        return issuer;
    }
}
