const express = require("express");
const router = express.Router();
const fs = require("fs");
const PDFDocument = require("pdfkit");
const nodemailer = require("nodemailer");

const transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: process.env.EMAIL,
    pass: process.env.PASSWD,
  },
});

// Example usage
const templatePath =
  "Blue and Yellow Minimalist Employee of the Month Certificate (2).png"; // Replace with your template image path

// Define the route to generate and serve the certificate
router.get("/:userName/:college/:email", async (req, res) => {
  try {
    const userName = req.params.userName;
    const college = req.params.college;
    const email = req.params.email;

    console.log(userName, email, college);

    // Generate the certificate in-memory
    const pdfDoc = new PDFDocument({ layout: "landscape", size: "A4" });

    // Your certificate generation logic
    const templateWidth = 595.28;
    const templateHeight = 841.89;
    const yPos = (pdfDoc.page.height - templateHeight) / 2;
    pdfDoc.image(templatePath, 0, 0, { scale: 0.424 });
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

    // Send the generated certificate as a response
    //res.setHeader('Content-Type', 'application/pdf');
    //res.setHeader('Content-Disposition', `attachment; filename=${userName}_${college}_certificate.pdf`);

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
