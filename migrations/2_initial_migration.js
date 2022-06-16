const Tokenrinkeby = artifacts.require('RinkebyNFTContract');
const Tokenpolygon = artifacts.require('PolygonNFTContract');
const BridgeEth = artifacts.require('BridgeRinkeby');
const Bridgepolygon = artifacts.require('BridgePolygon');

module.exports = async function (deployer, network, addresses) {
  if(network === 'rinkeby') {
    await deployer.deploy(Tokenrinkeby);
    const tokenrinkeby = await Tokenrinkeby.deployed();
    await tokenrinkeby.mint(addresses[0],1, 1000);
    await deployer.deploy(BridgeEth, tokenrinkeby.address);
    const bridgeEth = await BridgeEth.deployed();
    await tokenrinkeby.updateAdmin(bridgeEth.address);
  }
  if(network === 'matic') {
    await deployer.deploy(Tokenpolygon);
    const tokenpolygon = await Tokenpolygon.deployed();
    await deployer.deploy(Bridgepolygon, tokenBsc.address);
    const bridgepolygon = await Bridgepolygon.deployed();
    await tokenpolygon.updateAdmin(bridgepolygon.address);
  }
};