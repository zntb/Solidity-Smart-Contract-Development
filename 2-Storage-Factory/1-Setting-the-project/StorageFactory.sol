// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// import "./SimpleStorage.sol"; or:
import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public listOfSimplestorageContracts;

    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimplestorageContracts.push(newSimpleStorageContract);
    }

    function sfStore(
        uint256 _simpleStorageIndex,
        uint256 _newSimpleStorageNumber
    ) public {
        // Address
        // ABI - Application Binary Interface
        listOfSimplestorageContracts[_simpleStorageIndex].store(
            _newSimpleStorageNumber
        );
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        return listOfSimplestorageContracts[_simpleStorageIndex].retrieve();
    }
}
