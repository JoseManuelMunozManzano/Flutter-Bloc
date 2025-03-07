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

## Cubit + Go_Router - Estado Complejo del cubit

Vamos a `./lib/config/router/app_router.dart`. Ahí están las rutas de la aplicación. Quiero meterlo todo dentro de un Cubit para poder redibujarlo, cambiarlo... Modificamos ese fuente para crear una clase `RouterSimpleCubit`.

Modificamos `main.dart` porque estaba fallando. Tenemos que proveer nuestro nuevo Cubit `RouterSimpleCubit` y se añade `final appRouter = context.watch<RouterSimpleCubit>().state;` para coger el appRouter de nuestro context.

Modificamos `./screens/02_cubit_router/router_screen.dart` para, usando nuestro Cubit, al pulsar el botón vaya atrás (llame a goBack()).

## Counter Cubit

Vamos a modificar `./screens/03_multiple_cubits/multiple_cubits_screen.dart` para que, al pulsar el botón aumente el contador.

Para ello creamos un nuevo Cubit. En la carpeta `blocs` creamos la carpeta `02-counter` y dentro el archivo `counter_cubit.dart`.

Lo exportamos en nuestro archivo de barril `blocs.dart`.

Modificamos `main.dart` para proveer el nuevo Cubit en nuestros providers.

Ahora si, ya podemos modificar `./screens/03_multiple_cubits/multiple_cubits_screen.dart`.

### ThemeCubit - Cubit + State

El cambio del theme se puede hacer igual que hemos hecho el Cubit del contador.

Pero vamos a introducir el segundo archivo que tienen los BLoC, que es el estado (el primero es el BLoC, el segundo es el estado y por último están los eventos)

A partir de ahora, además, vamos a crear los Cubit con el generador que se instaló para VSCode (extensión Clob).

En la carpeta `blocs` hacemos click con el botón derecho del ratón. Del desplegable seleccionamos `Bloc: New Cubit`.

Nos va a pedir un nombre, le indicamos `theme` y pulsamos Intro.

Veremos que nos crea una carpeta `cubit` y dentro crea dos archivos, `theme_cubit.dart` y `theme_state.dart`.

Renombramos la carpeta `cubit` a `03-theme`.

Como detecta que hemos instalado el paquete `equatable`, en `theme_state.dart` nos hace automáticamente la configuración que necesitamos para usarlo.

Exportamos nuestro Cubit (el state no) en nuestro archivo de barril `blocs.dart`.

Modificamos `main.dart` para proveer el nuevo Cubit en nuestros providers.

Usaremos este Cubit en `./screens/03_multiple_cubits/multiple_cubits_screen.dart`.

Volvemos a modificar `main.dart` para que el cambio del theme sea de manera global.

### UsernameCubit

Volvemos a modificar `./screens/03_multiple_cubits/multiple_cubits_screen.dart` para que, al pulsar el botón `Nombre aleatorio` se use `UsernameCubit`.

Como es el mismo Cubit que usamos en `cubit_screen.dart`, se cambia el nombre en los dos sitios.

## Service Locator - Get_it

Vamos a usar aquí `Get_it`, un Service Locator, que es como un container de servicios y, cuando/donde lo necesito, pido la dependencia (una instancia) y la obtengo.

Cuando usamos `context.watch<CounterCubit>();` estamos usando básicamente un Service Locator, ya que decimos al context que busque la instancia de, en este caso, un CounterCubit y nos la traiga.

En la carpeta `blocs` creamos el archivo `service_locator.dart`.

He hecho una copia de `main.dart`, a la que llamo `main_copy.dart`.

En `main.dart` llamamos a nuestro Service Locator y vamos a obtener las instancias que nos ha creado.

## GuestBloc - Estado complejo

Ahora si que vamos a usar BLoC en toda su complejidad, es decir (BLoC, estado y eventos).

En VSCode, nos posicionamos en la carpeta `blocs`, pulsamos el botón derecho del ratón y seleccionamos `Bloc: New Bloc` y le damos el nombre `guests`.

