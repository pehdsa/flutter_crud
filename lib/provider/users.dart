import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_crud/data/dummy_users.dart';
import 'package:flutter_crud/models/user.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [ ..._items.values ];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    if(user == null) {
      return;
    }

    // Confere se o id do usário não é nulo nem vazio e se já existe
    if(
      user.id != null && 
      user.id.trim().isNotEmpty && 
      _items.containsKey(user.id)
    ) {
      
      // alterar
      _items.update(user.id, (_) => User(
        id: user.id,
        name: user.name,
        email: user.email,
        avatarUrl: user.avatarUrl,
      ));      
;
    } else {
      
      // adicionar  
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(id, () => User(
        id: id,
        name: user.name,
        email: user.email,
        avatarUrl: user.avatarUrl
      ));

    }
    
    // um listener que vai mudar a interface gráfica toda ve que houver uma mudançca
    notifyListeners(); 

  }

  void remove(User user) {
    if(user != null && user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }

}