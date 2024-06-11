import 'package:flutter/material.dart';
import 'package:grupo3app/Paginas/Ejercicio1.dart';
import 'package:grupo3app/Paginas/Ejercicio2.dart';
import 'package:animated_background/animated_background.dart';
import 'CustomAppBar.dart';

class PaginaPrincipal extends StatefulWidget {
  @override
  _PaginaPrincipalState createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal>
    with SingleTickerProviderStateMixin {
  bool _isButton1Tapped = false;
  bool _isButton2Tapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'MENU PRINCIPAL',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 710,
              decoration: const BoxDecoration(
                color: Colors.blue,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white70, Color.fromARGB(215, 235, 63, 112)],
                ),
              ),
              child: AnimatedBackground(
                behaviour: RandomParticleBehaviour(
                    options: const ParticleOptions(
                  spawnMaxRadius: 18,
                  baseColor: Color.fromARGB(255, 119, 20, 225),
                )),
                vsync: this,
                child: Column(
                  children: [
                    const SizedBox(height: 150),
                    const Center(
                      child: Text(
                        'Bienvenido',
                        style: TextStyle(
                          fontSize: 70,
                          color: Color.fromARGB(255, 68, 13, 217),
                          fontFamily: 'Pacifico-Regular',
                        ),
                      ),
                    ),
                    const SizedBox(height: 100),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.cyan,
                          width: 3,
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isButton1Tapped = !_isButton1Tapped;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Ejercicio1(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Ejercicio 1',
                          style: TextStyle(
                            color: _isButton1Tapped
                                ? Colors.black
                                : Colors.pinkAccent,
                            fontSize: 30,
                            fontFamily: "OleoScript",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.orange,
                          width: 3,
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isButton2Tapped = !_isButton2Tapped;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Ejercicio2(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Ejercicio 2',
                          style: TextStyle(
                            color: _isButton2Tapped
                                ? Colors.redAccent
                                : Colors.brown,
                            fontSize: 30,
                            fontFamily: "OleoScript",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PaginaPrincipal(),
  ));
}
