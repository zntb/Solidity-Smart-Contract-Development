# Storage factory introduction

You can follow along with the video course from here.
Introduction
You can find the code for this section in the Remix Storage Factory Github repository. In these nine lessons we'll work with three new contracts:

- SimpleStorage.sol - the contract we build in the previous section, with some modifications
- AddFiveStorage.sol - a child contract of SimpleStorage that leverages inheritance
- StorageFactory.sol - a contract that will deploy a SimpleStorage contract and interact with it

Section overview

```solidity
contract SimpleStorage {
    SimpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorageContract() public {};
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {};
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {}
}
```

After deploying StorageFactory and executing its function createSimpleStorageContract, we can observe a new transaction appear in the Remix terminal. It's a deployment transaction of the SimpleStorage contract, executed by the StorageFactory contract.
It's possible to interact with this newly deployed SimpleStorage via the store function. We'll do this by using the sfStore function from the StorageFactory contract. This function accepts two parameters: the index of a deployed SimpleStorage contract, which will be '0' since we just deployed one contract, and the value of a favoriteNumber.
The sfGet function, when given the input '0', will indeed return the number provided by the previous function. The address of the SimpleStorage contract can then be retrieved by clicking on the get function listOfSimpleStorageContracts.

Conclusion
The StorageFactory contract manages numerous instances of an external contract SimpleStorage. It provides functionality to deploy new contract instances dynamically and allows for the storage and retrieval of values from each instance. These instances are maintained and organized within an array, enabling efficient tracking and interaction.

🧑‍💻 Test yourself

- 📕 What is the primary role of the StorageFactory contract?
- 📕 Why is it important to specify the index when calling the sfStore function?
