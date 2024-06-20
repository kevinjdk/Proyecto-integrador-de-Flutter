import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Perfil',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[800], // Color del app bar
        centerTitle: true, // Centra el título del app bar
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 70,
              // backgroundImage: AssetImage('assets/profile_picture.png'),
            ),
            SizedBox(height: 20),
            Text(
              'Axl_32',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Una descripción del usuario, puede contener información adicional sobre el mismo.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600], // Color del texto gris
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 20),
            Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: Icon(Icons.person, color: Colors.grey[600]), // Icono en gris
                title: Text('Nombre'),
                subtitle: Text('Alex'),
              ),
            ),
            Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: Icon(Icons.person_outline, color: Colors.grey[600]), // Icono en gris
                title: Text('Apellido'),
                subtitle: Text('Benavides'),
              ),
            ),
            Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: Icon(Icons.phone, color: Colors.grey[600]), // Icono en gris
                title: Text('Teléfono'),
                subtitle: Text('09999999'),
              ),
            ),
            Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: Icon(Icons.location_on, color: Colors.grey[600]), // Icono en gris
                title: Text('Ubicación'),
                subtitle: Text('Una ubicación'),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Acción del botón
              },
              icon: Icon(Icons.edit, color: Colors.grey[600]), // Icono en gris
              label: Text('Editar Perfil'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.grey[600], // Cambiado a gris
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                // Acción del botón
              },
              icon: Icon(Icons.logout, color: Color.fromARGB(255, 255, 255, 255)), // Icono en gris
              label: Text('Cerrar Sesión'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red, // Color del texto del botón
              ),
            ),
          ],
        ),
      ),
    );
  }
}
