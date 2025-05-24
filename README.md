# flutter_university


App para generar una lista de universidades

## Tecnologías y/o paquetes del proyecto

- Flutter: 3.27.4
- get_it: 8.0.3
- dio: 5.8.0
- go_router: 14.8.1
- flutter_riverpod: 2.6.1
- url_launcher: 6.3.1
- cupertino_icons: 1.0.8
- freezed: 2.4.7
- json_serializable: 6.8.0
- build_runner: 2.4.9
- image_picker: ^1.1.2

## Estructura de carpetas
La siguiente estructura de carpetas, se realiza pensando en que es un proyecto que va a crecer de manera constante y acelerada; por ende, se propone tener capas lo mas aisladas posibles en dónde quienes hacen de "puentes" entre cada capa son los puertos; adicional si se requiere diseñar y ejecutar test, estos se pueden hacer en la capa que corresponde y no dependen de un archivo global o único dentro del proyecto

```bash
.
└── lib/
    ├── main.dart
    └── src/
        ├── adapters/
        │   └── lib/
        │       ├── shared/
        │       │   └── http
        │       └── university_adapter/
        │           ├── adapter
        │           ├── datasource
        │           └── mappers
        |
        ├── business/
        │   ├── domain/
        │   │   └── lib/
        │   │       └── university_doamin
        │   ├── ports/
        │   │   ├── in_ports/
        │   │   │   └── lib/
        │   │   │       └── university_in_ports
        │   │   └── out_ports/
        │   │       └── lib/
        │   │           └── university_out_ports
        │   └── use_cases/
        │       └── lib/
        │           └── university_use_cases
        |
        ├── configs/
        │   ├── getIt
        │   └── router_config
        |
        ├── di/
        │   └── lib/
        │       ├── adapters_di.dart
        │       ├── business_di.dart
        │       └── setup_di.dart
        |
        └── presentation/
            └── lib/
                ├── modules/
                │   └── university_module/
                │       ├── pages
                │       ├── package.dart
                │       └── router.dart
                ├── providers
                └── shared/
                        ├── utils
                        ├── templates
                        └── widgets

```

## Paso para ejecutar el proyecto

- Clonar el repositorio
- Abrir el proyecto desde el editor de código
- Abrir la terminal y ubicarse en la raiz del proyecto
- Ejecutar el **flutter pub get** de los yaml con el siguiente comando:

```shell
 find . -name "pubspec.yaml" -execdir flutter pub get \;
```

## ⚠️ ¿Que se debe hacer si el comando anterior no funciona?

Debes ingresar a cada capa y ejecutar el **flutter pub get** en cada pubspec.yaml

### A continuación te muestro la ruta a dónde debes ir

- pubspeck.yaml
- lib/src/adapters/pubspeck.yaml
- lib/src/business/domain/pubspeck.yaml
- lib/src/business/ports/in_ports/pubspeck.yaml
- lib/src/business/ports/out_ports/pubspeck.yaml
- lib/src/business/use_cases/pubspeck.yaml

## Serilización de modelos

Es necesario serializar el modelo del reponse en la capa **ADAPTERS**.
Para ello, se debe navegar a la siguiente ruta:

```shell
 lib/src/adapters/pubspeck.yaml
```

Una vez se está ubicado en la capa de **ADAPTERS** se debe ejecutar el siguiente comando para serilizar

```shell
flutter pub run build_runner build --delete-conflicting-outputs
```

Cuando finaliza la serialización del modelo se debe visualizar dos archivos asi:
**list_university_dto.freezed.dart**
**list_university_dto.g.dart**
