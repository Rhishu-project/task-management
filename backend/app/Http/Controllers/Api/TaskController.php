<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\TaskRequest;
use App\Http\Resources\TaskResource;
use App\Models\Task;
use App\Services\TaskService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class TaskController extends Controller
{
    public function __construct(
        private readonly TaskService $taskService
    ) {
    }

    public function index(Request $request)
    {
        $tasks = $this->taskService->getTasks(
            $request->user(),
            $request->query('status')
        );

        return TaskResource::collection($tasks);
    }

    public function store(TaskRequest $request)
    {
        $task = $this->taskService->createTask(
            $request->user(),
            $request->validated()
        );

        return (new TaskResource($task))
            ->response()
            ->setStatusCode(201);
    }

    public function show(Request $request, Task $task)
    {
        $this->authorizeTask($request, $task);

        return new TaskResource($task);
    }

    public function update(
        TaskRequest $request,
        Task $task
    ) {
        $this->authorizeTask($request, $task);

        $task = $this->taskService->updateTask(
            $task,
            $request->validated()
        );

        return new TaskResource($task);
    }

    public function destroy(
        Request $request,
        Task $task
    ): JsonResponse {
        $this->authorizeTask($request, $task);

        $this->taskService->deleteTask($task);

        return response()->json([
            'message' => 'Task deleted successfully',
        ]);
    }

    private function authorizeTask(
        Request $request,
        Task $task
    ): void {
        abort_unless(
            $task->user_id === $request->user()->id,
            403,
            'You are not authorized to access this task.'
        );
    }
}