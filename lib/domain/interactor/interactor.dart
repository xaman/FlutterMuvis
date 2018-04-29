import 'dart:async';


abstract class Interactor<T> {

  Future<T> execute();

}