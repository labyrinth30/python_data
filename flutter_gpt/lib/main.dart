import 'package:flutter/material.dart';
import 'package:flutter_gpt/secret.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _generatedText = "";

  Future<void> generateText() async {
    String prompt =
        "Please recommend only three restaurants near Seoul National University Station";
    String model = "text-davinci-002";
    String apiKey = APIKEY;

    var response = await http.post(
      Uri.parse('https://api.openai.com/v1/engines/$model/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'prompt': prompt, // 새 텍스트를 생성할 때 시작점으로 사용할 초기 텍스트 프롬프트.
        'max_tokens': 1000, // 출력 텍스트에 생성할 토큰(즉, 단어)의 최대 개수입니다.
        'temperature':
            0.5, // 생성된 텍스트의 '창의성' 또는 무작위성을 측정하는 값, 값이 높을수록 더 다양하고 예측할 수 없는 텍스트가 생성되고, 낮을수록 더 보수적이고 예측 가능한 텍스트가 생성됨
        // 'n': 1, // 생성할 독립적인 완성문의 수입니다. 각 완성문은 temperature 에 의해 도입된 무작위성에 따라 조금씩 달라짐.
        // 'stop': '.' // 모델이 토큰을 발견할 때 텍스트 생성을 중지하도록 하는 하나 이상의 토큰 문자열 특정 단어나 구문으로 끝나는 텍스트를 생성할 때 유용할 수 있습니다.
      }),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      setState(() {
        _generatedText = data['choices'][0]['text'];
      });
    } else {
      var data = jsonDecode(response.body);
      print(response.statusCode);
      print(data);
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: generateText,
                child: const Text('Generate Text'),
              ),
              const SizedBox(height: 20),
              Text(_generatedText),
            ],
          ),
        ),
      ),
    );
  }
}
