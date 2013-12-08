library stopwatch;

import 'package:angular/angular.dart';
import 'dart:async';

@NgComponent(
    selector: 'stopwatch',
    publishAs: 'ctrl',
    cssUrl: 'packages/pirate/stopwatch/stopwatch.css',
    templateUrl: 'packages/pirate/stopwatch/stopwatch.html'
)
class StopWatchComponent {
  static const DEFAULT = '00:00';
  var oneSecond = new Duration(seconds:1);
  
  String counter = DEFAULT;
  bool startDisabled = false;
  bool get resetDisabled => counter ==  DEFAULT;
  
  Stopwatch mywatch = new Stopwatch();
  Timer mytimer;
  
  void start() {
    mywatch.start();
    mytimer = new Timer.periodic(oneSecond, updateTime);
    startDisabled = true;
  }
  
  void stop() {
    mywatch.stop();
    mytimer.cancel();
    startDisabled = false;
  }
  
  void reset() {
    mywatch.reset();
    counter = DEFAULT;
  }
  
  void updateTime(Timer _) {
    var s = mywatch.elapsedMilliseconds~/1000;
    var m = 0;
    
    // The operator ~/ divides and returns an integer.
    if (s >= 60) { m = s ~/ 60; s = s % 60; }
      
    String minute = (m <= 9) ? '0$m' : '$m';
    String second = (s <= 9) ? '0$s' : '$s';
    counter = '$minute:$second';
  }
}