    ];
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