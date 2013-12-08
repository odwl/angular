library pirate;

import 'package:angular/angular.dart';
import 'dart:math' show Random;

@NgComponent(
    selector: 'pirate',
    publishAs: 'ctrl',
    cssUrl: 'packages/pirate/pirate/pirate.css',
    templateUrl: 'packages/pirate/pirate/pirate.html'
    )
class PirateComponent {
  static const DEFAULT =  'Add Olivier';
  
  int count = 0;
  
  String pirateNameInput = '';
  bool get isDisabled => !_isInputEmpty;
  String get buttonText => _isInputEmpty ? DEFAULT :"Done";
  PirateName get pirate => new PirateName(firstName: pirateNameInput);

  bool get _isInputEmpty => pirateNameInput.trim().isEmpty;

  void buttonClicked() {
    pirateNameInput = "Olivier";
    count++;
  }
}

class PirateName {
  static final Random indexGen = new Random();
  String _firstName;
  String _appellation;
  
  static final List names = [
                             'Anne', 'Mary', 'Jack', 'Morgan', 'Roger',
                             'Bill', 'Ragnar', 'Ed', 'John', 'Jane' ];
  static final List appellations = [
    'Black','Damned', 'Jackal', 'Red', 'Stalwart', 'Axe',
    'Young', 'Old', 'Angry', 'Brave', 'Crazy', 'Noble'];
  
  PirateName({String firstName, String appellation}) {
    if (firstName == null) {
      _firstName = names[indexGen.nextInt(names.length)];
    } else {
      _firstName = firstName;
    }
    if (appellation == null) {
      _appellation = appellations[indexGen.nextInt(appellations.length)];
    } else {
      _appellation = appellation;
    }
  }
  
  String get pirateName {
    return  _firstName.isEmpty ? '' : '$_firstName the $_appellation';
  }
}


