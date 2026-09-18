import { BrowserRouter as Router,Routes,Route } from 'react-router-dom'
import "./App.css";
import Footer from './components/Footer';
import Navbar from './components/Navbar';
import ProtectedRoute from './components/ProtectedRoute';

import Login from './pages/Login';
import Register from './pages/Register';
import Dashboard from './pages/Dashboard';
import CreateTask from './pages/CreateTask';
import GetTask from './pages/GetTask';
import EditTask from './pages/EditTask';


function App() {
  return (
    <Router>
      <Navbar />
      <main>
        <Routes>
          <Route path='/' element ={<Login/>} />
          <Route path='/login' element = {<Login />} />
          <Route path='/register' element={<Register/>} />
          <Route path='/dashboard' element={<ProtectedRoute><Dashboard/></ProtectedRoute>} />
          <Route path='/create-task' element={<ProtectedRoute><CreateTask/></ProtectedRoute>} />
          <Route path='/edit-task/:id' element={<ProtectedRoute><EditTask/></ProtectedRoute>} />
          <Route path='/view-task/:id' element={<ProtectedRoute><GetTask/></ProtectedRoute>} />
        </Routes>
      </main>
      <Footer />
    </Router>
  )
}

export default App
