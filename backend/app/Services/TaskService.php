<?php

namespace App\Services;

use App\Models\Task;
use App\Models\User;
use Illuminate\Contracts\Pagination\LengthAwarePaginator;

class TaskService
{
    public function getTasks(
        User $user,
        ?string $status = null
    ): LengthAwarePaginator {
        return Task::query()
            ->where('user_id', $user->id)
            ->when(
                $status,
                fn ($query) => $query->where('status', $status)
            )
            ->latest()
            ->paginate(10);
    }

    public function createTask(
        User $user,
        array $data
    ): Task {
        return $user->tasks()->create($data);
    }

    public function updateTask(
        Task $task,
        array $data
    ): Task {
        $task->update($data);

        return $task->refresh();
    }

    public function deleteTask(Task $task): void
    {
        $task->delete();
    }
}