Nos crea la carpeta `bloc`, que renombramos a `04-guests`.

Vemos que también nos ha creado los siguientes archivos:

- guests_bloc.dart
- guests_state.dart: es lo mismo que hemos estado viendo con los estados de los Cubit
- guests_event.dart: son formas estandarizadas en las que cambiamos el estado. En vez de cambiar el estado en el Cubit directamente, generamos un evento que va a ser recibido por el archivo guests_bloc, y este, basado en el nuevo evento, genera un nuevo estado

Por tanto, el orden sería: evento, bloc, estado. Se genera un evento que recibe el bloc y este emite un nuevo estado.

Se pueden disparar (despachar) los eventos desde cualquier lado, pero en lo personal prefiero que sea el bloc quien administre esos eventos.

Vamos al archivo `service_locator.dart` y creamos la instancia de nuestro `GuestsBloc`.

En `main.dart` ponemos a disposición de nuestros Widgets la instancia creada de `GuestsBloc`.

Ya solo queda interactuar con `GuestsBloc` para construir la funcionalidad deseada.

### Bloc Events - Relacionado al filtro

Vamos a crear eventos que puedan ser disparados y acaben cambiando el estado.

Creamos cuatro eventos en nuestro archivo `guests_event.dart`. 

### Emitir nuevo estado basado en eventos

En `guests_bloc.dart` vamos a interpretar esos eventos, lo que tiene que pasar cuando se recibe ese evento (como cambia el estado).

En `guests_state.dart` nos creamos un método `copyWith()` que nos devuelva una nueva instancia del estado.

### Reaccionar visualmente al nuevo estado

Modificamos `screens/04-guest/guests_screen.dart` para que acabe llamando al método `changeFilter(GuestFilter newFilter)`.

Funcionamiento:

- En el widget `guests_screen.dart` el valor del estado actual lo obtenemos como hacíamos con los Cubit
  - `final guestBloc = context.watch<GuestsBloc>();`
- Desde ese widget se llamará a `guests_bloc.dart`, método `changeFilter(GuestFilter newFilter)` y se le pasa el filtro deseado. Esto despacha el evento
- En el método `changeFilter(GuestFilter newFilter)` se añade, usando el método `add()` el evento asociado a ese filtro. Los eventos posibles están declarados en `guests_event.dart`
- Basado en el método `add()` se ejecuta en `guests_bloc.dart` el método handler `on()` correspondiente, que acaba ejecutando el método `emit()` que emite el nuevo estado, es decir, llama al método `copyWith()` de `guests_state.dart`
- Al cambiar el estado el widget se redibuja y muestra la nueva información basada en ese nuevo estado

### Mostrar lista de invitados

Modificamos `guests_bloc.dart` para mandar por ahora una lista hardcode de invitados.

Modificamos `guests_state.dart` para crear un getter que nos dice cuántos invitados hay, otro getter que en función del filtro pedido, devuelve la lista filtrada y un último getter que nos dice, dado el filtro, cuántos invitados hay.

Modificamos `guests_screen.dart` para mostrarlos.

### Crear un nuevo invitado

Para crear un nuevo invitado realizamos las siguientes modificaciones:

- `guests_event.dart`: creamos un nuevo evento para recibir el nombre del invitado
- `guests_bloc.dart`: creamos un handler para estar escuchando el nuevo evento creado y una función (`addGuest()`) para despachar el evento
- `guests_screen.dart`: Llamamos a la función que despacha el evento en el onPressed del botón añadir invitado

Maneras de optimizar esta implementación:

- En la función `addGuest()` podríamos recibir todo el objeto Todo en vez de solo el nombre
  - Esto podría tener un problema, que en la función `on` tengamos que tener lógica, cosa que se ve fea
  - SOLUCION: delegar toda la lógica del `on` en un nuevo método, lo que deja el `on` muy limpio

### Cambiar el estado de un invitado

Para cambiar el estado de un invitado:

