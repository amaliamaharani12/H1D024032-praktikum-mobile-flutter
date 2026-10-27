import 'queue.dart';

void main() {
  print("==================================================");
  print("PRAKTIKUM PEMROGRAMAN MOBILE - MODUL 1 (DART)");
  print("IMPLEMENTASI STRUKTUR DATA QUEUE (FIFO)");
  print("Nama : Amalia Maharani Andessy");
  print("NIM  : H1D024032");
  print("==================================================\n");

  // Inisialisasi antrean
  Queue queue = Queue();

  // 1. Menambahkan elemen ke dalam antrean (Enqueue)
  print("--- 1. Proses Enqueue Elemen ---");
  queue.enqueue("A");
  queue.enqueue("B");
  queue.enqueue("C");
  queue.tampilkanQueue();
  print("Jumlah antrean: ${queue.size}\n");

  // 2. Mengambil elemen paling depan dari antrean (Dequeue)
  print("--- 2. Proses Dequeue (Prinsip FIFO) ---");
  print("Data yang diambil: ${queue.dequeue()}");
  queue.tampilkanQueue();
  print("Jumlah antrean saat ini: ${queue.size}\n");

  // 3. Menambahkan elemen baru (Enqueue)
  print("--- 3. Menambahkan Elemen Baru ---");
  queue.enqueue("D");
  queue.tampilkanQueue();
  print("Jumlah antrean saat ini: ${queue.size}\n");

  // 4. Mengosongkan antrean
  print("--- 4. Mengambil Sisa Elemen Hingga Antrean Kosong ---");
  print("Data yang diambil: ${queue.dequeue()}");
  print("Data yang diambil: ${queue.dequeue()}");
  print("Data yang diambil: ${queue.dequeue()}");
  queue.tampilkanQueue();

  // 5. Mencoba Dequeue saat antrean sudah kosong
  print("\n--- 5. Uji Coba Dequeue Pada Antrean Kosong ---");
  queue.dequeue();

  print("\n==================================================");
  print("Program Selesai.");
  print("==================================================");
}