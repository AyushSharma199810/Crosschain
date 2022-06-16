const express = require("express");
const app = express();
const parser = require("body-parser");
const router = express.Router();
const rout = require('./Routes/Route');

// var mongoose = require('mongoose');
//Set up default mongoose connection
// var mongoDB = 'mongodb://localhost:27017/local';
// mongoose.connect(mongoDB, { useNewUrlParser: true });
 //Get the default connection
// var db = mongoose.connection;
//Bind connection to error event (to get notification of connection errors)
// db.on('error', console.error.bind(console, 'MongoDB connection error:'));
// db.on('error', console.error.bind(console, 'MongoDB connection error:'));

// app.use(parser.json());
app.use(parser.urlencoded({ extended: true}));
const port = 6500;
app.use('/',rout.router);
// app.use(router)

app.listen(port ,() => {
    console.log("Connection running on port http://localhost:" + port);
});
