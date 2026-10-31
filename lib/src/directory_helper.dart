import 'dart:io';

Future<void> createDirectory(String path) async {
  final directory = Directory(path);
  if (await directory.exists()) {
    throw FileSystemException('Directory exists', path);
  }
  await directory.create(recursive: true);
}
