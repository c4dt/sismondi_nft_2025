// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";


import {Base64} from "./libraries/Base64.sol";

contract SismondiNFT is ERC721URIStorage {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    uint256 public totalSupply;

    string images_prefix ="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCAAqAEADASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD";

    string[] images = [
"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"    ];
    string[] wordList = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight"];

    event NewSismondiNFTMinted(address sender, uint256 tokenId);


    constructor() ERC721 ("Sismondi Shoes Short", "SiSho4") {
        totalSupply = 10;
    }

    function pickRandomWord(uint256 tokenId) internal view returns (string memory) {
        uint256 rand = random(string(abi.encodePacked("WORD", Strings.toString(tokenId))));
        rand = rand % wordList.length;
        return wordList[rand];
    }

    function pickRandomImage(uint256 tokenId) internal view returns (string memory) {
        uint256 rand = random(string(abi.encodePacked("WORD", Strings.toString(tokenId))));
        rand = rand % images.length;
        return images[rand];
    }

    function random(string memory input) internal pure returns (uint256) {
        return uint256(keccak256(abi.encodePacked(input)));
    }

    function makeSismondiNFT() public {
        uint256 newItemId = _tokenIds.current();
        require(newItemId < totalSupply, "Total supply has been reached!");

        string memory randomWord = pickRandomWord(newItemId);
        string memory randomImage = pickRandomImage(newItemId);

        string memory TOKEN_JSON_URI = getTokenURI(randomWord, randomImage);

        _safeMint(_msgSender(), newItemId);
        _setTokenURI(newItemId, TOKEN_JSON_URI);
        _tokenIds.increment();
        emit NewSismondiNFTMinted(_msgSender(), newItemId);
    }

    function getTokenURI(string memory words, string memory pngString) internal view returns (string memory) {

        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "', words,
                        '", "description": "A Sismondi NFT collection.",'
                        '"image": "', images_prefix, pngString,
                        '"}'
                    )
                )
            )
        );

        string memory finalTokenUri = string(
            abi.encodePacked("data:application/json;base64,", json)
        );

        return finalTokenUri;
    }

    function getTotalNFTsMintedSoFar() public view returns (uint256) {
        return _tokenIds.current();
    }
}