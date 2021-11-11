// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `npx hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
const hre = require("hardhat");

async function main() {
  // Hardhat always runs the compile task when running scripts with its command
  // line interface.
  //
  // If this script is run directly using `node` you may want to call compile
  // manually to make sure everything is compiled
  // await hre.run('compile');

  const coinFlipAddress = '0xC9E59231861d63F99E27c0D3B3e9239576e12c7e';

  // We get the contract to deploy
  const CoinFlipCheater = await hre.ethers.getContractFactory("CoinFlipCheater");
  const coinFlipCheater = await CoinFlipCheater.deploy(coinFlipAddress);
  await coinFlipCheater.deployed()

  for (let step = 0; step < 10; step++) {
    // Runs 10 times, with values of step 0 through 9.
    console.log('Flipping: ' + step);
    await coinFlipCheater.flip();
  }
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
