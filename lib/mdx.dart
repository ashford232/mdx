import 'dart:io';

import 'package:mdx/src/directory_helper.dart';
import 'package:mdx/src/options.dart';

Future<int> run(List<String> arguments) async {
  if (arguments.contains('--help') || arguments.contains('-h')) {
    print(helpMessage);
    return 0;
  }
  if (arguments.contains('--version') || arguments.contains('-v')) {
    print('$appName $appVersion');
    return 0;
  }

  if (arguments.isEmpty) {
    stderr.writeln('mdx: missing operand');
    stderr.writeln('Try \'mdx --help\' for more information.');
    return 2;
  }
  var exitCode = 0;
  for (final path in arguments) {
    try {
      await createDirectory(path);
      print('mdx: created: $path');
    } on FileSystemException catch (err) {
      stderr.writeln('mdx: ${err.message}: $path');
      exitCode = 1;
    }
  }
  return exitCode;
}
