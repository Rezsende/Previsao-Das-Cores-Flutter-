import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Números Aleatórios',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> numeroLista = [];
  List<Widget> wi =[];
  int numeroAleatorio = 0;
  Color corDoTexto = Colors.black;
  int segundosFaltando = 10;
CircleAvatar circulo = CircleAvatar();
  @override
  void initState() {
    super.initState();
    for (int i = 1; i <= 1000; i++) {
      numeroLista.add(i);
      
    }
    Timer.periodic(Duration(seconds: 10), (timer) {
      setState(() {
        numeroAleatorio = numeroLista[Random().nextInt(numeroLista.length)];

        corDoTexto = numeroAleatorio % 2 == 0 ? Colors.red : Colors.blue;

        circulo = numeroAleatorio % 2 == 0 ? CircleAvatar( backgroundColor: Colors.red,) : CircleAvatar(backgroundColor: Colors.blue,);
        segundosFaltando = 10;
          wi.add(circulo);
        
       
      });
    });
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        segundosFaltando--;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clone do Color wiz'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox( height: 20,),
            Text(
              'Numero aleatório é: $numeroAleatorio',
              style: TextStyle(fontSize: 24, color: corDoTexto),
            ),
            SizedBox(height: 16),
            Text(
              'Tempo: $segundosFaltando',
              style: TextStyle(fontSize: 24),
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 24,
              child: circulo,
            ),
              SizedBox(height: 20,),
            Divider(height: 1, color: Colors.grey,), 


          Expanded(
              child: Container(color: Colors.white,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 60,
                  childAspectRatio: 2/2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 1,
                  ),
                itemCount: wi.length,
                itemBuilder:
                  
                 (context, index){
                final circulo = wi[index];
                print(circulo);
               

                 return CircleAvatar(
                    backgroundColor: Colors.white,
                    child: circulo,);
                  
                
                }),
              
              ),
            )



            // Expanded(
            //   child: Container(color: Colors.black,
            //   child: ListView.builder(
                
            //     itemCount: wi.length,
            //     itemBuilder:
                  
            //      (context, index){
            //     final circulo = wi[index];
               

            //      return Padding(
                    
            //        padding: const EdgeInsets.all(5.0),
            //        child: Column(
                     
            //          crossAxisAlignment: CrossAxisAlignment.start,
            //          children: [
                      
            //            CircleAvatar(child: circulo,),
            //          ],
            //        ),
            //      );
                  
                
            //     }),
              
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
