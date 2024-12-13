import 'package:flutter/material.dart';
import 'tela_login_inicial.dart';
import 'pedidos.dart';
import 'minhaconta.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MeuApp(),
  ));
}

class MeuApp extends StatefulWidget {
  @override
  State<MeuApp> createState() => _MeuAppState();
}

class _MeuAppState extends State<MeuApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Cor de fundo principal
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.green.shade500, // Tom escuro
                  Colors.green, // Tom médio
                  Colors.green.shade900, // Tom claro
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Card com a Tela Principal
          Padding(
            padding: const EdgeInsets.all(16.0), // Padding para o conteúdo
            child: Column(
              children: [
                Expanded(
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.green.shade600, // Verde escuro
                            Colors.green.shade300, // Verde médio
                            Colors.green.shade600, // Verde claro

                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: TelaPrincipal(), // Substitua pela sua tela principal
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
