import 'package:angular/angular.dart';
import 'package:pirate/anagram/anagram.dart';
import 'package:pirate/click/click.dart';
import 'package:pirate/pirate/pirate.dart';
import 'package:pirate/stopwatch/stopwatch.dart';

void main() {
  ngBootstrap(module: new MyAppModule());
}

class MyAppModule extends Module {
  MyAppModule() {
    type(ClickComponent);
    type(PirateComponent);
    type(AnagramComponent);
    type(ButtonListComponent);
    type(StopWatchComponent);
  }
}

