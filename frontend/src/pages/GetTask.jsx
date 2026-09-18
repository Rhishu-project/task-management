import { useEffect, useState } from "react";
import { getTaskDetail } from "../services/task";
import { Link, useParams } from "react-router-dom";

export default function GetTask() {
    const { id } = useParams();
    const [task, setTask] = useState(null);
    const [loading, setLoading] = useState(true);
    const [errorMessage, setErrorMessage] = useState("");

    useEffect(() => {
        const fetchTask = async () => {
            try {
                setLoading(true);
                setErrorMessage("");

                const data = await getTaskDetail(id);

                console.log("TASK RESPONSE:", data);

                setTask(data.data || data);

            } catch (error) {
                console.error("TASK ERROR:", error);
                setErrorMessage(error.message);
            } finally {
                setLoading(false);
            }
        };

        if (id) {
            fetchTask();
        }
    }, [id]);

    if (loading) {
        return (
            <div className="container mt-4">
                <div className="alert alert-info">
                    Loading task...
                </div>
            </div>
        );
    }
    if (errorMessage) {
        return (
            <div className="container mt-4">
                <div className="alert alert-danger">
                    {errorMessage}
                </div>

                <Link to="/dashboard" className="btn btn-secondary">
                    Back to Dashboard
                </Link>
            </div>
        );
    }
    if (!task) {
        return (
            <div className="container mt-4">
                <div className="alert alert-warning">
                    Task not found.
                </div>

                <Link to="/dashboard" className="btn btn-secondary">
                    Back to Dashboard
                </Link>
            </div>
        );
    }

    return (
        <div className="container mt-4">
            <div className="d-flex justify-content-between align-items-center mb-4">
                <h2>Task Details</h2>
                <Link
                    to="/dashboard"
                    className="btn btn-secondary"
                >
                    Back to Dashboard
                </Link>
            </div>
            <div className="card shadow-sm">
                <div className="card-body">

                    <h4 className="card-title mb-4">
                        {task.title}
                    </h4>
                    <div className="mb-3">
                        <strong>Description:</strong>
                        <p className="mt-2">
                            {task.description}
                        </p>
                    </div>
                    <div className="mb-3">
                        <strong>Status:</strong>

                        <span className="badge bg-primary ms-2">
                            {task.status}
                        </span>
                    </div>
                    <div className="mb-3">
                        <strong>Due Date:</strong>
                        <span className="ms-2">
                            {task.due_date}
                        </span>
                    </div>
                    <div className="mb-3">
                        <strong>Created At:</strong>
                        <span className="ms-2">
                            {task.created_at}
                        </span>
                    </div>
                    <div>
                        <strong>Updated At:</strong>
                        <span className="ms-2">
                            {task.updated_at}
                        </span>
                    </div>
                </div>
            </div>
        </div>
    );
}