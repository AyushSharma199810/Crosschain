const Tokenrinkeby = artifacts.require('RinkebyNFTContract');
const Tokenpolygon = artifacts.require('PolygonNFTContract');
const BridgeRinkbey = artifacts.require('BridgeRinkeby');
const Bridgepolygon = artifacts.require('BridgePolygon');

module.exports = async function (deployer, network, addresses) {
  if(network === 'rinkeby') {
    await deployer.deploy(Tokenrinkeby);
    const tokenrinkeby = await Tokenrinkeby.deployed();
    await tokenrinkeby.mint(addresses[0],1, 1000);
    await deployer.deploy(BridgeRinkbey, tokenrinkeby.address);
    const BridgeRinkeby = await BridgeRinkbey.deployed();
    // await tokenrinkeby.updateAdmin(BridgeRinkeby.address);
  }
  if(network === 'ropsten') {
    await deployer.deploy(Tokenpolygon);
    const tokenpolygon = await Tokenpolygon.deployed();
    await deployer.deploy(Bridgepolygon, tokenpolygon.address);
    const bridgepolygon = await Bridgepolygon.deployed();
    // await tokenpolygon.updateAdmin(bridgepolygon.address);
  }
};