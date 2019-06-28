<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<!DOCTYPE html>
<html lang="en">
    <title>Sign up for Attendance Management system</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <head>
        <script src="jquery/jquery.min.js"></script>	
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="js/bootstrap.min.js"></script>
        <link rel="icon" href="images/icon.png" type="image/x-icon" />
        <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
        <style>
            body  {
                background-image: url("folder/background.tif");
                background-color: #cccccc;
            }
            .container-fluid {padding:50px;}
            .container{background-color:white;padding:50px;   }
            #title{font-family: 'Lobster', cursive;;}
        </style>

        <script  type="text/javascript">

            function preventBack() {
                window.history.forward();
            }
            setTimeout("preventBack()", 0);
            window.onload = function () {
                null;
            };

        </script>
    </head>
    <body>
        <div class="container-fluid">
            <div class="container">
                <h2 class="text-center" id="title">Attendance management system</h2>
                <p class="text-center">
                    <small id="passwordHelpInline" class="text-muted">Team Members: Akash Jadhav, Gururaj Hudgi,Poonam Burange,Aditya Telange, Supriya Jape</small>
                </p>
                <hr>
                <div class="row">
                    <div class="col-md-5">
                        <form role="form" method="post" action="Registration">
                            <fieldset>							
                                <p class="text-uppercase pull-center"> SIGN UP.</p>	
                                <div class="form-group">
                                    <input type="username" name="username" id="username" class="form-control input-lg" placeholder="username" required="required">
                                </div>
                                <div class="form-group">
                                    <input type="email" name="email" id="email" class="form-control input-lg" placeholder="Email Address"  required="required">
                                </div>
                                <div class="form-group">
                                    <input type="password" name="password" id="password" class="form-control input-lg" placeholder="Password"  required="required">
                                </div>
                                <div class="form-group">
                                    <input type="password" name="confirm" id="password2" class="form-control input-lg" placeholder="Confirm Password"  required="required">
                                </div>
                                <div class="form-check">
                                    <label class="form-check-label">
                                        <input type="checkbox" class="form-check-input" required="required">
                                        By Clicking register you're agree to our policy & terms
                                    </label>
                                    <br><br>
                                </div>
                                <div>
                                    <input type="submit" class="btn btn-lg btn-primary" value="Register">
                                </div>
                            </fieldset>
                        </form>
                    </div>

                    <div class="col-md-2">
                    </div>
                    <div class="col-md-5">
                        <form role="form" action="Login" method="post">
                            <fieldset>							
                                <p class="text-uppercase"> Login using your account: </p>	
                                <div class="form-group">
                                    <input type="text" name="username" id="username" class="form-control input-lg" placeholder="username"  required="required">
                                </div>
                                <div class="form-group">
                                    <input type="password" name="password" id="password" class="form-control input-lg" placeholder="Password"  required="required">
                                </div>
                                <div>
                                    <input type="submit" class="btn btn-md" value="Sign In">
                                </div>
                            </fieldset>
                        </form>	
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
