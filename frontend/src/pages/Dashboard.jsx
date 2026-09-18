import { useEffect, useState } from "react";
import { getTask, deleteTask } from "../services/task";
import { Link } from "react-router-dom";

export default function Dashboard() {
    const [tasks, setTasks] = useState([]);

    const [loading, setLoading] = useState(true);
    const [errorMessage, setErrorMessage] = useState("");
    const [successMessage, setSuccessMessage] = useState("");

    // Pagination
    const [currentPage, setCurrentPage] = useState(1);
    const [lastPage, setLastPage] = useState(1);
    const [perPage, setPerPage] = useState(10);
    const [total, setTotal] = useState(0);

    const fetchTasks = async (page) => {
        try {
            setLoading(true);
            setErrorMessage("");

            const response = await getTask(page);

            console.log("TASK RESPONSE:", response);
            // Laravel Resource pagination response
            setTasks(response.data || []);

            setCurrentPage(response.meta.current_page);
            setLastPage(response.meta.last_page);
            setPerPage(response.meta.per_page);
            setTotal(response.meta.total);

        } catch (error) {
            console.error("TASK ERROR:", error);
            setErrorMessage(error.message);
        } finally {
            setLoading(false);
        }
    };

    useEffect(() => {
        fetchTasks(currentPage);
    }, [currentPage]);

    const handleDelete = async (id) => {
        const confirmDelete = window.confirm(
            "Are you sure you want to delete this task?"
        );

        if (!confirmDelete) {
            return;
        }

        try {
            setLoading(true);
            setErrorMessage("");
            setSuccessMessage("");

            const data = await deleteTask(id);

            setSuccessMessage(
                data.message || "Task deleted successfully."
            );

            // If last record on current page was deleted
            if (tasks.length === 1 && currentPage > 1) {
                setCurrentPage((prev) => prev - 1);
            } else {
                fetchTasks(currentPage);
            }

        } catch (error) {
            console.error("DELETE ERROR:", error);
            setErrorMessage(error.message);
            setLoading(false);
        }
    };

    const handlePageChange = (page) => {
        if (page < 1 || page > lastPage) {
            return;
        }

        setCurrentPage(page);
    };

    return (
        <div className="container mt-4">

            {/* Header */}
            <div className="d-flex justify-content-between align-items-center mb-4">
                <h2 className="mb-0">Dashboard</h2>

                <Link
                    className="btn btn-success"
                    to="/create-task"
                >
                    Create Task
                </Link>
            </div>

            {/* Loading */}
            {loading && (
                <div className="alert alert-info">
                    Loading tasks...
                </div>
            )}

            {/* Error */}
            {errorMessage && (
                <div className="alert alert-danger">
                    {errorMessage}
                </div>
            )}

            {/* Success */}
            {successMessage && (
                <div className="alert alert-success">
                    {successMessage}
                </div>
            )}

            {/* Total */}
            {!loading && !errorMessage && (
                <div className="mb-3">
                    <strong>Total Tasks:</strong> {total}
                </div>
            )}

            {/* No Tasks */}
            {!loading &&
                !errorMessage &&
                tasks.length === 0 && (
                    <div className="alert alert-warning">
                        No tasks found.
                    </div>
                )}

            {/* Table */}
            {!loading &&
                !errorMessage &&
                tasks.length > 0 && (
                    <>
                        <div className="table-responsive">

                            <table className="table table-bordered table-striped">

                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Title</th>
                                        <th>Description</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    {tasks.map((task, index) => (
                                        <tr key={task.id}>

                                            <td>
                                                {(currentPage - 1) * perPage +
                                                    index +
                                                    1}
                                            </td>

                                            <td>
                                                {task.title}
                                            </td>

                                            <td>
                                                {task.description}
                                            </td>

                                            <td>
                                                {task.status}
                                            </td>

                                            <td>
                                                <Link
                                                    to={`/edit-task/${task.id}`}
                                                    className="btn btn-success btn-sm"
                                                >
                                                    Edit
                                                </Link>{" "}

                                                <button
                                                    type="button"
                                                    className="btn btn-danger btn-sm"
                                                    onClick={() =>
                                                        handleDelete(task.id)
                                                    }
                                                >
                                                    Delete
                                                </button>{" "}

                                                <Link
                                                    to={`/view-task/${task.id}`}
                                                    className="btn btn-primary btn-sm"
                                                >
                                                    View
                                                </Link>
                                            </td>

                                        </tr>
                                    ))}
                                </tbody>

                            </table>

                        </div>

                        {/* Pagination */}
                        {lastPage > 1 && (
                            <div className="d-flex justify-content-between align-items-center mt-3">

                                <div>
                                    Page {currentPage} of {lastPage}
                                </div>

                                <nav>
                                    <ul className="pagination mb-0">

                                        {/* Previous */}
                                        <li
                                            className={`page-item ${
                                                currentPage === 1
                                                    ? "disabled"
                                                    : ""
                                            }`}
                                        >
                                            <button
                                                className="page-link"
                                                disabled={currentPage === 1}
                                                onClick={() =>
                                                    handlePageChange(
                                                        currentPage - 1
                                                    )
                                                }
                                            >
                                                Previous
                                            </button>
                                        </li>

                                        {/* Pages */}
                                        {Array.from(
                                            { length: lastPage },
                                            (_, index) => index + 1
                                        ).map((page) => (
                                            <li
                                                key={page}
                                                className={`page-item ${
                                                    currentPage === page
                                                        ? "active"
                                                        : ""
                                                }`}
                                            >
                                                <button
                                                    className="page-link"
                                                    onClick={() =>
                                                        handlePageChange(page)
                                                    }
                                                >
                                                    {page}
                                                </button>
                                            </li>
                                        ))}

                                        {/* Next */}
                                        <li
                                            className={`page-item ${
                                                currentPage === lastPage
                                                    ? "disabled"
                                                    : ""
                                            }`}
                                        >
                                            <button
                                                className="page-link"
                                                disabled={
                                                    currentPage === lastPage
                                                }
                                                onClick={() =>
                                                    handlePageChange(
                                                        currentPage + 1
                                                    )
                                                }
                                            >
                                                Next
                                            </button>
                                        </li>

                                    </ul>
                                </nav>

                            </div>
                        )}
                    </>
                )}

        </div>
    );
}