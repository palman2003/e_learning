const express = require('express');
const router = express.Router();
const fs = require('fs');
const PDFDocument = require('pdfkit');

// Example usage
const templatePath = 'Blue and Yellow Minimalist Employee of the Month Certificate (2).png'; // Replace with your template image path

// Define the route to generate and serve the certificate
router.get('/:userName/:college', (req, res) => {
    try {
        const userName = req.params.userName;

        const college = req.params.college;

        // Generate the certificate in-memory
        const pdfDoc = new PDFDocument({layout:"landscape",size:"A4"});

        // Your certificate generation logic
        const templateWidth = 595.28;
        const templateHeight = 841.89;
        const yPos = (pdfDoc.page.height - templateHeight) / 2;
        pdfDoc.image(templatePath, 0, 0, {scale: 0.45});
        pdfDoc.font('Helvetica-Bold').fontSize(25).fillColor('black').text(userName, 110, 310.50, { align: 'center' });
        pdfDoc.font('Helvetica-Bold').fontSize(25).fillColor('black').text(college, 120, 360, { align: 'center' });

        // Send the generated certificate as a response
        res.setHeader('Content-Type', 'application/pdf');
        res.setHeader('Content-Disposition', `attachment; filename=${userName}_${college}_certificate.pdf`);
        pdfDoc.pipe(res);
        pdfDoc.end();
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
});

module.exports = router;
