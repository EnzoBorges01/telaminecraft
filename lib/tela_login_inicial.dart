import 'package:flutter/material.dart';
import 'home.dart'; // Tela principal após login bem-sucedido

class TelaPrincipal extends StatefulWidget {
  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  final formKey = GlobalKey<FormState>(); // Controlador para validação do formulário
  bool isLoading = false; // Controle para mostrar o indicador de carregamento
  bool isForgotPassword = false; // Controle para alternar entre login e recuperação de senha

  // Dados do pré-registro (simulados)
  final String preUsuario = "CaxaPreta";
  final String preEmail = "Caxa@preta.com";
  final String preSenha = "Vasco69";

  // Controladores para os campos de texto
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController emailRecuperacaoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Inicializa os campos com valores do pré-registro
    usuarioController.text = preUsuario;
    emailController.text = preEmail;
    senhaController.text = preSenha;
  }

  @override
  void dispose() {
    // Libera os controladores
    usuarioController.dispose();
    emailController.dispose();
    senhaController.dispose();
    emailRecuperacaoController.dispose();
    super.dispose();
  }

  // Função para validar as credenciais de login
  bool _validarCredenciais() {
    final usuario = usuarioController.text;
    final email = emailController.text;
    final senha = senhaController.text;
    // Verifica se os dados fornecidos correspondem ao pré-registro
    return usuario == preUsuario && email == preEmail && senha == preSenha;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50], // Cor de fundo mais suave
      body: Form(
        key: formKey, // Chave para validação do formulário
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Título principal da tela
              Text(
                'Bem-vindo ao MINECON!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey[800],
                ),
              ),
              SizedBox(height: 30),

              // Se não for a recuperação de senha, exibe os campos de login
              if (!isForgotPassword)
                Column(
                  children: [
                    // Campo de Usuário
                    TextFormField(
                      controller: usuarioController,
                      decoration: InputDecoration(
                        labelText: "Usuário",
                        labelStyle: TextStyle(color: Colors.blueGrey[600]),
                        hintText: "Digite seu nome de usuário",
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.person, color: Colors.blueGrey[600]),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Por favor, insira o nome de usuário";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),

                    // Campo de E-mail
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        labelStyle: TextStyle(color: Colors.blueGrey[600]),
                        hintText: "Digite seu e-mail",
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.email, color: Colors.blueGrey[600]),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Por favor, insira o e-mail";
                        }
                        if (!value.contains("@")) {
                          return "E-mail inválido";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),

                    // Campo de Senha
                    TextFormField(
                      controller: senhaController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(color: Colors.blueGrey[600]),
                        hintText: "Digite sua senha",
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.lock, color: Colors.blueGrey[600]),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Por favor, insira a senha";
                        }
                        if (value.length < 6 || value.length > 8) {
                          return "A senha deve ter entre 6 e 8 caracteres";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30),

                    // Botão de Login
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });

                          // Simula um delay de 3 segundos
                          Future.delayed(Duration(seconds: 3), () {
                            setState(() {
                              isLoading = false;
                            });

                            // Verifica as credenciais e navega para a tela inicial
                            if (_validarCredenciais()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Login bem-sucedido!")),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Credenciais inválidas! Tente novamente.")),
                              );
                            }
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent,
                        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 60.0),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                      ),
                      child: isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text("Entrar", style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                    SizedBox(height: 20),

                    // Botão para alternar para a recuperação de senha
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isForgotPassword = !isForgotPassword;
                        });
                      },
                      child: Text(
                        isForgotPassword ? "Voltar ao Login" : "Esqueci minha senha",
                        style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                      ),
                    ),
                  ],
                ),

              // Se for a recuperação de senha
              if (isForgotPassword)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: TextFormField(
                    controller: emailRecuperacaoController,
                    decoration: InputDecoration(
                      labelText: "E-mail para recuperação",
                      labelStyle: TextStyle(color: Colors.blueGrey[600]),
                      hintText: "Digite o e-mail para recuperar a senha",
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.email_outlined, color: Colors.blueGrey[600]),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Insira seu e-mail para recuperação";
                      }
                      if (!value.contains("@")) {
                        return "E-mail inválido";
                      }
                      return null;
                    },
                  ),
                ),

              // Botão de recuperação de senha
              if (isForgotPassword)
                ElevatedButton(
                  onPressed: () {
                    if (emailRecuperacaoController.text.isNotEmpty &&
                        emailRecuperacaoController.text.contains("@")) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Instruções enviadas ao seu e-mail!")),
                      );
                      setState(() {
                        isForgotPassword = false; // Volta ao login
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Insira um e-mail válido")),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                    padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 60.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                  ),
                  child: Text("Recuperar Senha", style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
