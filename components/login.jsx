import React, { useState } from 'react';
import axios from 'axios';
import {useNavigate } from 'react-router-dom';

function Login() {
    const [email, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const navigate = useNavigate();

    const handleUsernameChange = (event) => {
        setUsername(event.target.value);
    };

    const handlePasswordChange = (event) => {
        setPassword(event.target.value);
    };

    const handleSubmit = async (event) => {
        event.preventDefault();
        
        try {
            const response = await axios.post('http://192.168.1.7:3000/v1/api/user/login', {
                email,
                password
            });
            const token = response.data.token;
            
            localStorage.setItem('token', token);
            navigate('/upload');
        }
        catch (error) {
            console.error('Login failed:', error);
            
        }
    };

    return (
        <div className="limiter">
            <div className="container-login100">
                <div className="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
                    <form className="login100-form validate-form flex-sb flex-w" onSubmit={handleSubmit}>
                        <span className="login100-form-title p-b-32">Login</span>
                        <span className="txt1 p-b-11">Username</span>
                        <div className="wrap-input100 validate-input m-b-36" data-validate="Username is required">
                            <input
                                className="input100"
                                type="text"
                                name="username"
                                value={email}
                                onChange={handleUsernameChange}
                            />
                            <span className="focus-input100"></span>
                        </div>
                        <span className="txt1 p-b-11">Password</span>
                        <div className="wrap-input100 validate-input m-b-12" data-validate="Password is required">
                            <span className="btn-show-pass">
                                <i className="fa fa-eye"></i>
                            </span>
                            <input
                                className="input100"
                                type="password"
                                name="pass"
                                value={password}
                                onChange={handlePasswordChange}
                            />
                            <span className="focus-input100"></span>
                        </div>
                        <div className="container-login100-form-btn">
                            <button className="login100-form-btn">Login</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    );
}

export default Login;
