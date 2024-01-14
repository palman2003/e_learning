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
        type:Number,
        required:true
    },
    password:{
        type:String,
        required:true
    }
},{timestamps:true});

userSchema.pre('save',async function(next){
    const user=this;
    if(!user.isModified('password')) return next();

    const salt=await bcrypt.genSalt(10);
    const hashedPassword=await bcrypt.hash(user.password,salt);
    user.password=hashedPassword;
    next();
});



module.exports=mongoose.model('Users',userSchema);