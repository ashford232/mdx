# MDX

A simple directory creation command-line utility written in Dart.

Inspired by Unix `mkdir`, MDX makes creating directories from your terminal straightforward.

## Features

- Create directories.
- Create multiple directories in one command.
- Simple command-line interface.
- Helpful error messages.
- Built-in help and version information.
- Standalone Windows installer.

## Installation

### Dart Developers

Install MDX globally using Dart:

```bash
dart pub global activate mdx
```

You can then run MDX using:

```bash
mdx documents
```

If your terminal cannot find the `mdx` command, make sure Dart's Pub cache `bin` directory is added to your PATH.

### Windows Users

Don't have Dart installed? No problem.

Download the latest **MDX Windows Installer** from the [GitHub Releases](https://github.com/ashford232/mdx/releases) page.

1. Download `MDX-Setup-0.1.0.exe`.
2. Run the installer.
3. Follow the installation instructions.
4. Open a new terminal and start using MDX.

No Dart SDK or manual configuration required.

## Usage

Create a directory:

```bash
mdx documents
```

Create multiple directories:

```bash
mdx documents images videos
```

Display help:

```bash
mdx --help
```

Display version:

```bash
mdx --version
```

## Development

Clone the repository:

```bash
git clone https://github.com/ashford232/mdx.git
cd mdx
```

Install dependencies:

```bash
dart pub get
```

Run tests:

```bash
dart test
```

Run MDX locally:

```bash
dart run bin/mdx.dart documents
```

## License

MDX is released under the [MIT License](LICENSE).

---

**Developed by Room06Tech.**