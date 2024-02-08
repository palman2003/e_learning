const express = require("express");
const router = express.Router();
const multer = require('multer');
const csvParser = require('csv-parser');
const json2csv = require("json2csv").Parser;
const User = require("../models/usermodel");
const upload = multer();

router.get("/fetch", async (req, res) => {
  try {
    const documents = await User.find({});

    if (documents.length > 0) {
      const fields = ["username","email","college","branch","phno","city","isQuiz1Finished","isQuiz2Finished","isQuiz3Finished","cs1","cs2","cs3","cs4","cs5"];
      const json2csvParser = new json2csv({ fields });
      const csv = json2csvParser.parse(documents);
      res.setHeader("Content-Type", "text/csv");
      res.setHeader("Content-Disposition", "attachment; filename=output.csv");
      res.status(200).send(csv);
    }
  } catch (error) {
    console.log(error);
    res.status(401).send("Internal server error");
  }
});

router.post('/upload', upload.single('csvFile'),(req, res) => {
  try{
    const csvData = req.file.buffer.toString();
    
    if (!csvData) {
      return res.status(400).send('CSV data is required.');
  }
  
  const parsedData = csvParser(csvData, { headers: true });
    parsedData
        .on('data', async (data) => {
          try {
            // Find the user in MongoDB based on the email
            const user = await User.findOne({ email });

            if (user) {
                // Update the NOP for the user
                user.nop = nop;
                await user.save(); // Save the updated user
                console.log(`Updated NOP for user ${email} to ${nop}`);
            } else {
                console.log(`User with email ${email} not found.`);
            }
        } catch (error) {
            console.error(`Error updating NOP for user ${email}: ${error}`);
        }
            
        })
  }
  catch(error){
    console.log(error);
    res.status(500).json({ message: "Internal server error" });
  }
  
});

module.exports = router;
