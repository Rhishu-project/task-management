import { useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import { registerUser } from "../services/api";

function Register() {
    
    const [name, setName] = useState("");
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
    const [password_confirmation, setRepassword] = useState("");
    
    const [showPassword, setShowPassword] = useState(false);
    const [showRepassword, setShowRepassword] = useState(false);
    const [loading, setLoading] = useState(false);
    const [errorMessage, setErrorMessage] = useState("");
    const [successMessage, setSuccessMessage] = useState("");
    
    const navigate = useNavigate();

    const handleLogin = async(e) => {
        e.preventDefault();
        setErrorMessage("");
        setSuccessMessage("");
        try {
            const data = await registerUser({ name, email, password,password_confirmation });

            setSuccessMessage(data.message);
            setTimeout(() => {
                navigate("/login");
            }, 1500);
        } catch (error) {
            setErrorMessage(error.message);
        }finally {
            setLoading(false);
        }
    };
  return (
        <div className="container d-flex justify-content-center align-items-center min-vh-100">
            <div className="card shadow-lg p-4 rounded-4" style={{ maxWidth: "450px", width: "100%" }}>
                {successMessage && (
                    <div className="alert alert-success">
                        {successMessage}
                    </div>
                )}

                {errorMessage && (
                    <div className="alert alert-danger">
                        {errorMessage}
                    </div>
                )}
                <div className="text-center mb-4">
                    <Link className="navbar-brand fw-bold" to="/"> Task Management</Link>
                    <p className="text-muted">Log in to your Task Management account</p>
                </div>
                <form onSubmit={handleLogin}>
                    <div className="mb-3">
                        <label className="form-label fw-semibold">Name</label>
                        <input type="text" className="form-control form-control-lg fs-6" placeholder="name"
                        value={name}  onChange={(e) => setName(e.target.value)} required />
                    </div>

                    <div className="mb-3">
                        <label className="form-label fw-semibold">Email</label>
                        <input type="email" className="form-control form-control-lg fs-6" placeholder="email"
                        value={email}  onChange={(e) => setEmail(e.target.value)} required />
                    </div>
                    <div className="mb-3">
                        <div className="d-flex justify-content-between">
                            <label className="form-label fw-semibold">Password</label>
                        </div>
                        <div className="input-group">
                            <input type={showPassword ? "text" : "password"} className="form-control form-control-lg fs-6 border-end-0"
                            placeholder="Enter password" value={password} onChange={(e) => setPassword(e.target.value)} required />
                            <button className="btn btn-outline-secondary border-start-0 bg-white" type="button"
                                onClick={() => setShowPassword(!showPassword)}
                                >{showPassword ? "👁️" : "🙈"}
                            </button>
                        </div>
                    </div>
                    <div className="mb-3">
                        <div className="d-flex justify-content-between">
                            <label className="form-label fw-semibold">Confirm Password</label>
                        </div>
                        <div className="input-group">
                            <input type={showRepassword ? "text" : "password"} className="form-control form-control-lg fs-6 border-end-0"
                            placeholder="Re-Enter password" value={password_confirmation} onChange={(e) => setRepassword(e.target.value)} required />
                            <button className="btn btn-outline-secondary border-start-0 bg-white" type="button"
                                onClick={() => setShowRepassword(!showRepassword)}
                                >{showRepassword ? "👁️" : "🙈"}
                            </button>
                        </div>
                    </div>
                    <button type="submit" className="btn btn-dark w-100 btn-lg fs-6 fw-bold mb-3 shadow-sm">
                        Sign Up
                    </button>
                </form>
                <div className="text-center">
                    <span className="text-muted small">Don't have an account? </span>
                    <Link to="/login" className="text-decoration-none fw-bold text-dark small">Sign in</Link>
                </div>
            </div>
        </div>
    );
}
export default Register;
