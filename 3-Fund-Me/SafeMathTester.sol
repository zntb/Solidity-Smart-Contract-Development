// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SafeMathTester {
    uint8 public bigNumber = 255;

    function add() public {
        bigNumber = bigNumber + 1;
    }
}
