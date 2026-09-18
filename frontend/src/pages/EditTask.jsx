import { useState, useEffect } from "react";
import { Link, useNavigate, useParams } from "react-router-dom";
import { getTaskDetail,updateTask } from "../services/task";

export default function EditTask() {
    const { id } = useParams();
    const navigate = useNavigate();

    const [title, setTitle] = useState("");
    const [description, setDescription] = useState("");
    const [status, setStatus] = useState("pending");
    const [dueDate, setDueDate] = useState("");

    const [loading, setLoading] = useState(true);
    const [saving, setSaving] = useState(false);

    const [errorMessage, setErrorMessage] = useState("");
    const [successMessage, setSuccessMessage] = useState("");

    // Fetch existing task
    useEffect(() => {
        const fetchTask = async () => {
            try {
                setLoading(true);
                setErrorMessage("");

                const response = await getTaskDetail(id);

                console.log("TASK RESPONSE:", response);

                const task = response.data || response;

                // Populate form fields
                setTitle(task.title || "");
                setDescription(task.description || "");
                setStatus(task.status || "pending");
                setDueDate(task.due_date || "");

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

    // Update task
    const handleSubmit = async (e) => {
        e.preventDefault();

        setErrorMessage("");
        setSuccessMessage("");
        setSaving(true);

        try {
            const response = await updateTask(id, {
                title,
                description,
                status,
                due_date: dueDate
            });

            console.log("UPDATE TASK RESPONSE:", response);

            setSuccessMessage(
                response.message || "Task updated successfully."
            );

            // Redirect to dashboard
            setTimeout(() => {
                navigate("/dashboard");
            }, 1000);

        } catch (error) {
            console.error("UPDATE TASK ERROR:", error);
            setErrorMessage(error.message);
        } finally {
            setSaving(false);
        }
    };

    if (loading) {
        return (
            <div className="container mt-4">
                <div className="alert alert-info">
                    Loading task...
                </div>
            </div>
        );
    }

    return (
        <div className="container mt-4">

            <div className="d-flex justify-content-between align-items-center mb-4">

                <h2 className="mb-0">
                    Edit Task
                </h2>

                <Link
                    to="/dashboard"
                    className="btn btn-secondary"
                >
                    Back to Dashboard
                </Link>

            </div>

            <div className="card shadow-sm">

                <div className="card-body p-4">

                    {errorMessage && (
                        <div className="alert alert-danger">
                            {errorMessage}
                        </div>
                    )}

                    {successMessage && (
                        <div className="alert alert-success">
                            {successMessage}
                        </div>
                    )}

                    <form onSubmit={handleSubmit}>

                        {/* Title */}
                        <div className="mb-3">

                            <label className="form-label fw-semibold">
                                Title
                            </label>

                            <input
                                type="text"
                                className="form-control"
                                placeholder="Enter task title"
                                value={title}
                                onChange={(e) =>
                                    setTitle(e.target.value)
                                }
                                required
                            />

                        </div>

                        {/* Description */}
                        <div className="mb-3">

                            <label className="form-label fw-semibold">
                                Description
                            </label>

                            <textarea
                                className="form-control"
                                rows="5"
                                placeholder="Enter task description"
                                value={description}
                                onChange={(e) =>
                                    setDescription(e.target.value)
                                }
                                required
                            />

                        </div>

                        {/* Status */}
                        <div className="mb-3">

                            <label className="form-label fw-semibold">
                                Status
                            </label>

                            <select
                                className="form-select"
                                value={status}
                                onChange={(e) =>
                                    setStatus(e.target.value)
                                }
                            >
                                <option value="pending">
                                    Pending
                                </option>

                                <option value="in_progress">
                                    In Progress
                                </option>

                                <option value="completed">
                                    Completed
                                </option>

                            </select>

                        </div>

                        {/* Due Date */}
                        <div className="mb-4">

                            <label className="form-label fw-semibold">
                                Due Date
                            </label>

                            <input
                                type="date"
                                className="form-control"
                                value={dueDate}
                                onChange={(e) =>
                                    setDueDate(e.target.value)
                                }
                                required
                            />

                        </div>

                        {/* Buttons */}
                        <div className="d-flex justify-content-end gap-2">

                            <Link
                                to="/dashboard"
                                className="btn btn-secondary"
                            >
                                Cancel
                            </Link>

                            <button
                                type="submit"
                                className="btn btn-success"
                                disabled={saving}
                            >
                                {saving
                                    ? "Updating..."
                                    : "Update Task"}
                            </button>

                        </div>

                    </form>

                </div>

            </div>

        </div>
    );
}