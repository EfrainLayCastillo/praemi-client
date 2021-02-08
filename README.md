# praemiclient

A new Flutter project.
Descargar Praemi APK: [APK Release](https://github.com/EfrainLayCastillo/praemi-client/raw/main/app-release.apk)

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [WooCommerce](http://praemi.3.94.78.53.xip.io/)
- User#1
  - User: restapi - ADMIN
  - Password: #Panama01
- User#2 - VENDOR
  - User: JohnSmith
  - Password: Password01
- User#3 - ADMIN
  - User: efrainlay
  - Password: 2021Pass#/*-

## Custom Function
```php
add_filter('jwt_auth_token_before_dispatch', 'praemiBeforeDispatch', 10, 2);

function praemiBeforeDispatch($data, $user){
        return $data = array(
        'success' => true,
        'token' => $data['token'],
        'user_email' => $user->data->user_email,
        'user_nicename' => $user->data->user_nicename,
        'user_display_name' => $user->data->display_name,
        );
}
```
