// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;
// Import ERC1155 token contract from Openzeppelin
//   /$$$$$$  /$$     /$$ /$$   /$$  /$$$$$$  /$$   /$$
//  /$$__  $$|  $$   /$$/| $$  | $$ /$$__  $$| $$  | $$
// | $$  \ $$ \  $$ /$$/ | $$  | $$| $$  \__/| $$  | $$
// | $$$$$$$$  \  $$$$/  | $$  | $$|  $$$$$$ | $$$$$$$$
// | $$__  $$   \  $$/   | $$  | $$ \____  $$| $$__  $$
// | $$  | $$    | $$    | $$  | $$ /$$  \ $$| $$  | $$
// | $$  | $$    | $$    |  $$$$$$/|  $$$$$$/| $$  | $$
// |__/  |__/    |__/     \______/  \______/ |__/  |__/
                                                
//  /$$$$$$$$ /$$$$$$$   /$$$$$$          /$$     /$$   /$$$$$$$  /$$$$$$$ 
// | $$_____/| $$__  $$ /$$__  $$       /$$$$   /$$$$  | $$____/ | $$____/ 
// | $$      | $$  \ $$| $$  \__/      |_  $$  |_  $$  | $$      | $$      
// | $$$$$   | $$$$$$$/| $$              | $$    | $$  | $$$$$$$ | $$$$$$$ 
// | $$__/   | $$__  $$| $$              | $$    | $$  |_____  $$|_____  $$
// | $$      | $$  \ $$| $$    $$        | $$    | $$   /$$  \ $$ /$$  \ $$
// | $$$$$$$$| $$  | $$|  $$$$$$/       /$$$$$$ /$$$$$$|  $$$$$$/|  $$$$$$/
// |________/|__/  |__/ \______/       |______/|______/ \______/  \______/ 

import "./Base-Erc1155.sol";                                                                 
contract RinkebyNFTContract is NFTContract {
    
 
    constructor() NFTContract("https://gateway.pinata.cloud/ipfs/QmWZ37ug7zMxaafp7z3B8YHhH37meHxomL8WQmNbEtPWmK"){
        
      
   
   }
    function mint(address account,uint256 id,uint256 amount) public virtual override {
        _mint(account , id , amount,"");
   }
    function burn(address account,uint256 id,uint256 amount) public virtual override {
        require(msg.sender == account);
        _burn(account,id,amount);
    }
}
