# MDX

A simple directory creation utility for Windows, written in Dart.

Inspired by Unix `mkdir`.

## Features

- Create directories.
- Create multiple directories in one command.
- Simple command-line interface.
- Helpful error messages.
- Built-in help and version information.

## Installation

**Windows**

Download the latest `MDX-Setup.exe` from the [Releases](https://github.com/ashford232/mdx/releases) page.

Run the installer and follow the instructions.

After installation, open PowerShell or Command Prompt and use `mdx` from any directory.

*Windows installer coming soon.*

## Usage

Create a directory:

```powershell
mdx documents
```

Create multiple directories:

```powershell
mdx documents images videos
```

Display help:

```powershell
mdx --help
```

Display version:

```powershell
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

MIT