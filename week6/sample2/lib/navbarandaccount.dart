import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        useMaterial3: true,
      ),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Text("Nav1")),
    const Center(child: Text("Nav2")),
    const Center(child: Text("Nav3")),
    const Center(child: Text("Nav4")),
    const AkunPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: [
          _navItem("Beranda", "assets/images/home-grey_100x100.webp"),
          _navItem("Blibli Bonus", "assets/images/trophy-grey_100x100.webp"),
          BottomNavigationBarItem(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  "assets/images/cart-grey_100x100.webp",
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
                Positioned(
                  right: -6,
                  top: -6,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                    child: const Center(
                      child: Text(
                        '0',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            label: 'Bag',
          ),
          _navItem("Daftar pesanan", "assets/images/order-grey_100x100.webp"),
          _navItem("Akun", "assets/images/account-grey_100x100.png"),
        ],
      ),
    );
  }

  BottomNavigationBarItem _navItem(String label, String assetPath) {
    return BottomNavigationBarItem(
      label: label,
      icon: Image.asset(
        assetPath,
        width: 24,
        height: 24,
        fit: BoxFit.contain,
      ),
    );
  }
}

class AkunPage extends StatelessWidget {
  const AkunPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 140,
                decoration: const BoxDecoration(color: Color(0xFFE3F2FD)),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.arrow_back, color: Colors.grey),
                        Expanded(
                          child: Center(
                            child: Image.asset(
                              "assets/images/blibli-tiket.9ffadd58.jpg",
                              height: 20,
                            ),
                          ),
                        ),
                        const SizedBox(width: 48),
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 80), 
                child: Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Transform.translate(
                      offset: const Offset(0, 27),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.88,
                        padding: const EdgeInsets.only(top: 40, bottom: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Column(
                          children: [
                            Text(
                              "Masuk",
                              style: TextStyle(
                                color: Color(0xFF007AFF),
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "Tidak punya akun? ",
                                    style: TextStyle(
                                      color: Colors.grey, 
                                      fontSize: 12
                                      ),
                                  ),
                                  TextSpan(
                                    text: "Daftar",
                                    style: const TextStyle(
                                      color: Color(0xFF007AFF), 
                                      fontSize: 12, 
                                  ),
                                ),
                              ],
                            ),
                          )
                          ],
                        ),
                      ),
                    ),

                    CircleAvatar(
                      radius: 27,
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/blibli-profile.d7034ab1.jpg",
                          height: 48,
                          width: 48,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 60),

          Container(
            color: Colors.white,
            child: Column(
              children: [
                const ListTile(
                  leading: Icon(Icons.help_outline, color: Colors.grey),
                  title: Text("Bantuan BlibliCare"),
                  trailing: Icon(Icons.chevron_right, color: Colors.grey),
                ),
                const Divider(height: 1, indent: 50),
                ListTile(
                  leading: Image.asset(
                    "assets/images/cart-grey_100x100.webp",
                    height: 24,
                    width: 24,
                  ),
                  title: const Text("Jual di Blibli"),
                  trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                    "assets/images/cart-grey_100x100.webp",
                    height: 24,
                    width: 24,
                  ),
                    const SizedBox(width: 8),
                    const Text("Tentang Blibli", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
                  ],
                ),
                const SizedBox(height: 8),
                const Text("All Rights Reserved", style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}