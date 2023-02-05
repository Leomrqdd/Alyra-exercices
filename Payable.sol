// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.9;

contract Payable {

    address owner = msg.sender;

    function send(address _address, uint _quantity) public {
        (bool success, )= _address.call{value: _quantity}('');
        require (success, "fail");

    }

    
    
    receive() external payable {}
}
