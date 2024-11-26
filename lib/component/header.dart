
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget{

  String getDate(String mode){
    final now = DateTime.now();
    return '$mode ${now.year}-${now.month}-${now.day} ';
  }
  

  @override
  Widget build(BuildContext context) {

    return Flexible(
      child: Consumer<HeaderModel>(
        builder: (context,headerModel,child) => AppBar(
          title: Text(getDate(headerModel._mode)),
        )
      )
    );
  }

}

class HeaderModel extends ChangeNotifier {
  String _mode = "MODE";

  void changeMode(String mode){
    _mode = mode;
    notifyListeners();
  }
}
//TODO stateful 이랑 changeNotifier 랑 어캐 쓸지 
// stateFul 은 내부에서 setState함수를 통해 내부에 changeNotify를 실행
// ChangeNotifier는 외부에서도 값 변경할떄 쓰나보다