const express = require("express");
const router = express.Router();
const multer = require('multer');
const csv = require('csv-parser');
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
    console.log(csvData)
    if (!csvData) {
      return res.status(400).send('CSV data is required.');
  }
  
  const parser = csv({ headers: true });
  //console.log(parsedData)
    parser
        .on('data',async (data) => {
          console.log('Parsed data:', data);
          try {
            const email = data._0;
            const nop = parseInt(data._1);
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
            
        });
        parser.on('end', () => {
          console.log('CSV data processed successfully.');
          res.send('CSV data processed successfully.');})

        const Readable = require('stream').Readable;
        const stream = new Readable();
        stream.push(csvData);
        stream.push(null);
        stream.pipe(parser);
  }
  catch(error){
    console.log(error);
    res.status(500).json({ message: "Internal server error" });
  }
  
});

module.exports = router;
