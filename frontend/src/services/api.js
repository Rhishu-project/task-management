export const registerUser = async (userData) => {
    const BASE_URL =
        import.meta.env.API_URL || "http://localhost:8000/api/";
    try {
    const response = await fetch(`${BASE_URL}auth/register`, {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
        },
        body: JSON.stringify(userData),
    });

    const data = await response.json();

    if (!response.ok) {
        throw new Error(data.message || "Registration failed");
    }

    return data;
    } catch (error) {
    throw error;
  }
};

export const loginUser = async (userData) =>{
  const BASE_URL =
      import.meta.env.API_URL || "http://localhost:8000/api/";
  try {
    const response = await fetch(`${BASE_URL}auth/login`,{
      method:"POST",
      headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
      },
      body: JSON.stringify(userData),
    });

    const data = await response.json();
    
    if (!response.ok) {
      throw new Error(data.message || "Login Failed Please check credential");
    }
    return data;
  } catch (error) {
    throw error;
  }
}
