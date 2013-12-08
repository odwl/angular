library anagram;

import 'package:angular/angular.dart';
import 'dart:math' show Random;

const String scrabbleLetters = 'aaaaaaaaabbccddddeeeeeeeeeeeeffggghhiiiiiiiiijkllllmmnnnnnnooooooooppqrrrrrrssssttttttuuuuvvwwxyyz**';

@NgComponent(
    selector: 'anagram',
    publishAs: 'ctrl',
    cssUrl: 'packages/pirate/anagram/anagram.css',
    templateUrl: 'packages/pirate/anagram/anagram.html'
    )
class AnagramComponent {
  int wordvalue = 0;
  List<String> resultLetters = [];
  List<String> pileLetters = generateNewLetters();
  String selectedLetter;
  
  Map scrabbleValues = { 'a':1, 'e':1, 'i':1, 'l':1, 'n':1,
                         'o':1, 'r':1, 's':1, 't':1, 'u':1,
                         'd':2, 'g':2, 'b':3, 'c':3, 'm':3,
                         'p':3, 'f':4, 'h':4, 'v':4, 'w':4,
                         'y':4, 'k':5, 'j':8, 'x':8, 'q':10,
                         'z':10, '*':0 };
  
  static List<String> generateNewLetters() {
    return new List.from(new Set.from(new List<int>
    .generate(
        7, 
        (_) => new Random().nextInt(scrabbleLetters.length))
          .map((letterIndex) => scrabbleLetters[letterIndex])
            .toList()));
  }
  
  void addLetter(String letter) {
    pileLetters.remove(letter);
    resultLetters.add(letter);
    wordvalue += scrabbleValues[letter];
  }

  void moveLetter(String letter) {
    pileLetters.add(letter);
    resultLetters.remove(letter);
    wordvalue -= scrabbleValues[letter];
  }

  void newletters() {
    resultLetters.clear();
    pileLetters = generateNewLetters();
    wordvalue = 0;
  }
}

@NgComponent(
    selector: 'button-list',
    publishAs: 'ctrl',
    cssUrl: 'packages/pirate/anagram/button-list.css',
    templateUrl: 'packages/pirate/anagram/button-list.html',
    map: const {
      'letters' : '=>letters',
      'letter-selected' :'&letterSelected'
     
    }
)
class ButtonListComponent {
  List<String> letters;
  Function letterSelected;
  
  letterClicked(String letter) {
    letterSelected({'\$letter': letter});
  }
}