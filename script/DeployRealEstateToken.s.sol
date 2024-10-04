// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {RealEstateToken} from "../src/RealEstateToken.sol";

contract DeployScript is Script {
    function run() external returns (RealEstateToken) {
        vm.startBroadcast();

        RealEstateToken token = new RealEstateToken(
            "",
            0xF694E193200268f9a4868e4Aa017A0118C9a8177,
            0x0b9d5D9136855f6FEc3c0993feE6E9CE8a297846,
            14767482510784806043,
            0xA9d587a00A31A52Ed70D6026794a8FC5E2F5dCb0
        );

        vm.stopBroadcast();

        return token;
    }
}
