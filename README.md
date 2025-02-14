# Flutter BLoC

Curso de DevTalles sobre el gestor de estados Flutter BLoC.

BLoC significa Business Logic Component y es un gestor de estados y se codifica en la carpeta de `presentation`.

Conecta la capa de presentación (widgets) con las diferentes capas de nuestra aplicación.

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

## Cubit Simple

Un Cubit es una versión simplificada de un Bloc. Son Blocs.

En la carpeta `presentation` creamos una nueva carpeta llamada `blocs`.

Dentro de la carpeta `blocs` creamos la carpeta `01-simple_cubit` y dentro el archivo `username_cubit.dart`.

Dentro de la carpeta `blocs` creamos el archivo de barril `blocs.dart`.

### BlocProvider

En `main.dart` proporcionamos la instancia de nuestro Cubit a nivel global (si no lo queremos a nivel global podemos crear la instancia en un widget concreto) Para ello hemos creado el Stateless Widget `BlocsProviders` que es una clase.

### Consumir y cambiar el estado del cubit

Modificamos el fuente `./screens/01_simple_cubit/cubit_screen.dart`.

### BlocBuilder

En `main.dart` cambiamos la construcción perezosa por una que llama al constructor en cuanto se crea la instancia.

Hemos hecho una copia `cubit_screen_copy.dart` y cambiamos en `cubit_screen.dart` de `context.watch()` a `BlocBuilder`.

BlocBuilder es más eficiente, pero hay que escribir más código.
