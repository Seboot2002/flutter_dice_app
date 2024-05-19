import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:dice_app/pages/credits.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int leftDiceNumber = 1;
  var rightDiceNumber = 1;
  bool _isEnlarged = false;
  
  void changeDiceFace(){
    setState(() {
      
      setState(() {
          _isEnlarged = !_isEnlarged;
          // Si el Container está enlarged se resetea a su tamaño original despues de unos milisegundos
          if (_isEnlarged) {
            Future.delayed(const Duration(milliseconds: 400), () { //Tiempo de espera para luego ejecutar la animacion de su tamaño original
              setState(() {
                _isEnlarged = false;
              });
            });
          }
        });
      
      playSound();
      leftDiceNumber = Random().nextInt(6) + 1; //Le sumamos 1 para que sea de 1 a 6
      rightDiceNumber = Random().nextInt(6) + 1;
      debugPrint("Lanzar los dados!");
    });
  }

  Future<void> playSound() async{
    final player = AudioPlayer();
    await player.play(AssetSource("audios/dados.mp3"));
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
          child: Text(widget.title,
            style: const TextStyle(color: Colors.white),
          )
        ),
      ),
      backgroundColor: Colors.red[400],
      body: Column(
        children: <Widget>[

          //CONTAINERS
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            
                //CHILDREN
                const Text("Tap the dice!",
                  style: TextStyle(color: Colors.white),
                ),
                Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    width: _isEnlarged ? 360 : 290,
                    height: _isEnlarged ? 200 : 200,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                              onPressed: () {
                    
                                changeDiceFace();
                                debugPrint(leftDiceNumber.toString());
                              },
                              // ignore: unnecessary_brace_in_string_interps
                              child: Image.asset("assets/images/dice${leftDiceNumber}.png",)
                            ),
                          )
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                              onPressed: () {
                    
                                changeDiceFace();
                                debugPrint(rightDiceNumber.toString());
                              },
                              // ignore: unnecessary_brace_in_string_interps
                              child: Image.asset("assets/images/dice${rightDiceNumber}.png",)
                            ),
                          )
                        ),
                      ],
                    ),
                  ),
                ),
            
              ],
            ),
          ),
          ElevatedButton(onPressed: () {
            
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CreditsPage()),
            );
            debugPrint("Vamos a los creditos");
            }, 
            child: const Text("Credits")
          ),
          const SizedBox(
            height: 12,
          )

        ],
      )
    );
  }
}
