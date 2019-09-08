import 'dart:collection';
import 'dart:convert';

class globals{
  static List<String> parse(String s){
    final decoded = json.decode(s);
    print(decoded);
  }
}