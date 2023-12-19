import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _count = 0;
  String _text = "";
  final _textController = TextEditingController();

  @override
  void dispose() {
    // 메모리를 계속 잡아먹기에 다 사용후 끝내줘야함.
    _textController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello World!'),
        backgroundColor: Colors.black12,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.red,
                width: 120,
                height: 120,
              ),
              SizedBox(height: 30,),
              Text(
                '$_count',
                style: TextStyle(color: Colors.red, fontSize: 50),
              ),
              ElevatedButton(
                onPressed: () {
                  print("printCheck");
                },
                child: Text('ElevatedButton'),
              ),
              TextButton(
                onPressed: () {},
                child: Text('TextButton'),
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text('OutlinedButton'),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        labelText: '글자',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (text) {
                        _text = text;
                        setState(() {

                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(onPressed: () {
                        print(_textController.text);
                    }, child: Text('login')),
                  ),
                ],
              ),
              Text(_textController.text),
              Image.network('https://i.pinimg.com/originals'
                  '/41/74/1a/41741aacbdc3583e5176bde17e041d72.jpg',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.red,
                width: 120,
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/test_image.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 코드를 다시 읽음 (화면 갱신)
          setState(() {
            _count++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
