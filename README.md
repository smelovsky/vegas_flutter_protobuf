# vegas_flutter_protobuf

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Terminal command to create person.g.dart
dart run build_runner build

## Steps to create model.pb.dart,model.pbenum.dart,model.pbjson.dart

1. Copy protoc_plugin-21.1.2 from C:\Users\msmelovsky\AppData\Local\Pub\Cache\hosted\pub.dev\protoc_plugin-21.1.2\ to any local folder
3. Create <local folder>\protoc_plugin-21.1.2\bin\vegas_flutter_protobuf\proto folder
4. Place model.proto to <local folder>\protoc_plugin-21.1.2\bin\vegas_flutter_protobuf\proto folder
5. Go to <local folder>\protoc_plugin-21.1.2\bin\
6. Execute next command 
protoc --dart_out=./ ./vegas_flutter_protobuf/proto/model.proto

