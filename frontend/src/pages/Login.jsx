import { useContext, useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import { AuthContext } from "../context/AuthContext";
import { loginUser } from "../services/api";

function Login() {
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
    const [loading, setLoading] = useState(false);
    const [showPassword, setShowPassword] = useState(false);
    const [errorMessage, setErrorMessage] = useState("");
    const [successMessage, setSuccessMessage] = useState("");
  
    const { login } = useContext(AuthContext);
    const navigate = useNavigate();

  const handleLogin = async(e) => {
    e.preventDefault();
    setErrorMessage("");
    setSuccessMessage("");
    setLoading(true);
    
    try {
        const info = await loginUser({ email, password });
        login(info.data.user, info.data.token);
        setSuccessMessage(info.message);
        navigate("/dashboard", { replace: true });
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
                        <label className="form-label fw-semibold">Email</label>
                        <input type="email" className="form-control form-control-lg fs-6" placeholder="email"
                        value={email}  onChange={(e) => setEmail(e.target.value)} required />
                    </div>
                    <div className="mb-3">
                        <div className="d-flex justify-content-between">
                            <label className="form-label fw-semibold">Password</label>
                            {/* <a href="#forgot" className="text-decoration-none small text-warning fw-medium">Forgot password?</a> */}
                        </div>
                        <div className="input-group">
                            <input type={showPassword ? "text" : "password"} className="form-control form-control-lg fs-6 border-end-0"
                            placeholder="Enter your password" value={password} onChange={(e) => setPassword(e.target.value)} required />
                            <button className="btn btn-outline-secondary border-start-0 bg-white" type="button"
                                onClick={() => setShowPassword(!showPassword)}
                                >{showPassword ? "👁️" : "🙈"}
                            </button>
                        </div>
                    </div>
                    <button type="submit" className="btn btn-dark w-100 btn-lg fs-6 fw-bold mb-3 shadow-sm">
                        Sign In
                    </button>
                </form>
                <div className="text-center">
                    <span className="text-muted small">Don't have an account? </span>
                    <Link to="/register" className="text-decoration-none fw-bold text-dark small">Sign up</Link>
                </div>
            </div>
        </div>
    );
}
export default Login;
