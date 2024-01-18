// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import { Test, console } from "forge-std/Test.sol";
import { DeployBasicNFT } from "../script/DeployBasicNFT.s.sol";
import { BasicNFT } from "../src/BasicNFT.sol";

contract BasicNFTTest is Test {

    DeployBasicNFT deployBasicNFT;
    BasicNFT basicNFT;
    address public USER = makeAddr("user");
    string public constant PUG = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function setUp() public {
        deployBasicNFT = new DeployBasicNFT();
        basicNFT = deployBasicNFT.run();
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "Dogie";
        string memory actualName = basicNFT.name();
        assert(keccak256(abi.encodePacked(expectedName)) == keccak256(abi.encodePacked(actualName)));
    }

    function testCanMintAndHaveBalance() public {
        vm.prank(USER);
        basicNFT.mintNFT(PUG);
        assert(basicNFT.balanceOf(USER) == 1);
        assert(keccak256(abi.encodePacked(PUG)) == keccak256(abi.encodePacked(basicNFT.tokenURI(0))));
    }

}