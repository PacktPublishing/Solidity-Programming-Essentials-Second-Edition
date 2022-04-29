var firstContract = artifacts.require("First"); 
var secondContract = artifacts.require("Second");

module.exports = function(deployer) {
  deployer.deploy(firstContract).then(
      function() { 
          return deployer.deploy(secondContract,firstContract.address);
        }
      )};