library click;

import 'package:angular/angular.dart';

@NgComponent(
    selector: 'click',
    publishAs: 'ctrl',
    cssUrl: 'packages/pirate/click/click.css',
    templateUrl: 'packages/pirate/click/click.html'
    )
class ClickComponent {
  String text = "Click me!";
  
  void reverse() {
    text = new String.fromCharCodes(text.runes.toList().reversed);
  }
}


