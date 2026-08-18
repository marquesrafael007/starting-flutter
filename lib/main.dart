import 'package:flutter/material.dart';

void main() {
  runApp(const MinhaCalculadoraApp());
}

class MinhaCalculadoraApp extends StatelessWidget {
  const MinhaCalculadoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      debugShowCheckedModeBanner: false,
      home: const TelaCalculadora(),
    );
  }
}

class TelaCalculadora extends StatefulWidget {
  const TelaCalculadora({super.key});

  @override
  State<TelaCalculadora> createState() => _TelaCalculadoraState();
}

class _TelaCalculadoraState extends State<TelaCalculadora> {
  final TextEditingController _controladorNum1 = TextEditingController();
  final TextEditingController _controladorNum2 = TextEditingController();
  String _resultado = '';

  @override
  void dispose() {
    _controladorNum1.dispose();
    _controladorNum2.dispose();
    super.dispose();
  }

  double? _lerNumero(String texto) {
    return double.tryParse(texto.replaceAll(',', '.'));
  }

  void _somar() {
    final num1 = _lerNumero(_controladorNum1.text);
    final num2 = _lerNumero(_controladorNum2.text);
    if (num1 == null || num2 == null) {
      setState(() => _resultado = 'Entrada inválida');
      return;
    }
    setState(() => _resultado = (num1 + num2).toString());
  }

  void _subtrair() {
    final num1 = _lerNumero(_controladorNum1.text);
    final num2 = _lerNumero(_controladorNum2.text);
    if (num1 == null || num2 == null) {
      setState(() => _resultado = 'Entrada inválida');
      return;
    }
    setState(() => _resultado = (num1 - num2).toString());
  }

  void _multiplicar() {
    final num1 = _lerNumero(_controladorNum1.text);
    final num2 = _lerNumero(_controladorNum2.text);
    if (num1 == null || num2 == null) {
      setState(() => _resultado = 'Entrada inválida');
      return;
    }
    setState(() => _resultado = (num1 * num2).toString());
  }

  void _dividir() {
    final num1 = _lerNumero(_controladorNum1.text);
    final num2 = _lerNumero(_controladorNum2.text);
    if (num1 == null || num2 == null) {
      setState(() => _resultado = 'Entrada inválida');
      return;
    } else if (num2 == 0) {
      setState(() => _resultado = 'Não é possível dividir por zero.');
    } else {
      setState(() => _resultado = (num1 / num2).toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controladorNum1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Primeiro número',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _controladorNum2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Segundo número',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: _somar, child: const Text('+')),
                ElevatedButton(onPressed: _subtrair, child: const Text('-')),
                ElevatedButton(onPressed: _multiplicar, child: const Text('×')),
                ElevatedButton(onPressed: _dividir, child: const Text('÷')),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              _resultado,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
