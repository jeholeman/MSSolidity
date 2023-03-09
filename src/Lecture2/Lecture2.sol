// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// solidity examples
contract Lecture2 {
    // Syntax
    // msg.sender
    address owner = msg.sender;
    // uint
    uint8 constant data = 7;
    // bytes
    bytes32 constant hash = keccak256("Hello World");
    // remember, every 0x value is 4 bits. 2 of them make 1 byte
    bytes8 constant fetchData = 0x1234567890abcdef;
    // bool
    bool hasWon = true;
    // string
    string constant name = "Marcellus";

    // modifier
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    function withdraw() public onlyOwner {
        // get money
    }

    // mapping
    mapping(address => uint256) public balances;

    // array
    uint256[] slots = [100, 200, 300, 400, 500, 600, 700];

    // struct
    struct User {
        uint256 id;
        string name;
        uint256 age;
    }
    User user = User(1, "Vince", 50);

    // enum
    enum State {Waiting, Ready, Active}
    State state = State.Waiting;

    // event
    event Deposit(address indexed _from, uint256 _value);

    function deposit() public payable {
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    // errors
    error InsufficientBalance(uint256 requested, uint256 available);

    function withdraw(uint256 amount) public {
        if (amount > balances[msg.sender]) {
            revert InsufficientBalance({
                requested: amount,
                available: balances[msg.sender]
            });
        }
        // get money
    }
}
