// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.9;

import "./ERC20Token.sol" ;


contract Crowdsale {

    uint public rate = 200;
    ERC20Token public token;

    constructor(uint256 _initialSupply) {
        token = new ERC20Token(_initialSupply);
}

    receive() external payable {
        require(msg.value >= 0.1 ether, "you can't send lesst than 0.1 ether");
        distribute(msg.value);
    }

    function distribute(uint _amount) internal {
        uint256 tokentoSend = _amount*rate;
        token.transfer(msg.sender,tokentoSend);
    }


}
