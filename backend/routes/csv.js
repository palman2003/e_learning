const express = require("express");
const router = express.Router();
const json2csv = require("json2csv").Parser;
const User = require("../models/usermodel");

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

module.exports = router;
