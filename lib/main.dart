import 'package:flutter/material.dart';
import 'package:menu_drawer/screens/cart_screen.dart';
import 'package:menu_drawer/screens/home_page.dart';
import 'package:menu_drawer/screens/login_page.dart';
import 'package:menu_drawer/screens/profile_page.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: const Color.fromARGB(255, 255, 255, 255),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.grey,
        ).copyWith(
          secondary: Colors.grey[600],
        ),
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      initialRoute: '/', // Ruta inicial
      routes: {
        '/': (context) => HomePage(), // Ruta de inicio
        '/login': (context) => LoginPage(), // Ruta de inicio de sesión
        '/profile': (context) => ProfilePage(), // Ruta de perfil
        '/cart': (context) => CartScreen()
        // Agrega otras rutas aquí si es necesario
      },
    );
  }
}
