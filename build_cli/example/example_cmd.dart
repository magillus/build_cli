import 'package:build_cli_annotations/build_cli_annotations.dart';

// part 'example_cmd.g.dart'; uncomment after full builder generation

@CliCommand('test')
class TestCommand {
  @CliOption(abbr: 'p', help: 'Required. Port for connection.')
  final int port;
  TestCommand(this.port, {this.helpSubCommand});

  HelpCommand helpSubCommand;
}

@CliCommand('help')
class HelpCommand {
  String phrase;
  HelpCommand(this.phrase);
}

/// GENERATED code would look like this.
///
TestCommand parseTestCommand(List<String> args) {
  final parser = ArgParser();

  parser.addCommand('test').addOption(
        'port',
        abbr: 'p',
        help: 'Required. Port for connection',
      );

  final parsedArgs = parser.parse(args);

  return TestCommand(int.parse(parsedArgs.command['port'].toString()))
    ..helpSubCommand = parseHelpCommand(parsedArgs.command.rest);
}

/// GENERATED code
HelpCommand parseHelpCommand(List<String> args) {
  print('parsing: $args');
  final parser = ArgParser().addCommand('help');
  final parsedArgs = parser.parse(args);
  print('phrase= ${parsedArgs.command.rest.first}');
  return HelpCommand(parsedArgs.command.rest.first);
}

/// USAGE
void main(List<String> args) {
  final cmd = parseTestCommand(args);

  print('cmd first : test port = ${cmd.port}');
  print('cmd second: help = ${cmd?.helpSubCommand?.phrase}');
}
