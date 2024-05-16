import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Welcome Screen',
      home: WelcomeScreen(),
    );
  }
}

//Primeira Tela
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem-vindo'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 0, 0, 0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Seja Bem-Vindo !!',
                style: TextStyle(
                    fontSize: 24.0, color: Color.fromARGB(255, 255, 255, 255)),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SessionScreen()),
                  );
                },
                child: const Text('Iniciar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Segunda Tela
class SessionScreen extends StatefulWidget {
  const SessionScreen({super.key});

  @override
  _SessionScreenState createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  String sessionName = '';
  int selectedActivityTime = 10;
  int selectedRestTime = 10;
  int selectedRepetitions = 0;

  List<int> activityTimes = [0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60];
  List<int> repetitions = [0, 1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar Sessão'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 0, 0, 0),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 20.0),
              TextField(
                style:
                    const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                decoration: const InputDecoration(
                  labelText: 'Nome da Sessão',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
                ),
                onChanged: (value) {
                  setState(() {
                    sessionName = value;
                  });
                },
              ),
              const SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  const Text(
                    'Tempo de Atividade:',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  const SizedBox(width: 10.0),
                  DropdownButton<int>(
                    value: selectedActivityTime,
                    onChanged: (int? value) {
                      setState(() {
                        selectedActivityTime = value!;
                      });
                    },
                    items: activityTimes.map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text('$value minutos',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 106, 106, 106))),
                      );
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  const Text(
                    'Tempo de Descanso:',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  const SizedBox(width: 10.0),
                  DropdownButton<int>(
                    value: selectedRestTime,
                    onChanged: (int? value) {
                      setState(() {
                        selectedRestTime = value!;
                      });
                    },
                    items: activityTimes.map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text('$value minutos',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 106, 106, 106))),
                      );
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  const Text(
                    'Quantidade de Repetições:',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  const SizedBox(width: 10.0),
                  DropdownButton<int>(
                    value: selectedRepetitions,
                    onChanged: (int? value) {
                      setState(() {
                        selectedRepetitions = value!;
                      });
                    },
                    items: repetitions.map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text('$value',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 106, 106, 106))),
                      );
                    }).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Adicione a lógica para iniciar a sessão aqui
                },
                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
                  child: Text('Iniciar'),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
                  child: Text('Voltar'),
                ),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
