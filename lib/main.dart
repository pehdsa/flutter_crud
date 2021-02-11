import 'package:flutter/material.dart';
import 'package:flutter_crud/views/user_list.dart';
import 'package:flutter_crud/views/user_form.dart';
import 'package:provider/provider.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:flutter_crud/routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
	@override
	Widget build(BuildContext context) {
		return ChangeNotifierProvider(
      create: (ctx) => Users(),
		  child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: AppRoutes.HOME,
        routes: {
          AppRoutes.HOME: (ctx) => UserList(),
          AppRoutes.USER_FORM: (ctx) => UserForm()
        },
        //home: UserList(),
      ),		  
		);
	}
}