const express = require("express");
const router = express.Router();
const fs = require("fs");
const PDFDocument = require("pdfkit");
const nodemailer = require("nodemailer");
const axios = require("axios");
const User = require("../models/usermodel");

const transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: process.env.EMAIL,
    pass: process.env.PASSWD,
  },
});

router.post("/caseStudy-data/:email/:module", async (req, res) => {
  try {
    const data = req.body.data;
    const email = req.params.email;
    const module = req.params.module;
    const user = await User.findOne({ email });

    if (!user) {
      return res.status(400).json({ message: "user not found" });
    }

    console.log(module == 1 );

    if (module == 1) {
      user.caseStudy1 = data;
      await user.save();
    }
    if (module == 2) {
      user.caseStudy2 = data;
      await user.save();
    }
    if (module == 3) {
      user.caseStudy3 = data;
      await user.save();
    }
    if (module == 4) {
      user.caseStudy4 = data;
      await user.save();
    }
    if (module == 5) {
      user.caseStudy4 = data;
      await user.save();
    }
    res.status(200).json({message: "Successful"});
  } catch (e) {
    res.status(500).send("Internal Server Error");
  }
});

// Example usage
const templateUrl =
  "https://raw.githubusercontent.com/NaveenAkash-K/e_learning/780ddb2304129744fd6ee9b141c4b8911dfae96d/backend/Blue%20and%20Yellow%20Minimalist%20Employee%20of%20the%20Month%20Certificate%20(2).png"; // Replace with your template image URL

// Define the route to generate and serve the certificate
router.get("/:userName/:college/:email", async (req, res) => {
  try {
    const userName = req.params.userName;
    const college = req.params.college;
    const email = req.params.email;

    console.log(userName, email, college);

    // Fetch the image from the URL
    const response = await axios.get(templateUrl, {
      responseType: "arraybuffer",
    });
    const templateBuffer = Buffer.from(response.data);

    // Generate the certificate in-memory
    const pdfDoc = new PDFDocument({ layout: "landscape", size: "A4" });

    // Your certificate generation logic
    const templateWidth = 595.28;
    const templateHeight = 841.89;
    const yPos = (pdfDoc.page.height - templateHeight) / 2;
    pdfDoc.image(templateBuffer, 0, 0, { scale: 0.424 });
    pdfDoc
      .font("Helvetica-Bold")
      .fontSize(25)
      .fillColor("black")
      .text(userName, 100, 295.5, { align: "center" });
    pdfDoc
      .font("Helvetica-Bold")
      .fontSize(25)
      .fillColor("black")
      .text(college, 110, 340, { align: "center" });

    // Convert the PDF document to a buffer
    const pdfBuffer = await new Promise((resolve, reject) => {
      const chunks = [];
      pdfDoc.on("data", (chunk) => chunks.push(chunk));
      pdfDoc.on("end", () => resolve(Buffer.concat(chunks)));
      pdfDoc.end();
    });

    // Create mail options with the PDF buffer
    const mailOptions = {
      from: process.env.EMAIL,
      to: email,
      subject: "Certificate for " + userName + " from " + college,
      text: "Please find attached the certificate.",
      attachments: [
        {
          filename: `${userName}_${college}_certificate.pdf`,
          content: pdfBuffer,
          encoding: "base64",
        },
      ],
    };

    // Send the email
    await transporter.sendMail(mailOptions);

    // Send the PDF buffer as the response
    res.status(200).json({ message: "Certificate sent to your email" });
  } catch (error) {
    console.error(error);
    res.status(500).send("Internal Server Error");
  }
});

module.exports = router;
