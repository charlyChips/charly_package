# charly_package

Utilería de uso común para proyectos diversos

## Cómo agregar este paquete a tu proyecto

Agrega lo siguiente a tu pubspec.yaml

```
dependencies:
  flutter:
    sdk: flutter

  charly_package:
    git:
      url: https://github.com/charlyChips/charly_package
      ref: main
```

# Agrega BuildRunner y Freezed

```
flutter pub add dev build_runner
```

```
$ flutter pub add dev json_annotation
```

```
$ flutter pub add freezed
```

```
$ flutter pub add freezed_annotation
```

```
$ flutter pub add json_serializable
```

## MASON BRICKS

Para utilizar los bricks creados primero instala mason en tu proyecto con lo siguiente:

```
$ dart pub global activate mason_cli
$ mason init
```

Luego en el archivo mason.yaml agrega los brics que necesites. (Ver bricks mas abajo)

Luego corre el comando

```
$ mason get
```

Y listo! ya podras utilizar los bricks con el comando

```
$ mason make <el nombre del brick>
```

# BRICKS

### MASON - JsonModel

Sirve para crear todo el boilerplate de un modelo serializado por json_serializable freezed

```
json_model:
    git:
      url: https://github.com/charlyChips/charly_package
      path: bricks/json_model
```
