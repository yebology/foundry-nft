//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import { BasicNFT } from "../src/BasicNFT.sol";
import { Script } from "forge-std/Script.sol";

contract DeployBasicNFT is Script {

    string public constant PUG = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function run() external returns (BasicNFT) {
        vm.startBroadcast();
        BasicNFT basicNFT = new BasicNFT();
        vm.stopBroadcast();
        return basicNFT;
    }

}