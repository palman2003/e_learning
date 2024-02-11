import React, { useState } from 'react';
import axios from 'axios';
import "../styles/upload.css"
import {useNavigate } from 'react-router-dom';

const Upload = () => {
    const [file, setFile] = useState(null);
    const navigate = useNavigate();
    const handleLogout =()=>{
        localStorage.removeItem('Token');
        navigate("/");
    }
  

    const handleFileChange = (event) => {
        setFile(event.target.files[0]);
    };

    const handleSubmit = async (event) => {
        event.preventDefault();
        try {
            if (!file) {
                console.error('No file selected');
                return;
            }

            const formData = new FormData();
            formData.append('csvFile', file); // Match the field name expected by the server

            const response = await axios.post('http://192.168.1.7:3000/v1/api/csv/upload', formData, {
                headers: {
                    'Content-Type': 'multipart/form-data'
                }
            });
            
            alert("Upload success");
        }
        catch (error) {
            console.error('Upload failed:', error);
        }
    };

    return (
    <div className="limiter">
        <div className="container-login100">
            <div className="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
          <form className='login100-form validate-form flex-sb flex-w' onSubmit={handleSubmit}>
            <h1 className="login100-form-title p-b-32">Upload the CSV file</h1>
            <h3 className='txt1 p-b-11'>Do not upload Excel files with extension .xls</h3>
           
              
              <input className="file-input" type="file" id="csvData" accept=".csv" onChange={handleFileChange} />
            <br /><br />
            <input className="login100-form-btn" type="submit" value="Upload" />
          </form>
         
          <br />
          <button className="login100-form-btn" onClick={handleLogout}>Logout</button>
          
        </div>
        
      </div>
    </div>
        
      
    );
}

export default Upload;
