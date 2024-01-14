const mongoose=require('mongoose');
const bcrypt = require('bcrypt');
const schema=mongoose.Schema;

const userSchema = new schema({
    email:{
        type:String,
        required:true
    },
    college:{
        type:String,
        required:true
    },
    branch:{
        type:String,
        required:true
    },
    phno:{
        type:String,
        required:true
    },
    password:{
        type:String,
        required:true
    },
    otpSecret:{
        type:String,
    }
    
},{timestamps:true});





module.exports=mongoose.model('Users',userSchema);