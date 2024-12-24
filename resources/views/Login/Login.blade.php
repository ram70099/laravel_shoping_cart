<!DOCTYPE html>
<!-- Created By CodingLab - www.codinglabweb.com -->
<html lang="en" dir="ltr">
<meta name="csrf-token" content="{{ csrf_token() }}">

<head>
  <meta charset="UTF-8">
  <title> Login Form | CodingLab </title>
  <link rel="stylesheet" href="css/login.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />
</head>

<body>
  <div class="main_div">
    <div class="title">Login Form</div>
    <div class="social_icons">
      <a href="{{route('facebook.login')}}"><i class="fab fa-facebook-f"></i> <span>Facebook</span></a>
      
      <a href="{{ route('google.login') }}"><i class="fab fa-google"></i><span>Google</span></a>
      </div>
    <form action="{{ url('/login') }}" method="POST">
    @csrf
    <div class="input_box">
        <input type="text" name="email" placeholder="Email or Phone" required>
        <div class="icon"><i class="fas fa-user"></i></div>
    </div>
    <div class="input_box">
        <input type="password" name="password" placeholder="Password" required>
        <div class="icon"><i class="fas fa-lock"></i></div>
    </div>
    <div class="option_div">
        <div class="check_box">
            <input type="checkbox">
            <span>Remember me</span>
        </div>
        <div class="forget_div">
            <a href="#">Forgot password?</a>
        </div>
    </div>
    <div class="input_box button">
        <input type="submit" value="Login">
    </div>
    <div class="sign_up">
        Not a member? <a href="{{ url('/register') }}">Signup now</a>
    </div>
</form>

  </div>

</body>

</html>