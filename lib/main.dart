import 'package:flutter/material.dart';
import 'dart:core';
import 'package:url_launcher/url_launcher.dart'; // 添加這行導入

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'About Dawei',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
            titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
        )),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'About Me'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/profile.jpg',
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Dawei',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '軟體工程師',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  '喜歡做點有趣App的App工程師!?',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ),
              RichText(
                textAlign: TextAlign.left,
                text: const TextSpan(
                  style: TextStyle(color: Color.fromARGB(221, 91, 91, 91)),
                  children: [
                    TextSpan(
                      text: '\n專長領域：\n',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: 'Mobile App 開發\n',
                      style: TextStyle(fontSize: 16),
                    ),
                    TextSpan(
                      text: 'Flutter / iOS / Python',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.link),
                    onPressed: () {
                      showMyPortfoilo();
                    },
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: const Icon(Icons.code),
                    onPressed: () => showGitHub(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 顯示我的GitHub網站：
void showGitHub() async {
  // 添加 async
  final Uri gitHub = Uri.parse("https://github.com/dwhao84"); // 使用 Uri
  if (await canLaunchUrl(gitHub)) {
    await launchUrl(gitHub);
  } else {
    throw 'Could not launch $gitHub';
  }
}

// 顯示我個人履歷內容：
void showMyPortfoilo() async {
  var url = Uri.parse("https://dwhao84.github.io/");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
