# TUGAS 7

# 1.  Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.

Pada flutter widget tree adalah semacam struktur yang menggambarkan bagaimana elemen UI akan ditampilkan pada program
layaknya seperti pohon. Setiap elemen pada layar seperti text tombol dan gambar merupakan sebuha widget yang saling berhubungan
dalam hubungan parent child dengan widget parent berfungsi membungkus dan mengatur posisi ukuran dan sebagainya yang implisit sedangkan
child adalah widget yang langsung dapat dilihat oleh mata kita saat membuka aplikasi.

# 2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.

Pertama saya menggunakan class widget stateless untuk menampilkan aplikasi di dalamnya saya memanfaatkan widget 
MaterialApp agar aplikasi dapat ditampilkan dengan pengaturan bawaan seperti theme dan title widget MaterialApp 
ini kemudian memanggil widget stateless lainnya yang ada pada file menu.dart di dalam widget tersebut saya mengembalikan 
widget Scaffold yang berfungsi sebagai kerangka utama tampilan sehingga pengaturan posisi dan susunan widget dapat diatur 
dari atas ke bawah pada Scaffold saya menambahkan widget AppBar di bagian atas sebagai tempat untuk menampilkan judul atau 
logo aplikasi AppBar ini saya isi dengan widget Center agar kontennya berada di posisi tengah dan di dalamnya terdapat widget 
Image.asset yang digunakan untuk menampilkan logo dari folder images/pulga10.png

Selanjutnya pada bagian body dari Scaffold saya juga menggunakan widget Center agar seluruh isi halaman berada di tengah layar 
di dalamnya saya menggunakan widget Row untuk menampilkan beberapa tombol sejajar secara horizontal setiap tombol dibuat menggunakan 
widget ElevatedButton.icon yaitu kombinasi antara tombol dengan ikon dan teks ketika tombol ditekan akan muncul SnackBar di bagian bawah
layar yang berisi pesan singkat sebagai notifikasi SnackBar ini ditampilkan menggunakan ScaffoldMessenger.of(context).showSnackBar dan teks
pesannya ditulis dengan widget Text

Selain itu setiap tombol memiliki widget ImageIcon sebagai ikon dan widget Text sebagai labelnya dengan tampilan teks diatur menggunakan 
TextStyle warna latar tombol saya ubah melalui ButtonStyle dan WidgetStatePropertyAll sedangkan jarak antar tombol diatur menggunakan widget 
SizedBox dengan susunan ini seluruh tampilan aplikasi terdiri dari struktur utama MaterialApp Scaffold AppBar dan Body di mana setiap bagian 
memiliki perannya masing masing untuk membentuk antarmuka yang rapi dan mudah dipahami

# 3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.

MaterialApp merupakan widget yang membungkus beberapa widget yang menggunakan material design, seperti tema warna, home, ataupun judul.
MaterialApp sering dikatakan sebagai widget root karena posisinya berada di paling atas widget tree yang dimana ia dijadikan sebagai pintu masuk untuk dapat
mengakses widget lain pada program, widget ini juga memastikan agar program dapat mewarisi pengaturan utama pada materialapp sehingga tidak perlu melakukan
pengaturan lagi dan lagi

# 4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?

Untuk ini sebenarnya sesuai namanya saja, dimana stateless widget adalah widget yang tidak memiliki keadaan yang 
berubah selama berjalan/tampilan selalu sama pada program, dan saya akan menggunakan ini jika hanya butuh widget 
statis seperti text, icon, dan image

Stateful widget hanya kebalikan dari stateless di mana terdapat keadaan yang mengubah tampilan dari aplikasi, stateful 
widget ini berguna jika aplikasi memang memiliki kondisi yang terus berubah misalkan sebuah tombol yang mengganti warna 
background aplikasi, atau aplikasi perlu menerima data

# 5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

BuildContext merepresentasikan posisi widget dalam widget tree, dengan tiap widget memiliki buildcontext sendiri
BuildContext penting karena memungkinkan widget mengetahui bagaimana hubungannya dengan widget lain dan flutter 
memerlukannya untuk mengakses informasi dari parent widget seperti tema, arah teks, dan ukuran layar.

Dalam metode build terdapat BuildContext sebagai parameter agar widget bisa membangun tampilan berdasarkan posisi dan
data dari lingkungan sekitar. Setiap flutter memanggil build ia memberikan context sesuai dengan lokasi widget pada widget
tree.

# 6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

Konsep hot reload flutter adalah memperbarui tampilan aplikasi secara langsung tnapa kehilangan state yang berjalan
saat pengembang mengubah kode nanti flutter hanya memuat ulang bagian kode yang berubah saat aplikasi sedang berjalan sehingga
perubahan dapat langsung dilihat. Berbeda sekali denganhot restart dimana kita harus memulai ulang program dari awal dan menghapus semua
state yang disimpan pada aplikasi sehingga data sementara seperti variabel input dan misalnya posisi halaman tidak tersimpan.