import 'package:dice_app/widgets/card.dart';
import 'package:flutter/material.dart';

class CreditsPage extends StatefulWidget {
  const CreditsPage({super.key});

  @override
  State<CreditsPage> createState() => _CreditsPageState();
}

class _CreditsPageState extends State<CreditsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          }),
        backgroundColor: Colors.teal,
        title: const Text("Credits",
        style: TextStyle(color: Colors.white),),
      ),
      backgroundColor: Colors.teal,
      body: const SafeArea(
        child: Center(
          child: Column(
            children: [

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                
                    //CHILDREN
                    CircleAvatar(
                      radius: 60,
                      //backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/images/dice1.png"),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text("Sebastián Camayo",
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white
                      ),
                    ),
                    SizedBox(
                      height: 9.0,
                    ),
                    Text("I enjoy programming",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white
                      ),
                    ),
                    SizedBox(
                      height: 14.0,
                    ),
                    SizedBox(
                      height: 12.0,
                      width: 150.0,
                      child: Divider(
                        color: Color.fromARGB(255, 177, 223, 219),
                      ),
                    ),
                    SizedBox(
                      height: 9.0,
                    ),

                    //CUADRADOS
                    CardWidget(text: "sebas.camayo2002@gmail.com", icon: Icons.email),
                    CardWidget(text: "+51 934433503", icon: Icons.phone),
                
                  ],
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Text("Mobile developer",
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.white
                ),
              ),
              SizedBox(
                  height: 18.0,
              ),

            ],
          ),
        ),
        
      )
    );
  }
}