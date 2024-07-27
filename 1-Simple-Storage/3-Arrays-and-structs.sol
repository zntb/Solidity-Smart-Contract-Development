// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract SimpleStorage {
    uint256 public myFavoriteNumber; // 0

    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    // Person public pat = Person({
    //     favoriteNumber: 7,
    //     name: "Pat"});

    Person[] public listOfPeople; // this is a dynamic array
    // Person[3] public anotherList; // this is a static array max of 3
    

    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
        retrieve();
    }

    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
    }
}