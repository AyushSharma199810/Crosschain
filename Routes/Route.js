const control = require("../Controller/Controller");
const express = require("express");
const router  = express.Router();  

router.get("/",control.mint);


module.export = {router};
