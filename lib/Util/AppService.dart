import 'package:fluff/Util/DataHandler.dart';

class AppService {
  static final storage = DataHandler();

  static final AppService _instance = AppService();

  static  void doSomething(msg){
    print('${DateTime.now()} : $msg');
  }

  // passes the instantiation to the _instance object
  factory AppService() => _instance;

}