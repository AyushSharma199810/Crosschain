const Web3 = require('web3');
const RinkBridge = require("../build/contracts/BridgeRinkeby.json");
const PolyBridge = require("../build/contracts/BridgePolygon.json");

    
const web3Rink = new Web3("https://rinkeby.infura.io/v3/7225d4d9beaa4b5896b367a3c755b15c`");

const web3poly = new Web3("https://ropsten.infura.io/v3/2498cb8498d647ea9b804d5587077a49");

const adminPrivkey= "fc92fef1130ce4e041b39bfaea9053e66cfa4f34462ebfd49ed9a6863032b8ac";
const{address:admin}=web3Rink.eth.accounts.wallet.add(adminPrivkey);
const bridgeRinkbey=new web3Rink.eth.Contract(RinkBridge.abi,RinkBridge.networks['4'].address);
const bridgePolygon=new web3poly.eth.Contract(PolyBridge.abi,PolyBridge.networks['3'].address);

bridgeRinkbey.events.Transfer({
    fromBlock:0,step: 0}).on('data',async event => {
        const{ from, to ,id,amount,date,nonce} = event.returnValues;
    
const tx = bridgePolygon.methods.mint(to,id,amount,data,nonce);
const {gasPrice, gasCost} = await Promise.all([
    web3poly.eth.getGasPrice(),
    tx.estimateGas({from: admin}),

]);
const data = tx.encodeABI();
const Txdata = {
    from: admin,
    to: PolyBridge.options.address,
    data,
    gas: gasCost,
    gasPrice
};
const reciept = await web3poly.eth.sendTransaction(Txdata);
console.log(`Transaction hash: ${reciept.transactionHash}`);
console.log(`
processed transfer:
-from ${from}
-to ${to}
-amount ${amount} tokens
-date ${date}`);
});
