import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // 加上url_launcher.dart 才有辦法開啟網頁
import 'package:google_fonts/google_fonts.dart'; // 加上google_font的package

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
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
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
          padding: const EdgeInsets.symmetric(vertical: 30),
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
                // 在子類別裡面把照片裁成圓形
                child: ClipOval(
                  child: Image.asset(
                    // 顯示我的大頭照
                    'assets/profile.jpg',
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // 加上SizedBox
              const SizedBox(height: 20),
              // 加上文字
              const Text(
                'Dawei',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // 加上SizedBox
              const SizedBox(height: 10),
              const Text(
                '軟體工程師',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),

              // 加上SizedBox
              const SizedBox(height: 15),

              // 客製化 Padding
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

              // 顯示Rich Text
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

              // 加上SizedBox
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 顯示我個人網頁的icon
                  IconButton(
                    icon: const Icon(Icons.public),
                    onPressed: () {
                      // Call show portfoilo
                      showMyPortfoilo();
                    },
                  ),
                  const SizedBox(width: 20),
                  // 顯示我個人GitHub的icon
                  IconButton(
                      icon: const Icon(Icons.terminal),
                      onPressed: () {
                        // Call show GitHub function
                        showGitHub();
                      }),
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
