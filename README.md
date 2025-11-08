# Work Rank Application

A full-stack application consisting of a Laravel backend API and a Flutter frontend for managing employee rankings.

<img 
  src="https://github.com/user-attachments/assets/23973c06-07bc-4595-b6ce-c60009a2b6b2" 
  alt="Work Rank App Screenshot" 
  width="400" 
  height="400"
/>


## Project Structure

- `zylu_backend/` - Laravel PHP application (Backend API)
- `zylu_ranking/` - Flutter application (Frontend)

## Features

- Employee management system
- API for CRUD operations on employee data
- Mobile-responsive frontend interface
- Employee listing with details

## Backend (Laravel)

### API Endpoints

- `GET /api/employee` - Retrieve all employees
- `POST /api/employee` - Create a new employee
- `GET /api/health` - Health check endpoint

### Employee Model

- `id` - Unique identifier
- `employee_name` - Name of the employee
- `experience_in_years` - Years of experience
- `is_active` - Employment status (boolean)
- `created_at` - Timestamp
- `updated_at` - Timestamp

### Setup

1. Navigate to the backend directory:
   ```
   cd zylu_backend
   ```

2. Install PHP dependencies:
   ```
   composer install
   ```

3. Copy and configure the environment file:
   ```
   cp .env.example .env
   ```

4. Generate application key:
   ```
   php artisan key:generate
   ```

5. Run database migrations:
   ```
   php artisan migrate
   ```

6. Start the development server:
   ```
   php artisan serve
   ```

## Frontend (Flutter)

### Setup

1. Navigate to the frontend directory:
   ```
   cd zylu_ranking
   ```

2. Install Flutter dependencies:
   ```
   flutter pub get
   ```

3. Run the application:
   ```
   flutter run
   ```

### Dependencies

- Dio: For HTTP requests
- Responsive utilities for UI scaling

## Development

### Backend

The backend is built with Laravel 12 and uses:
- PHP 8.2+
- MySQL database
- Ngrok for API exposure (during development)

### Frontend

The frontend is built with Flutter and uses:
- Dart programming language
- Material Design components

## Troubleshooting

### Common Issues

1. **API Connection Errors**: Ensure the Laravel backend is running and accessible via the configured URL in the Flutter API service.

2. **Type Mismatch Errors**: The application handles conversion between integer and boolean values for the `is_active` field.

3. **CORS Issues**: If experiencing CORS errors, ensure proper headers are set in the Laravel backend.

### Recent Fixes

- Fixed data type mismatch for boolean fields in API responses
- Improved error handling in API service
- Enhanced type safety in data parsing

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a pull request

## License

This project is proprietary and confidential. All rights reserved.
