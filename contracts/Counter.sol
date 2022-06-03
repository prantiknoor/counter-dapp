//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Counter {
    uint256 public count = 0;

    function incrementCounter() public {
        count++;
    }
}