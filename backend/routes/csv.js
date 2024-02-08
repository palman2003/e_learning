const express = require("express");
const router = express.Router();
const json2csv = require("json2csv").Parser;
const User = require("../models/usermodel");

router.get("/fetch", async (req, res) => {
  try {
    const documents = await User.find({});

    if (documents.length > 0) {
      const fieldMapping = {
        username: "Username",
        email: "Email",
        college: "College",
        branch: "Branch",
        phno: "Phone Number",
        city: "City",
        nop: "No of Pictures uploaded",
        isQuiz1Finished: "Quiz 1 Status",
        isQuiz2Finished: "Quiz 2 Status",
        isQuiz3Finished: "Quiz 3 Status",
        cs1: "Case Study 1",
        cs2: "Case Study 2",
        cs3: "Case Study 3",
        cs4: "Case Study 4",
        cs5: "Case Study 5"
      };

      // Transform the data using the fieldMapping
      const transformedData = documents.map(document => {
        const transformedDocument = {};
        for (const key in document._doc) {
          if (fieldMapping[key]) {
            // Check if the key corresponds to quiz status
            if (key === "isQuiz1Finished" || key === "isQuiz2Finished" || key === "isQuiz3Finished") {
              transformedDocument[fieldMapping[key]] = document._doc[key] ? "Finished" : "Not Finished";
            } else {
              transformedDocument[fieldMapping[key]] = document._doc[key];
            }
          }
        }
        return transformedDocument;
      });

      // Define the fields for CSV
      const fields = Object.values(fieldMapping);

      const json2csvParser = new json2csv({ fields });
      const csv = json2csvParser.parse(transformedData);

      res.setHeader("Content-Type", "text/csv");
      res.setHeader("Content-Disposition", "attachment; filename=output.csv");
      res.status(200).send(csv);
    }
  } catch (error) {
    console.log(error);
    res.status(401).send("Internal server error");
  }
});

module.exports = router;
