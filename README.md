# Flutter BLoC

Curso de DevTalles sobre el gestor de estados Flutter BLoC.

## Para empezar

Revisar Geolocator plugin, en caso de tener cambios en la instalación:

[GeoLocator Package](https://pub.dev/packages/geolocator)

## Flutter Bloc - Instalación

Aunque para usar Bloc para gestionar el estado solo necesitamos instalar el paquete flutter_bloc `https://pub.dev/packages/flutter_bloc`, cuando trabajamos con Flutter Bloc es muy conveniente instalar los dos siguientes paquetes:

- equatable `https://pub.dev/packages/equatable`
  - Es muy popular y sirve para hacer comparación de objetos
- get_it `https://pub.dev/packages/get_it`
  - Este paquete es menos común y se usa cuando un bloc depende de otro bloc en el mismo nivel jerárquico
  - Es un Service Locator, es decir registra Singleton para hacer inyección de dependencias

También se instala el paquete `bloc` pero es puramente opcional.

**Instalaciones**

Usando `PubSpec Assist` e indicando `flutter_bloc, bloc, equatable, get_it` o con los comandos de instalación:

```
flutter pub add flutter_bloc bloc

flutter pub add equatable

flutter pub add get_it
```
