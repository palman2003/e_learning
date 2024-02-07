const express = require("express");
const router = express.Router();
const csvParser = require('csv-parser');
const multer = require('multer');
const User = require("../models/usermodel");

const upload = multer({ storage: multer.memoryStorage() });

router.post("/upload", upload.single('csvFile'), async(req,res)=>{
    const file = req.file;

    if (!file) {
        return res.status(400).send('No file uploaded.');
    }
});