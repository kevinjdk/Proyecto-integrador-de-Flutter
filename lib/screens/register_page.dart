import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String nombreUsuario = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

  void onRegister() {
    if (_formKey.currentState!.validate()) {
      // Handle registration logic
      print('Registering user with $nombreUsuario, $email, $password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/fondo.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Color(0xFFE2ECEC).withOpacity(0.9), // Fondo semitransparente
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: SingleChildScrollView(
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
                              'Crear cuenta',
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
                              labelText: 'Nombre de Usuario',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor ingrese su nombre de usuario';
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
                            decoration: InputDecoration(
                              labelText: 'Correo Electrónico',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor ingrese su correo electrónico';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                email = value;
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
                          SizedBox(height: 10.0),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Confirmar Contraseña',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor confirme su contraseña';
                              }
                              if (value != password) {
                                return 'Las contraseñas no coinciden';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                confirmPassword = value;
                              });
                            },
                          ),
                          SizedBox(height: 20.0),
                          ElevatedButton(
                            onPressed: onRegister,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(78, 53, 53, 0.4),
                              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                            ),
                            child: Text(
                              'Registrar',
                              style: TextStyle(fontSize: 16.0, color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          TextButton(
                            onPressed: () {
                              // Navegar de regreso a la página de inicio de sesión
                              Navigator.pop(context);
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Color.fromRGBO(78, 53, 53, 0.4),
                              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                            ),
                            child: Text(
                              'Volver',
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
          ),
        ),
      ),
    );
  }
}