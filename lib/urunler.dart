import 'package:flutter/material.dart';

class Urunler extends StatelessWidget {
  const Urunler({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(backgroundColor: Color(0xFFE0E0E0), child: Icon(Icons.person, color: Colors.grey)),
        ),
        actions: [IconButton(icon: const Icon(Icons.notifications_none), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            // Arama Çubuğu
            _buildSearchBar(),
            const SizedBox(height: 20),
            // Kampanya Kartı
            _buildHeroCard(),
            const SizedBox(height: 25),
            // Kategoriler
            _buildCategoryList(),
            const SizedBox(height: 25),
            // Feed
            _buildVerticalFeed(),
          ],
        ),
      ),
    );
  }

  // Yardımcı Widgetlar (Kodun okunabilirliği için ayırdım)
  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15), border: Border.all(color: Colors.grey.shade300)),
      child: const TextField(decoration: InputDecoration(hintText: 'Ara...', border: InputBorder.none, icon: Icon(Icons.search))),
    );
  }

  Widget _buildHeroCard() {
    return Container(
      height: 160, width: double.infinity, padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(colors: [Color(0xFF8E2DE2), Color(0xFFFF512F)], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Sınırlı Süreli Kampanya!\n%30 İndirim', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          ElevatedButton(onPressed: () {}, child: const Text('Görün')),
        ],
      ),
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          final colors = [Colors.blue, Colors.orange, Colors.cyan, Colors.green];
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Column(
              children: [
                CircleAvatar(backgroundColor: colors[index].withOpacity(0.1), child: Icon(Icons.category, color: colors[index])),
                const SizedBox(height: 5),
                Text('Kat ${index + 1}', style: const TextStyle(fontSize: 12)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildVerticalFeed() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) => Card(
        margin: const EdgeInsets.only(bottom: 15),
        child: ListTile(
          leading: Container(width: 50, height: 50, color: Colors.teal.shade100, child: const Icon(Icons.image)),
          title: const Text('Başlık'),
          subtitle: const Text('Açıklama metni...'),
          trailing: const Icon(Icons.favorite_border),
        ),
      ),
    );
  }
}