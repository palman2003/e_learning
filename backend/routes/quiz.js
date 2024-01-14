const express=require('express');

const router=express.Router();

const fetchQuestion=require("../models/quizmodel");

router.get("/questions",async (req,res)=>{
  try {
    const questionArray = await fetchQuestion();
    res.json(questionArray);
    
 } catch (error) {
    console.error('Error:', error);
    res.status(500).send('Internal Server Error');
 }
  });



module.exports=router