// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.9;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";


contract Admin is Ownable {

    mapping(address => bool) whitelist;
    mapping(address => bool) blacklist;
    event Whitelisted(address _addr);
    event Blacklisted(address _addr);


    function authorize(address _addr) public onlyOwner {
        require(blacklist[_addr] == false, "this address is blacklisted");
        require(whitelist[_addr] == false, "this address is already whitelisted");
        whitelist[_addr] = true;
        emit Whitelisted(_addr);
    }

    function refuse(address _addr) public onlyOwner {
        require(whitelist[_addr] == false, "this address is whitelisted");
        require(blacklist[_addr] == false, "this address is already blacklisted");
        blacklist[_addr] = true;
        emit Blacklisted(_addr);

    }

    function isWhitelisted(address _addr) public view returns(bool) {
        return (whitelist[_addr]);

    }

    function isBlacklisted(address _addr) public view returns(bool) {
        return (blacklist[_addr]);
        
    }


}
