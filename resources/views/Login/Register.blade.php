<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title> Register Form | CodingLab </title>
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
  </head>
<body>
  <div class="main_div">
    <div class="title">Register Form</div>
    <form action="{{ url('/register') }}" method="POST">
    @csrf
      <div class="input_box">
        <input type="text" name="name" placeholder="Full Name" required>
        <div class="icon"><i class="fas fa-user"></i></div>
      </div>
      <div class="input_box">
        <input type="email" name="email" placeholder="Email Address" required>
        <div class="icon"><i class="fas fa-envelope"></i></div>
      </div>
      <div class="input_box">
        <input type="password" name="password" placeholder="Password" required>
        <div class="icon"><i class="fas fa-lock"></i></div>
      </div>
      <div class="input_box">
        <input type="password" name="confirm_password" placeholder="Confirm Password" required>
        <div class="icon"><i class="fas fa-lock"></i></div>
      </div>
      <div class="input_box button">
        <input type="submit" value="Register">
      </div>
      <div class="sign_up">
        Already a account? <a href="{{url('/login')}}">Login now</a>
      </div>
    </form>
  </div>
</body>
</html>
