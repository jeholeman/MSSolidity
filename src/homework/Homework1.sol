// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// Create a struct called Vegetable and give it the properties of name, color, and countryOfOrigin.
//Create a mapping to store these Vegetables by using a continuous counter.
//Then, create a public function that will allow anyone to add a Vegetable to the mapping.

// Bonus: create a modifier that uses an enum to track whether the function is accepting updates or not

contract Homework1 {
    // Define your struct here
    struct Vegetable {
        string name;
        string color;
        string countryOfOrigin;
    }


    // Define your mapping here
    mapping(uint256 => Vegetable) public vegetables;

    // Define your enum here (please make sure the states are called "Accepting" and "NotAccepting"))
    enum State { Accepting, NotAccepting }
    // set the enum to the default "Accepting" value
    State public currentState = State.Accepting;
    // define a vegetable counter here (perhaps a uint of sorts?)
    uint256 public counter;

    // Define your modifier here: the modifier will check if the state is Accepting
    modifier onlyAccepting() {
        require(currentState == State.Accepting, "Updates are currently not accepted");
    }

    // Define your function here: the function will add a Vegetable to the mapping
    function addVegetable(string memory _name, string memory _color, string memory _countryOfOrigin) public onlyAccepting {
        Vegetable storage newVegetable = vegetables[counter];
        newVegetable.name = _name;
        newVegetable.color = _color;
        newVegetable.countryOfOrigin = _countryOfOrigin;
        counter++;
    }
    // This function is used as a hint and to retrieve the Vegetable from the mapping
     function getVegetable(uint8 index) public view returns (Vegetable memory) {
         return vegetables[index];
     }
}