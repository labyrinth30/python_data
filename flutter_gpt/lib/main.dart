import 'package:flutter/material.dart';
import 'package:flutter_gpt/secret.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _userInput = "";
  String _selectedLanguage = "English";
  String _generatedText = "";

  final List<String> _languages = [
    "English",
    "Spanish",
    "French",
    "German",
    "Italian",
    "Korean",
    "Chinese",
    "Japanese",
  ];

  Future<void> generateText() async {
    String prompt =
        "Explain the concept of '$_userInput' as if you were talking to an 8-year-old, and translate it into $_selectedLanguage.";
    String model = "text-davinci-002";
    String apiKey = APIKEY;

    var response = await http.post(
      Uri.parse('https://api.openai.com/v1/engines/$model/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'prompt': prompt,
        'max_tokens': 1000,
        'temperature': 0.5,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes));
      print(data);
      setState(() {
        _generatedText = data['choices'][0]['text'];
      });
    } else {
      setState(() {
        _generatedText = "Error: ${response.reasonPhrase}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GPT-3 Text Generation'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      _userInput = value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: '설명할 개념을 입력하세요',
                    hintText: '여기에 입력하세요...',
                  ),
                ),
                const SizedBox(height: 20),
                DropdownButton<String>(
                  value: _selectedLanguage,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedLanguage = newValue!;
                    });
                  },
                  items:
                      _languages.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: generateText,
                  child: const Text('설명 생성 및 번역'),
                ),
                const SizedBox(height: 20),
                Text(
                  _generatedText,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
