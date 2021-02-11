import 'package:flutter/cupertino.dart';

class User {
	final String id;
	final String name;
	final String email;
	final String avatarUrl;

	const User({ 
		this.id,
		@required this.name, //mostra que a classe precisa desse atributo
		@required this.email, //mostra que a classe precisa desse atributo
		@required this.avatarUrl, //mostra que a classe precisa desse atributo
	});

}