- `guests_event.dart`: creamos un nuevo evento que recibe el id del invitado que quiero cambiar
- `guests_bloc.dart`: creamos un handler para estar escuchando el nuevo evento creado, una función (`_toggleGuestHandler()`) que es el código delegado por el `on` y otra función (`addGuest()`) para despachar el evento
- `guests_screen.dart`: Llamamos a la función que despacha el evento en el onChanged del SwitchListTile

## Pokemon Screen - Preparación del ejercicio

Transformamos `presentation/screens/05_pokemon/pokemon_screen.dart` en un Stateful Widget (pulsamod Ctrl+Shift+R sobre la palabra StatelessWidget y seleccionamos Convert to StatefulWidget).

Esto lo hacemos porque queremos mantener un estado en el Widget, y con ese estado local, hacer modificaciones en nuestros blocs. Cada vez que hagamos un cambio en este state, nuestros blocs van a lanzar Futures (ver `pokemon_information.dart`).

Para no perder el código anterior se crea la copia `pokemon_screen.copy.dart`.

### PokemonBloc

Nos creamos un nuevo Bloc.

En la carpeta `blocs` hacemos click con el botón derecho del ratón. Del desplegable seleccionamos `Bloc: New Bloc`. Como nombre indicamos `pokemon`.

Nos crea la carpeta `bloc`, que renombramos a `05-pokemon`.

Vemos que también nos ha creado los siguientes archivos:

- pokemon_bloc.dart
- pokemon_state.dart
- pokemon_event.dart

Empezamos modificando `pokemon_state.dart`, luego `pokemon_event.dart` y por último modificamos `pokemon_bloc.dart`.

Añadimos en `service_locator.dart` nuestro nuevo `PokemonBloc`.

Por último, proveemos en `main.dart` ese Bloc a todo el árbol de Widgets. Ya puede ser consumido.

Hacemos un full restart de nuestra app.

Y ya estamos listos para trabajar con nuestro bloc.

### FetchPokemon desde el Bloc

Vamos a trabajar con el mecanismo para obtener el nombre del Pokemon y así trabajar nuestro estado. Luego, vamos a hacer una inyección de dependencias para delegar la función de consulta del Pokemon para que lo pasen como un argumento al Bloc.

Es decir, vamos a aprender a hacer inyección de dependencias y conectar blocs entre sí.

Pero primero, vamos a hacerlo todo a la manera tradicional, sin nada de lo indicado arriba.

Modificamos `pokemon_block.dart`.

Modificamos `pokemon_screen.dart`. Usamos un `FutureBuilder` para trabajar con Futures ya que en nuestro bloc tenemos un Future.

### Inyección de dependencias

La inyección de dependencias no es más que mandar funciones o argumentos como parámetros a los constructores de nuestros BLoCs.

¿Por qué queremos hacer inyección de dependencias? Para hacer código mantenible a futuro y para poder comunicar Blocs entre si sin que cambios en un Bloc afecten a otros.

Vamos a inyectar la dependencia que nosotros usamos para obtener la información del Pokemon, la función `PokemonInformation.getPokemonName()`, situado en `pokemon_bloc.dart`. El día de mañana podré cambiar esa función por otra que, si cumple la firma que el Bloc espera, será transparente.

Una vez hecha inyección de dependencias en `pokemon_bloc.dart`, veremos que falla `service_locator.dart`. Esto es porque es obligatorio proveer la función que se espera, en este caso el nombre es `fetchPokemon` y se le asigna `PokemonInformation.getPokemonName`. Notar que no hay paréntesis. Esto es porque solo se manda la referencia a la función (no quiero ejecutarla ahí).

## Comunicación entre BLoCs - Geolocation

Vamos a hacer un Cubit que se va a comunicar con un BLoC. Para ello:

En la carpeta `blocs` hacemos click con el botón derecho del ratón. Del desplegable seleccionamos `Bloc: New Cubit`. Indicamos el nombre `geolocation`. Renombramos la carpeta `cubit` recien creada a `06-geolocation`.

Dentro de esta carpeta vemos que hay dos archivos:

- geolocation_cubit.dart
- geolocation_state.dart

Modificamos `geolocation_state.dart` para crear el estado que necesitamos.

