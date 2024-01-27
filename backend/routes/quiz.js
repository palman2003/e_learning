const express = require("express");
const User = require("../models/usermodel");
const router = express.Router();

router.post("/result", async (req, res) => {
  try {
    const { score, email } = req.body;
    const user = await User.findOne({ email });
    if (!user) {
      return res.status(400).json({ message: "user not found" });
    }
    user.Score = score;
    await user.save();
    res.status(200).json({ message: "Success" });
  } catch (error) {
    console.error("Error:", error);
    res.status(500).send("Internal Server Error");
  }
});

router.post("/complete", async (req, res) => {
  try {
    const { email, module } = req.body;
    const user = await User.findOne({ email });
    if (!user) {
      return res.status(400).json({ message: "user not found" });
    }
    if (user.Module[module] == false) {
      user.Module[module] = true;
      await user.save();
      res.status(200).send({ increment: true });
    } else {
      res.status(200).send({ increment: false });
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "internal server error" });
  }
});

router.post("/retryCheck", async (req, res) => {
  try {
    const { email } = req.body;
    const user = await User.findOne({ email });
    if (!user) {
      return res.status(400).json({ message: "user not found" });
    }
    return res.status(200).json({ retry: user.retries });
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "internal server error" });
  }
});

router.post("/retry-decrement", async (req, res) => {
  try {
    const { email } = req.body;
    const user = await User.findOne({ email });
    if (!user) {
      return res.status(400).json({ message: "user not found" });
    }
    user.retries = user.retries - 1;
    user.save();
    return res.status(400).send();
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "internal server error" });
  }
});

module.exports = router;
