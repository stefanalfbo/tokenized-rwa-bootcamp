// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {EnglishAuction} from "../src/EnglishAuction.sol";

contract DeployScript is Script {
    function run() external returns (EnglishAuction) {
        vm.startBroadcast();

        EnglishAuction token = new EnglishAuction(
            0x8352E092ED1d59Bb16c04b615158f17a3CC605D2 // The address of the RealEstateToken.sol contract from the DeployRealEstateToken.s.sol script
        );

        vm.stopBroadcast();

        return token;
    }
}
