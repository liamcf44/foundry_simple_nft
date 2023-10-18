// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/SimpleERC721.sol";

contract SimpleERC721Test is Test {
    address public owner;
    address public buyer1;

    SimpleERC721 private nft;

    function setUp() public {
        owner = vm.addr(1);
        buyer1 = vm.addr(2);

        nft = new SimpleERC721("Best_NFT", "BEST", "ar://", owner);
    }

    //    function test_Increment() public {
    //        counter.increment();
    //        assertEq(counter.number(), 1);
    //    }
    //
    //    function testFuzz_SetNumber(uint256 x) public {
    //        counter.setNumber(x);
    //        assertEq(counter.number(), x);
    //    }

    function test_UpdateTotalSupplyOwner() public {
        vm.prank(owner);
        nft.updateTotalSupply(5_000);
        assertEq(nft.TOTAL_SUPPLY(), 5_000);
    }

    function testFail_UpdateTotalSupplyNotOwner() public {
        vm.prank(buyer1);
        nft.updateTotalSupply(5_000);
    }

    function test_UpdatePriceOwner() public {
        vm.prank(owner);
        nft.updatePrice(0.02 ether);
        assertEq(nft.MINT_PRICE(), 0.02 ether);
    }

    function testFail_UpdatePriceNotOwner() public {
        vm.prank(buyer1);
        nft.updatePrice(0.02 ether);

    }
}
