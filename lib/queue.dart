class Queue {
  // List untuk menyimpan elemen antrean
  List<dynamic> items = [];

  // Menambahkan data ke bagian belakang antrean (Enqueue)
  void enqueue(dynamic item) {
    items.add(item);
    print("Enqueue ($item) berhasil ditambahkan ke antrean.");
  }

  // Mengambil dan menghapus data dari bagian depan antrean (Dequeue)
  dynamic dequeue() {
    if (isEmpty) {
      print("Peringatan: Queue kosong, tidak ada elemen yang dapat diambil.");
      return null;
    }
    dynamic removedItem = items.removeAt(0);
    return removedItem;
  }

  // Menampilkan isi antrean saat ini
  void tampilkanQueue() {
    print("Isi Queue saat ini: $items");
  }

  // Memeriksa apakah antrean kosong
  bool get isEmpty => items.isEmpty;

  // Mendapatkan jumlah elemen dalam antrean
  int get size => items.length;
}