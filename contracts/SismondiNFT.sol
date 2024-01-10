// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";


import {Base64} from "./libraries/Base64.sol";

contract SismondiNFT is ERC721URIStorage {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    uint256 public totalSupply;

    string images_prefix ="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAUCAYAAACaq43EAAABhGlDQ1BJQ0MgUHJvZmlsZQAAeJx9kT1Iw0AcxV9ba0UqHewg4pChumgXFXGsVShChVArtOpgcukXNGlIUlwcBdeCgx+LVQcXZ10dXAVB8APE1cVJ0UVK/F9SaBHjwXE/3t173L0D/M0qU82eBKBqlpFJJYVcflUIvSKMICLoxbjETH1OFNPwHF/38PH1Ls6zvM/9OQaUgskAn0CcYLphEW8Qz2xaOud94igrSwrxOfGEQRckfuS67PIb55LDfp4ZNbKZeeIosVDqYrmLWdlQiaeJY4qqUb4/57LCeYuzWq2z9j35C8MFbWWZ6zRHkMIiliBCgIw6KqjCQpxWjRQTGdpPeviHHb9ILplcFTByLKAGFZLjB/+D392axalJNymcBIIvtv0xCoR2gVbDtr+Pbbt1AgSegSut4681gdlP0hsdLXYERLaBi+uOJu8BlzvA0JMuGZIjBWj6i0Xg/Yy+KQ8M3gL9a25v7X2cPgBZ6ip9AxwcAmMlyl73eHdfd2//nmn39wNld3KhWalQEAAAA";

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