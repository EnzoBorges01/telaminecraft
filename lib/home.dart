import 'package:flutter/material.dart';
import 'package:telaminecraft/pedidos.dart';
import 'tela_login_inicial.dart'; // Importando TelaPrincipal
import 'minhaconta.dart'; // Importando Minha Conta

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int indiceAtual = 0; // Inicializa como 0, que é a posição de Meus Pedidos
  String nomePaginaAppBar = 'Home';

  List<Widget> telas = [
    MeusPedidos(),  // Tela de pedidos
    MinhaConta(),   // Tela da conta
  ];

  void quandoClicar(int index) {
    setState(() {
      indiceAtual = index;
      if(index == 0)
        nomePaginaAppBar = 'Meus Pedidos';
      else if(index == 1)
        nomePaginaAppBar = 'Minha Conta';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: telas[indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(fontFamily: 'Minecraft', fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontFamily: 'Minecraft'),
        backgroundColor: Colors.green[700], // Um verde mais suave para o BottomNavigationBar
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        currentIndex: indiceAtual,
        onTap: quandoClicar,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Meus pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Minha conta',
          ),
        ],
      ),
    );
  }
}
