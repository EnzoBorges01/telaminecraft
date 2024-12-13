import 'package:flutter/material.dart';

class MinhaConta extends StatefulWidget {
  const MinhaConta({super.key});

  @override
  _MinhaContaState createState() => _MinhaContaState();
}

class _MinhaContaState extends State<MinhaConta> {
  // Variáveis para controlar o estado da seleção dos botões
  bool isProfileEditSelected = false;
  bool isAnonymousModeSelected = false;
  bool isSellItemsSelected = false;
  bool isTradeItemsSelected = false;

  // Variável para armazenar a quantidade de moedas do usuário
  int userCoins = 1500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha Conta'),
        backgroundColor: Colors.green.shade700,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Função para configurações
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cabeçalho com a imagem e nome do usuário
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('https://pm1.aminoapps.com/6685/183ef7e753aae9a1db3af7922c7c4fff5faed4e5_00.jpg'), // Imagem de perfil
                    ),
                    SizedBox(height: 10),
                    Text(
                      'CaxaPreta', // Nome do usuário
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Nível 5 - Aventureiro',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 10),
                    // Exibindo a quantidade de moedas do usuário
                    Text(
                      'Moedas: $userCoins MCoins',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Seção de personalização
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildSelectableItem(
                        icon: Icons.edit,
                        title: 'Editar Perfil',
                        subtitle: 'Personalize seu nome e imagem de perfil',
                        isSelected: isProfileEditSelected,
                        onTap: () {
                          setState(() {
                            isProfileEditSelected = !isProfileEditSelected;
                          });
                        },
                      ),
                      Divider(),
                      _buildSelectableItem(
                        icon: Icons.visibility,
                        title: 'Modo Anônimo',
                        subtitle: 'Ativar/desativar o modo anônimo',
                        isSelected: isAnonymousModeSelected,
                        onTap: () {
                          setState(() {
                            isAnonymousModeSelected = !isAnonymousModeSelected;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Seção de itens comprados
              Text(
                'Itens Comprados',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildSelectableItem(
                        icon: Icons.shopping_basket,
                        title: 'Picareta de Diamante',
                        subtitle: 'Comprado por 500 MCoins',
                        isSelected: false,
                        onTap: () {
                          // Função para detalhes do item
                        },
                      ),
                      _buildSelectableItem(
                        icon: Icons.shopping_basket,
                        title: 'Bloco de Ferro',
                        subtitle: 'Comprado por 100 MCoins',
                        isSelected: false,
                        onTap: () {
                          // Função para detalhes do item
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Seção de vender ou trocar
              Text(
                'Vender ou Trocar Itens',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildSelectableItem(
                        icon: Icons.sell,
                        title: 'Vender Itens',
                        subtitle: 'Venda seus itens para outros jogadores',
                        isSelected: isSellItemsSelected,
                        onTap: () {
                          setState(() {
                            isSellItemsSelected = !isSellItemsSelected;
                          });
                        },
                      ),
                      _buildSelectableItem(
                        icon: Icons.swap_horiz,
                        title: 'Trocar Itens',
                        subtitle: 'Troque itens com outros jogadores',
                        isSelected: isTradeItemsSelected,
                        onTap: () {
                          setState(() {
                            isTradeItemsSelected = !isTradeItemsSelected;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Seção de configurações adicionais
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildSelectableItem(
                        icon: Icons.notifications,
                        title: 'Notificações',
                        subtitle: 'Gerencie suas notificações',
                        isSelected: false,
                        onTap: () {
                          // Função para gerenciar notificações
                        },
                      ),
                      _buildSelectableItem(
                        icon: Icons.security,
                        title: 'Segurança',
                        subtitle: 'Mude sua senha ou verifique a segurança',
                        isSelected: false,
                        onTap: () {
                          // Função para segurança
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Método para construir os itens interativos (ListTiles) com destaque visual
  Widget _buildSelectableItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: isSelected ? Colors.green.shade50 : Colors.transparent, // Alterando o fundo do item selecionado
        child: ListTile(
          leading: Icon(icon, color: isSelected ? Colors.green : Colors.black),
          title: Text(title, style: TextStyle(color: isSelected ? Colors.green : Colors.black)),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}
