import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String imgurl = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("future builder"),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Container(
                  height: 375,
                  width: 300,
                  color: const Color.fromARGB(255, 119, 119, 119),
                  child: FutureBuilder(
                      future: getdata(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return Center(
                            child: Image.asset(
                              imgurl,
                              fit: BoxFit.fill,
                            ),
                          );
                        }
                      }),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text("RELOAD"))
            ],
          ),
        ),
      ),
    );
  }

  Future<String> getdata() async {
    await Future.delayed(const Duration(seconds: 3));

    imgurl = 'assets/images/tiger.jpg';
    return imgurl;
  }
}
