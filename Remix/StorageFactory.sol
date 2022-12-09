// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {

    uint256 favoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }
    People[] public people;

    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
    
    function retrieve() public view returns (uint256){
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
contract StorageFactory
{
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public{
         SimpleStorage simpleStorage= new SimpleStorage();
         simpleStorageArray.push(simpleStorage); 
    }
    function sfStore(
        uint256 _simpleStorageIndex,uint256 _simpleStorageNumber) public{
        SimpleStorage simpleStorage=simpleStorageArray[_simpleStorageIndex];
        simpleStorage.store(_simpleStorageNumber);
    }
     function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
         SimpleStorage simpleStorage=simpleStorageArray[_simpleStorageIndex];
         return simpleStorage.retrieve();
     }
}