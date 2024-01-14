const express=require('express');
const bcrypt = require('bcrypt');
const router=express.Router();
const jwt=require('jsonwebtoken');
const User=require("../models/usermodel");

router.post('/login', async (req, res) => {
  try {
    const { email, password } = req.body;

    // Find the user by username
    const user = await User.findOne({ email });
    if (!user) {
      return res.status(401).json({ message: 'Invalid credentials' });
    }

    // Compare the provided password with the hashed password
    const isValidPassword = await bcrypt.compare(password, user.password);
    if (!isValidPassword) {
      return res.status(401).json({ message: 'Invalid credentials' });
    }

    // Generate a JWT token
    const token = jwt.sign({ id: user._id, email: user.email }, process.env.SECRET_KEY, { expiresIn: '1h' });

    res.json({ token });
  } catch (error) {
    console.error(error); 
    res.status(500).json({ message: 'Internal server error' });
  }
});

router.post('/register', async (req, res) => {
    try {
      const { email, password, phno, college, branch} = req.body;
  
      // Check if username already exists
      const existingUser = await User.findOne({ email });
      if (existingUser) {
        return res.status(400).json({ message: 'Username already exists' });
      }
  
      const newUser = new User({ email, password, phno, college, branch});
      await newUser.save();
      console.log("user registered");
      res.status(201).json({ message: 'User registered successfully' });
    } catch (error) {
      res.status(500).json({ message: 'Internal server error' });
    }
  });
  



module.exports=router
 