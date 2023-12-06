// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";


import {Base64} from "./libraries/Base64.sol";

contract SismondiNFT is ERC721URIStorage {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    uint256 public totalSupply;

    string[] images = [
    "iVBORw0KGgoAAAANSUhEUgAAABQAAAANCAYAAACpUE5eAAABhGlDQ1BJQ0MgUHJvZmlsZQAAeJx9kT1Iw0AcxV9ba0UqHewg4pChumgXFXGsVShChVArtOpgcukXNGlIUlwcBdeCgx+LVQcXZ10dXAVB8APE1cVJ0UVK/F9SaBHjwXE/3t173L0D/M0qU82eBKBqlpFJJYVcflUIvSKMICLoxbjETH1OFNPwHF/38PH1Ls6zvM/9OQaUgskAn0CcYLphEW8Qz2xaOud94igrSwrxOfGEQRckfuS67PIb55LDfp4ZNbKZeeIosVDqYrmLWdlQiaeJY4qqUb4/57LCeYuzWq2z9j35C8MFbWWZ6zRHkMIiliBCgIw6KqjCQpxWjRQTGdpPeviHHb9ILplcFTByLKAGFZLjB/+D392axalJNymcBIIvtv0xCoR2gVbDtr+Pbbt1AgSegSut4681gdlP0hsdLXYERLaBi+uOJu8BlzvA0JMuGZIjBWj6i0Xg/Yy+KQ8M3gL9a25v7X2cPgBZ6ip9AxwcAmMlyl73eHdfd2//nmn39wNld3KhWalQEAAAAgtJREFUeJytk8FLVFEUh79773uvGWec5pmmplhpVtJCV+miEIJaR9uWbaRVFLSsRRBt+gtaRbSSINy1K4iCFlaLEDQqRkxHyXHUaea9d989LWYQIxcK/eBw4MD54PzOOSociIT/KO+gDVY0idP/1H3t8JQ7GNCKZrTwi8tHF9myPlmTYp1GlPB6rY8vWx0HA6aiuDv8kSvdJUq1AoloAp1yKr/B09JZpj5N7h9oRdMRNJgIy9yfG2dm+Tg9md/Mbxd5e/ElS/U8AvxlRuwM9dTbiUZqiJzZ8ex6/wI5zzK70cmTsTdMhKs4FAUvZqFWQNFaigAiigtHlhnJVxjMbRL6EZ52FP2YjE4p+jHD+QqPv45x7dg3xjvKoIRAp61FGUCawNh63Oqf48HIB1YabawkWdaTACuaSi1H1li62mOmS6d5t9bL1d4fKKvBesyvd5LrVxjXnNLDaQ6FW1Rvz3BDw6v356kvdpPU84gSYmcY9avc61qh7/ASD4e+ExthqnyGF6uDeCerPJ9cpL5+Dv1To8LeVBgpEU0/Qoo1Ah2hAIXZ8dY5gyQGHflkcKSeo2Yg0Cn4CTGWzJ2byLNLqHAgEgTo2oRwG3oqcKIMuQaIahKzEdIWQXsd8S0qClCbbU33qzn4PAizQ9AIWkCAVINT4Fp5L+0u735YLRBYULLrDo2jOWW639PcU38A4A3X9hp5mjkAAAAASUVORK5CYII="
    ];
    string[] wordList = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight"];

    event NewSismondiNFTMinted(address sender, uint256 tokenId);


    constructor() ERC721 ("Codeforests Sismondi", "CFL") {
        totalSupply = 1000000;
    }

    function pickRandomWord(uint256 tokenId) internal view returns (string memory) {
        uint256 rand = random(string(abi.encodePacked("WORD", Strings.toString(tokenId))));
        rand = rand % wordList.length;
        return wordList[rand];
    }

    function random(string memory input) internal pure returns (uint256) {
        return uint256(keccak256(abi.encodePacked(input)));
    }

    function makeSismondiNFT() public {
        uint256 newItemId = _tokenIds.current();
        require(newItemId < totalSupply, "Total supply has been reached!");

        string memory randomWord = pickRandomWord(newItemId);

        string memory TOKEN_JSON_URI = getTokenURI(randomWord, images[0]);

        _safeMint(_msgSender(), newItemId);
        _setTokenURI(newItemId, TOKEN_JSON_URI);
        _tokenIds.increment();
        emit NewSismondiNFTMinted(_msgSender(), newItemId);
    }

    function getTokenURI(string memory words, string memory pngString) internal pure returns (string memory) {

        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{"name": "',
                        words,
                        '", "description": "A Sismondi NFT collection.",'
                        '"image": "data:image/png;base64,',
                        pngString,
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