# Flutter + Wordpress

This Project is created with the idea How to use Wordpres API as a Backend for the Flutter APP.

- [x] Create Model for Posts
- [x] Visualize Posts
- [x] Create Plugin for Custom Endpoints/Routes 
- [x] Create Model for Pages
- [x] ~~Create Model for Media~~
- [x] Create Model for Users
- [x] Show Media in Posts
- [x] Login/Register Users
- [ ] Created Posts
- [ ] Update Posts
- [ ] Delete Posts
- [ ] Create Documentation of how this project was created

## Custom Plugin Wordpress
For the next versions is necesary install the Custom Plugin, because I'm use custom endpoints for consume the API.
This plugin is very basic and of course is not perfect but I created with my little bit experience in PHP and I'm very happy with the result.

- [Gist for plugin](https://gist.github.com/FrankyCode/8255e5a3da223c56666125d4d0808194)

## Documentation of WordPress API

- [HandBook](https://developer.wordpress.org/rest-api/)
- [References](https://developer.wordpress.org/rest-api/reference/)
- [Authentication - Nonces - Tokens in Wordpress](https://codex.wordpress.org/WordPress_Nonces)
- [Code Reference for Get Image](https://developer.wordpress.org/reference/functions/get_the_post_thumbnail_url/)

## Flutter

- [CookBook: Spanish - Obtener datos desde internet](https://flutter-es.io/docs/cookbook/networking/fetch-data)
- [CookBook: English - Fetch data from the Internet](https://flutter.dev/docs/cookbook/networking/fetch-data)
- [DOC: Serializar JSON usando Auto Librerias](https://flutter-es.io/docs/development/data-and-backend/json#serializar-json-usando-librer%C3%ADas-de-auto-generaci%C3%B3n-de-c%C3%B3digo)

## Flutter Packages

- [Http](https://pub.dev/packages/http)
- [RxDart](https://pub.dev/packages/rxdart)
- [Shared Preference](https://pub.dev/packages/shared_preferences)

## Tools

- [Create Models Serialize and Deserialize](https://app.quicktype.io/)
- [RegExpression](https://regexr.com/)

## Articles for Flutter

- [Medium: Working with APIs in Flutter](https://medium.com/flutter-community/working-with-apis-in-flutter-8745968103e9)
- [Medium: Trabajando con APIs en FLutter](https://medium.com/comunidad-flutter/trabajando-con-api-en-flutter-2e49b78b6b98)
- [Medium: Parseando JSON en Flutter](https://medium.com/@carlosAmillan/parseando-json-complejo-en-flutter-18d46c0eb045)

## RegExpression

- Get Images in pages -> [^(src=\\")]([^"])+(png|jpg|gif)
