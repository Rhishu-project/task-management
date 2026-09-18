const BASE_URL = import.meta.env.API_URL || "http://localhost:8000/api/";

export const getTask = async (page = 1) => {
    const token = localStorage.getItem("token");

    const response = await fetch(
        `${BASE_URL}tasks?page=${page}`,
        {
            method: "GET",
            headers: {
                Accept: "application/json",
                Authorization: `Bearer ${token}`,
            },
        }
    );

    const data = await response.json();

    if (!response.ok) {
        throw new Error(data.message || "Failed to fetch tasks");
    }

    return data;
};

export const createTask = async (taskdata) => {
    try {
        const token = localStorage.getItem("token");
        if (!token) {
           throw new Error('User is not authorized! please login first');
        }
        const response = await fetch(`${BASE_URL}tasks`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                "Accept": "application/json",
                "authorization":`Bearer ${token}`
            },
            body: JSON.stringify(taskdata),
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

export const getTaskDetail = async (id) => {
    try {
        const token = localStorage.getItem("token");
        if (!token) {
           throw new Error('User is not authorized! please login first');
        }
        const response = await fetch(`${BASE_URL}tasks/${id}`, {
            method: "GET",
            headers: {
                "Content-Type": "application/json",
                "Accept": "application/json",
                "authorization":`Bearer ${token}`
            },
            // body: JSON.stringify(taskdata),
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

export const updateTask = async (id, taskData) => {
    const token = localStorage.getItem("token");

    const response = await fetch(`${BASE_URL}tasks/${id}`, {
        method: "PUT",
        headers: {
            "Content-Type": "application/json",
            Accept: "application/json",
            Authorization: `Bearer ${token}`,
        },
        body: JSON.stringify(taskData),
    });

    const data = await response.json();

    if (!response.ok) {
        throw new Error(
            data.message || "Failed to update task"
        );
    }

    return data;
};

export const deleteTask = async (id) => {
    try {
        const token = localStorage.getItem("token");
        if (!token) {
           throw new Error('User is not authorized! please login first');
        }
        const response = await fetch(`${BASE_URL}tasks/${id}`, {
            method: "DELETE",
            headers: {
                "Content-Type": "application/json",
                "Accept": "application/json",
                "authorization":`Bearer ${token}`
            },
            // body: JSON.stringify(taskdata),
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