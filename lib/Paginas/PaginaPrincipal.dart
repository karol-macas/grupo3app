import 'package:flutter/material.dart';
import 'package:grupo3app/Paginas/Ejercicio1.dart';
import 'package:grupo3app/Paginas/Ejercicio2.dart';
import 'package:animated_background/animated_background.dart';

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
      appBar: AppBar(
        title: Text(
          'Menu Principal',
          style: TextStyle(color: Colors.indigo, fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange[200],
        elevation: 20,
        shadowColor: Colors.pinkAccent[200],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 710,
              decoration:  BoxDecoration(
                color: Colors.blue,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white70, Colors.yellowAccent],
                ),
              ),
              child: AnimatedBackground(
                behaviour: RandomParticleBehaviour(
                  options: const ParticleOptions(
                    spawnMaxRadius: 18,
                    baseColor: Colors.cyan,

                  )
                ),
                vsync: this,
                child: Column(
                  children: [
                    const SizedBox(height: 150),
                    const Center(
                      child: Text(
                        'Bienvenido',
                        style: TextStyle(fontSize: 70, color: Colors.indigoAccent,
                            fontFamily: 'Pacifico-Regular',),
                      ),
                    ),
                    const SizedBox(height: 100),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
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
                          'Ejercicio1',
                          style: TextStyle(
                            color: _isButton1Tapped ? Colors.black : Colors.pinkAccent,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
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
                          'Ejercicio2',
                          style: TextStyle(
                            color: _isButton2Tapped ? Colors.redAccent : Colors.brown,
                            fontSize: 30,
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
