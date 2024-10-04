// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {RwaLending} from "../src/RWALending.sol";

contract DeployScript is Script {
    function run() external returns (RwaLending) {
        vm.startBroadcast();

        RwaLending token = new RwaLending(
            0x8352E092ED1d59Bb16c04b615158f17a3CC605D2, // The address of the RealEstateToken.sol contract from the DeployRealEstateToken.s.sol script
            0x5425890298aed601595a70AB815c96711a31Bc65,
            0x97FE42a7E96640D932bbc0e1580c73E705A8EB73,
            86400
        );

        vm.stopBroadcast();

        return token;
    }
}
