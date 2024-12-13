import 'package:flutter/material.dart';

class MeusPedidos extends StatefulWidget {
  @override
  _MeusPedidosState createState() => _MeusPedidosState();
}

class _MeusPedidosState extends State<MeusPedidos> {
  // Lista simulada de pedidos
  final List<Map<String, dynamic>> _pedidos = [
    {
      'imageUrl': 'https://example.com/image1.jpg',
      'title': 'Bloco de Diamante "de Pelúcia"',
      'description': 'Bloco de diamante macio, ideal para decoração.',
      'price': '150 MCoins',
      'isAnonymous': true,
      'isPhysicalItem': true,
    },
    {
      'imageUrl': 'https://example.com/image2.jpg',
      'title': 'Luminária Creeper',
      'description': 'Luminária LED em formato de Creeper.',
      'price': '200 MCoins',
      'isAnonymous': false,
      'isPhysicalItem': true,
    },
    {
      'imageUrl': 'https://example.com/image3.jpg',
      'title': 'Camiseta "Explorador de Minas"',
      'description': 'Camiseta de minerador no Minecraft.',
      'price': '80 MCoins',
      'isAnonymous': false,
      'isPhysicalItem': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Meus Pedidos'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), // Volta para a tela anterior
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: _pedidos.length,
        itemBuilder: (context, index) {
          var pedido = _pedidos[index];
          return _buildItemCard(pedido); // Chama a função para construir o cartão de cada pedido
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showPublishDialog, // Abre o diálogo de publicação
        backgroundColor: Colors.green,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  // Função que cria um cartão para cada pedido
  Widget _buildItemCard(Map<String, dynamic> pedido) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () {
          // Navega para a tela de detalhes do item
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ItemDetailsScreen(pedido: pedido),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      pedido['imageUrl'],
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 100,
                          height: 100,
                          color: Colors.grey[300],
                          child: Center(child: Icon(Icons.broken_image)),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pedido['title'],
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          pedido['price'],
                          style: TextStyle(fontSize: 16, color: Colors.green.shade800),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          pedido['isAnonymous'] ? 'Vendedor: Anônimo' : 'Vendedor: Público',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Botões de ação
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Ação de comprar
                      _showBuyDialog(pedido); // Exibe um diálogo de confirmação de compra
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // Cor do botão
                      onPrimary: Colors.white, // Cor do texto
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text('Comprar'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      // Ação de adicionar oferta
                      _showOfferDialog(pedido); // Exibe um diálogo para adicionar uma oferta
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.green),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text('Adicionar Oferta', style: TextStyle(color: Colors.green)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Função para exibir o diálogo de compra
  void _showBuyDialog(Map<String, dynamic> pedido) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmar Compra'),
          content: Text('Deseja comprar o ${pedido['title']} por ${pedido['price']}?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Fecha o diálogo
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Fecha o diálogo após a compra
                _showSuccessDialog();
              },
              child: Text('Comprar'),
            ),
          ],
        );
      },
    );
  }

  // Função para exibir o diálogo de sucesso após a compra
  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Compra Realizada!'),
          content: Text('Sua compra foi realizada com sucesso.'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context), // Fecha o diálogo
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Função para exibir o diálogo de adicionar oferta
  void _showOfferDialog(Map<String, dynamic> pedido) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Adicionar Oferta para ${pedido['title']}'),
          content: TextField(
            decoration: InputDecoration(labelText: 'Preço da Oferta'),
            keyboardType: TextInputType.number,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Fecha o diálogo
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Fecha o diálogo após adicionar a oferta
              },
              child: Text('Adicionar Oferta'),
            ),
          ],
        );
      },
    );
  }

  // Função para exibir o diálogo de publicação de novo pedido
  void _showPublishDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Publicar Novo Pedido'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(decoration: InputDecoration(labelText: 'Título do Produto')),
              TextField(decoration: InputDecoration(labelText: 'Descrição')),
              TextField(decoration: InputDecoration(labelText: 'Preço')),
              TextField(decoration: InputDecoration(labelText: 'URL da Imagem')),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Fecha o diálogo
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Fecha o diálogo após publicar
              },
              child: Text('Publicar'),
            ),
          ],
        );
      },
    );
  }
}

class ItemDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> pedido; // Recebe os dados do pedido

  const ItemDetailsScreen({required this.pedido});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(pedido['title']),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), // Volta para a tela anterior
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  pedido['imageUrl'],
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: double.infinity,
                      height: 250,
                      color: Colors.grey[300],
                      child: Center(child: Icon(Icons.broken_image)),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Text(
                pedido['title'],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal),
              ),
              SizedBox(height: 10),
              Text(
                pedido['price'],
                style: TextStyle(fontSize: 20, color: Colors.green.shade800),
              ),
              SizedBox(height: 10),
              Text(
                pedido['isAnonymous'] ? 'Vendedor: Anônimo' : 'Vendedor: Público',
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(height: 10),
              Text(
                pedido['isPhysicalItem'] ? 'Tipo: Item Físico' : 'Tipo: Skin Virtual',
                style: TextStyle(color: Colors.grey[600]),
              ),
              SizedBox(height: 20),
              Text(
                'Descrição:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                pedido['description'],
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
