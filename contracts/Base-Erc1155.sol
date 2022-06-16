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
                                                                        
                                                                        
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract NFTContract is ERC1155, Ownable {
    
    uint256 public constant ARTWORK = 0;
    uint256 public constant PHOTO = 1;
    
    constructor(string memory uri) ERC1155(uri){
        
        _mint(msg.sender, ARTWORK, 1 , "");
        _mint(msg.sender, PHOTO, 2 , "");
   
   }
    function mint(address account,uint256 id,uint256 amount)virtual external onlyOwner{
        _mint(account , id , amount,"");
   }
    function burn(address account,uint256 id,uint256 amount)virtual external {
        require(msg.sender == account);
        _burn(account,id,amount);
    }
}
