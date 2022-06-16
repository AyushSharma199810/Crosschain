const BridgeRink = artifacts.require('PolygonNFTContract');

module.exports = async done => {
//   const [recipient, _] = await web3.eth.getAccounts();
const add = "0x0a1b05De4569F7728244728259E43BDF277461b7"
  const Rinkbridge = await BridgeRink.deployed();
  await Rinkbridge.burn(add , 1, 2);
  done();
}
