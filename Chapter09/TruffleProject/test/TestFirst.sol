// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/first.sol";

contract TestFirst {
  function testInitialBalanceUsingDeployedContract() public {
    First meta = First(DeployedAddresses.First());

    Assert.equal(meta.GetDouble(10), 20, "done");
  }

}