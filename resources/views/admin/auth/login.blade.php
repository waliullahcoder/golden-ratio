<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{$settings->app_name}} | Admin Login</title>
    <link rel="shortcut icon" href="{{ asset($settings->favicon? $settings->favicon : './backend/frontend/images/logo/favicon.png') }}" type="image/x-icon">

    @include('layouts.admin.partial.styles')

    <style>
        body {
            height: 100vh;
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Inter', sans-serif;
        }

        .login-card {
            background: rgba(0, 0, 0, 0.6);
            padding: 2.5rem 2rem;
            border-radius: 16px;
            width: 100%;
            max-width: 380px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.5);
        }

        .login-card h1 {
            font-size: 1.8rem;
            margin-bottom: 0.5rem;
        }

        .login-card p {
            font-size: 0.9rem;
            color: rgba(255, 255, 255, 0.7);
            margin-bottom: 1.5rem;
        }

        .form-control {
            background-color: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.3);
            color: #fff;
            border-radius: 10px;
            padding: 0.6rem 1rem;
            margin-bottom: 1rem;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            background-color: rgba(255, 255, 255, 0.15);
            border-color: #00ffd5;
            outline: none;
            color: #fff;
            box-shadow: 0 0 0 0.2rem rgba(0, 255, 213, 0.25);
        }

        .btn-login {
            background: #00ffd5;
            color: #000;
            font-weight: 600;
            border-radius: 10px;
            border: none;
            padding: 0.7rem 0;
            width: 100%;
            transition: all 0.3s ease;
        }

        .btn-login:hover {
            background: #00e0c0;
        }

        .password-toggler {
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            background: transparent;
            border: none;
            color: #fff;
            cursor: pointer;
            font-size: 14px;
        }

        .position-relative {
            position: relative;
        }

        .text-link {
            color: rgba(255, 255, 255, 0.6);
            font-size: 0.85rem;
            text-decoration: none;
        }

        .text-link:hover {
            color: #00ffd5;
        }
    </style>
</head>

<body>
    <div class="login-card">
<img src="{{ asset($settings->logo? $settings->logo : './backend/frontend/images/logo/logo.png') }}" 
     height="100" width="100%" 
     alt="Logo" 
     style="object-fit: contain; border-radius: 80%;">

        <h1 class="text-center fw-bold">Admin Login</h1>
        <p class="text-center">For your protection, please verify your identity</p>

        <form action="{{ route('admin.login') }}" method="POST">
            @csrf

            <!-- User Name -->
            <input type="text" name="user_name" class="form-control" placeholder="User Name"
                value="{{ old('user_name') }}" required>

            <!-- Password -->
            <div class="position-relative">
                <input type="password" name="password" id="password" class="form-control"
                    placeholder="Password" required>
                <button type="button" class="password-toggler" onclick="togglePassword()">
                    <i class="fas fa-eye-slash"></i>
                </button>
            </div>

            <!-- Remember Me & Forgot -->
            <div class="d-flex justify-content-between align-items-center mb-3">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" name="remember" id="remember"
                        {{ old('remember') ? 'checked' : '' }}>
                    <label class="form-check-label" for="remember">Remember me</label>
                </div>
                <a href="#" class="text-link">Forgot password?</a>
            </div>

            <!-- Submit -->
            <button type="submit" class="btn-login">Sign In</button>
        </form>
    </div>

    <!-- Scripts -->
    @include('layouts.admin.partial.scripts')

    <script>
        function togglePassword() {
            const input = document.getElementById('password');
            const icon = document.querySelector('.password-toggler i');
            if (input.type === 'password') {
                input.type = 'text';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            } else {
                input.type = 'password';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            }
        }
    </script>
</body>

</html>
