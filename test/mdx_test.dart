import 'dart:io';

import 'package:mdx/mdx.dart';
import 'package:test/test.dart';

void main() {
  group('MDX', () {
    test('returns 2 when no arguments are provided', () async {
      expect(await run([]), 2);
    });

    test('returns 0 when help is requested', () async {
      expect(await run(['--help']), 0);
    });

    test('returns 0 when version is requested', () async {
      expect(await run(['--version']), 0);
    });

    test('creates a directory successfully', () async {
      final path = 'test_directory';

      expect(await run([path]), 0);

      expect(Directory(path).existsSync(), isTrue);

      Directory(path).deleteSync();
    });

    test('returns 1 when directory already exists', () async {
      final directory = Directory('existing_directory');

      directory.createSync();

      expect(await run(['existing_directory']), 1);

      directory.deleteSync();
    });
  });
}
