// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// import "./SimpleStorage.sol"; or:
import {SimpleStorage, SimpleStorage2, SimpleStorage3, SimpleStorage4} from "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage public simpleStorage;

    function createSimpleStorageContract() public {
        simpleStorage = new SimpleStorage();
    }
}
