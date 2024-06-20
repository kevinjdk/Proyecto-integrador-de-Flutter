import 'package:flutter/material.dart';
import 'package:menu_drawer/screens/register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String nombreUsuario = '';
  String password = '';

  void onLogin() {
    if (_formKey.currentState!.validate()) {
      // Handle login logic
      print('Logging in with $nombreUsuario and $password');

      // Navegar de regreso a la pantalla principal
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'images/fondo.jpg', // Asegúrate de tener la imagen en esta ruta
            fit: BoxFit.cover,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              margin: EdgeInsets.symmetric(vertical: 50.0),
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Color(0xFFE2ECEC).withOpacity(0.9), // Fondo semitransparente
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 20.0),
                    child: Image.asset(
                      'images/logoshop.png',
                      height: 70.0, // Ajusta la altura según sea necesario
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(78, 53, 53, 0.4),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text(
                            'Iniciar sesión',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Correo electrónico / Usuario',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese su usuario o correo electrónico';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              nombreUsuario = value;
                            });
                          },
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese su contraseña';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                        ),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: onLogin,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(78, 53, 53, 0.4), // Color de fondo
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          ),
                          child: Text(
                            'Entrar',
                            style: TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        InkWell(
                          onTap: () {
                            // Manejar la lógica de olvido de contraseña
                            print('Forgot password');
                          },
                          child: Text(
                            '¿Olvidó su contraseña?',
                            style: TextStyle(
                              color: Color(0xFF90ADB6),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RegisterPage()),
                            );  // Navegar a la página de registro
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Color.fromRGBO(78, 53, 53, 0.4),
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          ),
                          child: Text(
                            'Crear cuenta',
                            style: TextStyle(fontSize: 16.0, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
