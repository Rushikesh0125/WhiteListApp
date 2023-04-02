//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;


contract Whitelist {

    uint256 public maxWhitelistedAddresses;

    mapping(address => bool) public whitelistedAddresses;

    uint256 public numAddressesWhitelisted;

    constructor(uint256 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses =  _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses cant be added, limit reached");
        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;
    }

    function getNumOfWhitelisted() public view returns(uint256){
        return numAddressesWhitelisted;
    }

    function isWhitelisted(address add) public view returns(bool){
        return whitelistedAddresses[add];
    }

}