// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";


import {Base64} from "./libraries/Base64.sol";

contract SismondiNFT is ERC721URIStorage {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    uint256 public totalSupply;

    string images_prefix = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAANCAYAAACpUE5eAAABhGlDQ1BJQ0MgUHJvZmlsZQAAeJx9kT1Iw0AcxV9ba0UqHewg4pChumgXFXGsVShChVArtOpgcukXNGlIUlwcBdeCgx+LVQcXZ10dXAVB8APE1cVJ0UVK/F9SaBHjwXE/3t173L0D/M0qU82eBKBqlpFJJYVcflUIvSKMICLoxbjETH1OFNPwHF/38PH1Ls6zvM/9OQaUgskAn0CcYLphEW8Qz2xaOud94igrSwrxOfGEQRckfuS67PIb55LDfp4ZNbKZeeIosVDqYrmLWdlQiaeJY4qqUb4/57LCeYuzWq2z9j35C8MFbWWZ6zRHkMIiliBCgIw6KqjCQpxWjRQTGdpPeviHHb9ILplcFTByLKAGFZLjB/+D392axalJNymcBIIvtv0xCoR2gVbDtr+Pbbt1AgSegSut4681gdlP0hsdLXYERLaBi+uOJu8BlzvA0JMuGZIjBWj6i0Xg/Yy+KQ8M3gL9a25v7X2cPgBZ6ip9AxwcAmMlyl73eHdfd2//nmn39wNld3KhWalQEAAAA";

    string[] images = [
    "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"
    ];
    string[] wordList = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight"];

    event NewSismondiNFTMinted(address sender, uint256 tokenId);


    constructor() ERC721 ("Sismondi Shoes Short", "SiSho4") {
        totalSupply = 1000000;
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