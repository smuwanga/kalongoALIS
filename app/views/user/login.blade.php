<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="{{ URL::asset('css/bootstrap.min.css') }}" />
        <link rel="stylesheet" type="text/css" href="{{ URL::asset('css/bootstrap-theme.min.css') }}" />
        <link rel="stylesheet" type="text/css" href="{{ URL::asset('css/login.css') }}" />
        <title>{{ Config::get('kblis.name') }} {{ Config::get('kblis.version') }}</title>
    </head>
    <body>
<div class="container">
    <div class="row">
        <div class="col-sm-offset-5 col-sm-3">

                {{ Form::open(array(
                    "route"        => "user.login",
                    "autocomplete" => "off",
                    "class" => "form-horizontal",
                    "role" => "form"
                )) }}            

            <div class="form-login">
         
                <div class="row text-center login_logo">
                    <div class="col-md-12">
                        <img src="{{ Config::get('kblis.organization-logo') }}" alt="" height="60" width="60">    
                    </div>                
                </div>

                <div class="form-group{{ $errors->has('username') ? ' has-error' : '' }}">
                    <div>
                        <input id="username" type="text" placeholder="Username" class="form-control" name="username" value="{{ Input::old('username') }}">

                            @if ($errors->has('username'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('username') }}</strong>
                                </span>
                            @endif
                    </div>
                </div>

                <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">                          
                    <div>
                        <input id="password" type="password" class="form-control" name="password" placeholder="Password">

                        @if ($errors->has('password'))
                            <span class="help-block">
                                <strong>{{ $errors->first('password') }}</strong>
                            </span>
                        @endif
                    </div>
                </div>
                        
                <div class="form-group">
                    <div class="">
                        <button type="submit" class="btn btn-primary ">
                             Login <i class="fa fa-btn fa-sign-in"></i>
                        </button>

                    </div>
                </div>

            </div>
        </form>

        </div>
    </div>


</div>
    </body>
</html>