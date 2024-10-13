import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // Fungsi utama yang menjalankan aplikasi
}

// Kelas utama dari aplikasi, menggunakan StatelessWidget karena tidak ada state yang berubah di dalam MyApp
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterPage(), // Menentukan Counter Page adalah halaman utama
    );
  }
}

// Kelas CounterPage yang merupakan StatefulWidget karena nilai counter bisa berubah-ubah
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState(); // Membuat state untuk CounterPage
}

// State dari CounterPage, di sini variabel counter dan logika perubahan UI akan disimpan
class _CounterPageState extends State<CounterPage> {
  int counter = 0; // Inisialisasi variabel counter dengan nilai awal 0

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold menyediakan struktur dasar halaman seperti AppBar dan body (Tampilan yang ingin ditampilkan di page tsb)
      appBar: AppBar(
        title: const Text('Counter Page'), // Menampilkan judul di AppBar
      ),
      body: Center( // Pusatkan konten di dalam halaman
        child: Row( // Membuat baris yang terdiri dari ikon "-" (kurangi), teks nilai counter, dan ikon "+" (tambah)
          mainAxisAlignment: MainAxisAlignment.center, // Mengatur agar semua item dalam Row berada di tengah
          children: [
            // Ikon untuk mengurangi nilai counter
            InkWell(
              onTap: () {
                counter--; // Kurangi nilai counter
                setState(() {}); // Memanggil setState untuk memperbarui UI agar perubahan counter terlihat
              },
              child: const Icon(Icons.remove), // Ikon "-" dari material design
            ),
            const SizedBox(width: 20), // Memberikan jarak antara ikon "-" dan teks counter
            // Teks yang menampilkan nilai counter saat ini
            Text('Nilai Counter: $counter'), // Menampilkan teks dengan nilai counter di tengah
            const SizedBox(width: 20), // Memberikan jarak antara teks counter dan ikon "+"
            // Ikon untuk menambah nilai counter
            InkWell(
              onTap: () {
                counter++; // Tambah nilai counter
                setState(() {}); // Memanggil setState untuk memperbarui UI agar perubahan counter terlihat
              },
              child: const Icon(Icons.add), // Ikon "+" dari material design
            ),
          ],
        ),
      ),
    );
  }
}
