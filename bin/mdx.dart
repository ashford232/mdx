import 'dart:io';

import 'package:mdx/mdx.dart' as mdx;

Future<void> main(List<String> arguments) async {
  exitCode = await mdx.run(arguments);
}
