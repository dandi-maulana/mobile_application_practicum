import 'package:flutter/material.dart';

class WhatsAppApp extends StatelessWidget {
  const WhatsAppApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp Clone',
      theme: ThemeData(
        primaryColor: const Color(0xFF075E54),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF128C7E),
        ),
      ),
      home: const WhatsAppHomePage(),
    );
  }
}

class WhatsAppHomePage extends StatefulWidget {
  const WhatsAppHomePage({super.key});

  @override
  State<WhatsAppHomePage> createState() => _WhatsAppHomePageState();
}

class _WhatsAppHomePageState extends State<WhatsAppHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(text: 'CHATS'),
            Tab(text: 'STATUS'),
            Tab(text: 'CALLS'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          const Center(child: Text('Camera')),
          _buildChatsTab(),
          const Center(child: Text('Status')),
          const Center(child: Text('Calls')),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: const Icon(Icons.message, color: Colors.white),
        onPressed: () {},
      ),
    );
  }

  Widget _buildChatsTab() {
    return ListView.builder(
      itemCount: dummyChats.length,
      itemBuilder: (context, index) {
        final chat = dummyChats[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundImage: AssetImage(chat.foto),
          ),
          title: Text(
            chat.nama,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: [
              _buildStatusIcon(chat.status),
              const SizedBox(width: 4),
              Expanded(
                child: Text(chat.pesanText, overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
          trailing: Text(chat.jam, style: const TextStyle(fontSize: 12)),
          onTap: () {},
        );
      },
    );
  }

  Widget _buildStatusIcon(String status) {
    switch (status) {
      case 'read':
        return const Icon(Icons.done_all, size: 16, color: Colors.blue);
      case 'delivered':
        return const Icon(Icons.done_all, size: 16, color: Colors.grey);
      case 'pending':
        return const Icon(Icons.done, size: 16, color: Colors.grey);
      default:
        return const SizedBox();
    }
  }
}

class Chat {
  final String foto;
  final String nama;
  final String pesanText;
  final String status;
  final String jam;

  Chat({
    required this.foto,
    required this.nama,
    required this.pesanText,
    required this.status,
    required this.jam,
  });
}

// Dummy data for chats
final List<Chat> dummyChats = [
  Chat(
    foto: 'assets/avatars/avatar1.jpg',
    nama: 'Fauzi',
    pesanText: 'Rekomendasi Anime Bagus Ada?',
    status: 'read',
    jam: '10:30',
  ),
  Chat(
    foto: 'assets/avatars/avatar2.jpg',
    nama: 'Adit',
    pesanText: 'Login Delta Force Mobile yuk',
    status: 'delivered',
    jam: '09:15',
  ),
  Chat(
    foto: 'assets/avatars/avatar3.jpg',
    nama: 'Rido',
    pesanText: 'Login COC, nanti perang clan ya',
    status: 'pending',
    jam: '08:45',
  ),
  Chat(
    foto: 'assets/avatars/avatar4.jpg',
    nama: 'Wildan',
    pesanText: 'Ayok Push Rank ML',
    status: 'read',
    jam: 'Yesterday',
  ),
  Chat(
    foto: 'assets/avatars/avatar5.jpg',
    nama: 'Tyas',
    pesanText: 'Ayao push rank imo ML',
    status: 'delivered',
    jam: 'Yesterday',
  ),
  Chat(
    foto: 'assets/avatars/avatar6.jpg',
    nama: 'Salman',
    pesanText: '-1 nih login Honor of Kings yuk',
    status: 'read',
    jam: 'Monday',
  ),
  Chat(
    foto: 'assets/avatars/avatar7.jpg',
    nama: 'Rimbun',
    pesanText: 'Bisa minta tolong sesuatu?',
    status: 'pending',
    jam: 'Monday',
  ),
  Chat(
    foto: 'assets/avatars/avatar8.jpg',
    nama: 'Febri',
    pesanText: 'Sudah sampai rumah?',
    status: 'read',
    jam: 'Sunday',
  ),
  Chat(
    foto: 'assets/avatars/avatar9.jpg',
    nama: 'Rafki',
    pesanText: 'Ini ada Manga bagus mau?',
    status: 'delivered',
    jam: 'Sunday',
  ),
  Chat(
    foto: 'assets/avatars/avatar10.jpg',
    nama: 'Nisa',
    pesanText: 'Happy birthday!',
    status: 'read',
    jam: 'Saturday',
  ),
];