Modificamos `geolocation_cubit.dart` para indica la forma en la que queremos que la información fluya.

De nuevo, un Cubit es un Bloc sin eventos.

En `service_locator.dart` creamos nuestro nuevo getIt.

En `main.dart` añadimos el BlocProvider.

### Colocar simuladores en movimiento

En `Ios`, del menú del Simulador seleccionamos `Features > Location > Freeway Drive`. Con esto conseguimos que en los mapas el simulador mueva el punto azul por una carretera, simulando un recorrido.

En `Android`, seleccionar del menú lateral al simulador los tres puntos y del nuevo menú seleccionar `Location`. Seleccionamos la pestaña `Routes` y escribimos, por ejemplo, `Golden Gate`. Para hacer una ruta tocamos el botón indicando el origen y escribimos `Facebook Headquarters`. Pulsamos en `Save Route` e indicamos un nombre cualquiera. Abajo, indicamos una velocidad `Speed 4X` y seleccionamos `Repeat playback`, y por ultimo, pulsamos `Play Route`. Con esto se mueven las coordenadas de Geolocation.

### Permisos y obtener la ubicación

Modificamos `geolocation_cubit.dart` para implementar las funciones que ya habíamos declarado.

También modificamos `service_locator.dart` porque queremos que, tan pronto el bloc se define, vamos a empezar a escuchar los cambios en la localización.

Enseñamos las localizaciones en `screens/06-blocs_with_blocs/blocs_with_blocs_screen.dart`.

### Historic Location Bloc

Vamos a crear un Bloc.

En VSCode, nos posicionamos en la carpeta `blocs`, pulsamos el botón derecho del ratón y seleccionamos `Bloc: New Bloc` y le damos el nombre `historic_location`.

Nos crea la carpeta `bloc`, que renombramos a `07-historic_location`.

Vemos que también nos ha creado los siguientes archivos, ordenados desde el primero que modifico al último:

- historic_location_state.dart: como quiero que fluya mi información
- historic_location_event.dart: son formas estandarizadas en las que cambiamos el estado. En vez de cambiar el estado en el Bloc directamente, generamos un evento que va a ser recibido por el archivo historic_location_bloc, y este, basado en el nuevo evento, genera un nuevo estado
- historic_location_bloc.dart: donde escuchamos los eventos

En `service_locator.dart` creamos nuestro nuevo getIt.

En `main.dart` añadimos el BlocProvider.

### Comunicación entre Blocs

En este enlace se indica como hacer la comunicación bloc a bloc: `https://bloclibrary.dev/architecture/#bloc-to-bloc-communication`.

Queremos insertar en `historic_location_state.dart` todas las localizaciones de `geolocation_state.dart`. Para ello, necesitamos comunicar estos dos blocs.

Podríamos inyectar el bloc de geolocation en historic. Pero no es necesario mandar todo el bloc (en este ejemplo al menos, cada caso es diferente).

Lo que vamos a hacer es hacer que geolocation, si cambia, notifique a historic de alguna manera. En concreto, lanzando un evento.

Para evitar el acoplamiento entre blocs vamos a crear en `historic_location_bloc.dart` un método que vamos a terminar exponiendo.

Modificamos también `geolocation_cubit.dart` para inyectar una dependencia. Esta dependencia es el método que hemos creado en `historic_location_bloc.dart`. Llamamos a ese método cuando tenemos un nuevo valor de localización.

En nuestro `service_locator.dart` tenemos que pasar este método a `GeolocationCubit()`.

### Mostrar listado de ubicaciones

Creamos un getter en `historic_location_state.dart` para saber cuántos puntos tengo insertados en nuestro listado de ubicaciones.

Modificamos `screens/06-blocs_with_blocs/blocs_with_blocs_screen.dart`.

## Inconvenientes de Bloc

Está pensado para trabajar con una instancia de un Bloc. Se puede crear más de una instancia, por ejemplo usando getIt para tener instancia 1 e instancia 2, o duplicar el state para tenerlo dos veces... El caso es que hay que pensar porque no es tan fácil. 
