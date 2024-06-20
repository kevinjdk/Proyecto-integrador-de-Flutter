import 'package:flutter/material.dart';
import 'package:menu_drawer/screens/profile_page.dart';
import 'package:carousel_slider/carousel_slider.dart';


class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item('images/item1.jpg', 'Pantalon', 'Pantalón Cargo - Negro'),
    Item('images/item2.jpg', 'Camisa', 'Camisa Manga Larga - Jean'),
    Item('images/item3.jpg', 'Chaqueta', 'Chaqueta de Cuero - Negro'),
    Item('images/item4.jpg', 'Vestido', 'Vestido Largo - Azul'),
    Item('images/item5.jpg', 'Falda', 'Falda Campana - Celeste'),
    Item('images/item6.jpg', 'Short', 'Short de playa - Verde'),
  ];
   Widget _buildCarousel() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: [
        'assets/img/banner1.png',
        'assets/img/banner2.jpg',
        'assets/img/banner3.jpg',
      ].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Image.asset(
                i,
                fit: BoxFit.cover,
              ),
            );
          },
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('images/logoshop.png', height: 60),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 110, 93, 93),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Drawer Header',
                style: TextStyle(color: Colors.grey),
              ),
              decoration: BoxDecoration(
                color: Colors.grey[800],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.grey[800]),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                // Navegar a la pantalla de inicio (actual)
              },
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.grey[800]),
              title: Text('Perfil'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/profile'); // Navegar a la página de perfil
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_bag, color: Colors.grey[800]), // Cambié el ícono aquí
              title: Text('Compras'), // Cambié el texto aquí
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/cart'); 
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.red), // Color rojo para el icono
              title: Text('Cerrar sesión', style: TextStyle(color: Colors.red)), // Color rojo para el texto
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/login'); // Navegar a la página de login
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset('images/header_image.jpg', fit: BoxFit.cover, width: double.infinity, height: 200), // Coloca aquí tu imagen
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InfoCard(
                    icon: Icons.lock,
                    title: 'COMPRA SEGURA',
                    description: 'Tu compra siempre será 100% segura en nuestro sitio',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Colección de Ropa',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.75, // Adjusted to make images larger
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(item.imagePath),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      item.title,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      item.description,
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  InfoCard({required this.icon, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.blue),
        SizedBox(height: 8),
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Text(description, textAlign: TextAlign.center),
      ],
    );
  }
}


class Item {
  final String imagePath;
  final String title;
  final String description;

  Item(this.imagePath, this.title, this.description);
}
