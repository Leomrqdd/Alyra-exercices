// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.9;
contract Whitelist { 

    mapping(address => bool) whitelist;

    event Authorized (address _address);
    event EtherReceived(address _address, uint _amount);

    constructor() {
        whitelist[msg.sender] = true;
    }

    modifier check() {
        require (whitelist[msg.sender] == true, "you are not authorized");
        _;
    }


    function authorize( address _address) public check {
        whitelist[_address] = true ;
        emit Authorized(_address);
    }

 


}


