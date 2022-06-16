const TokenPoly = artifacts.require('PolygonNFTContract');

module.exports = async done => {
//   const [recipient, _] = await web3.eth.getAccounts();
const add = "0x0a1b05De4569F7728244728259E43BDF277461b7";
  const tokenPoly= await TokenPoly.deployed();
  const balance = await tokenPoly.balanceOf(add, 1);
  console.log(balance.toString());
  done();
}
