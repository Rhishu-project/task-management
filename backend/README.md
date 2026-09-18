# Task Management API

## Overview

A production-minded REST API for managing user tasks.

## Tech Stack

- Laravel
- PHP
- MySQL
- Sanctum
- PHPUnit

## Requirements

- PHP 8.2+
- Composer
- MySQL

## Installation

composer install

cp .env.example .env

php artisan key:generate

php artisan migrate

php artisan serve

## Authentication

POST /api/v1/auth/register
POST /api/v1/auth/login

## Tasks

GET /api/v1/tasks
POST /api/v1/tasks
GET /api/v1/tasks/{id}
PUT /api/v1/tasks/{id}
DELETE /api/v1/tasks/{id}

## Testing

php artisan test