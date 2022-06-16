const Tokenrinkeby = artifacts.require('RinkebyNFTContract');

module.exports = async done => {
//   const [recipient, _] = await web3.eth.getAccounts();
const add = "0x0a1b05De4569F7728244728259E43BDF277461b7";
  const tokenRinkeby = await Tokenrinkeby.deployed();
  const balance = await tokenRinkeby.balanceOf(add, 1);
  console.log(balance.toString());
  done();
}
