// This comes from https://ethereum.org/en/developers/tutorials/hello-world-smart-contract/
pragma solidity ^0.8.0;

// Defines a contract named `HelloWorld` which can store a message.
contract HelloWorld {

    // Declares a state variable `message` of type `string`.
    string public message;

    // Require a message when creating the contract.
    constructor(string memory initMessage) {
        message = initMessage;
    }

    // Getter for the message.
    function getMessage() public view returns (string memory) {
        return message;
    }
}
