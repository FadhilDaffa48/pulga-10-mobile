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

# Tugas 8

# 1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?

Gampangnya push itu kayak mendorong halaman baru ke sebuah stack sehingga kita masih bisa kembali ke halaman sebelumnya dengan pop
sedangkan pushreplacement kita membuat stack baru lalu mendorong halaman baru ke stack tersebut. Kasusnya menggunakan push hanya jika
kita memiliki semacam tombol back yang mengembalikan kita ke halaman sebelumnya tetapi jika tidak ada tombol tersebut gunakan push replacement
saja agar stack tidak berlebih isinya

# 2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

Pertama tentu saja menggunakan material app agar halaman bisa tampil pada layar, kemudian menggunakan scaffold yang disini berfungsi untuk membentuk
struktur halaman dari atas ke bawah dengan struktur appbar, body, dan tambahan lainnya. Appbar kita gunakan untuk membentuk semacam navbar yang
memiliki logo dan identitas toko, kemudian dengan drawer saya meletakkan pada left_drawer.dart untuk widget drawer yang dimana akan membentuk tombol
di sebelah kiri appbar yang menampilkan semacam menu samping untuk aplikasi mobile.

# 3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

Untuk padding dia akan memberikan spacing di dalam container sehingga membuat textfieldform jadi terlihat lebih rapi, karena terdapat spacing antara
field dan field untuk teksnya, Single child scroll view sangat berguna karena pada field bisa saja kita memberikan input yang sangat panjang, terutama di
field deskripsi produk makanya dengan wdiget ini kita bisa melakukan scrolling pada field tersebut.

Contoh:

child: SingleChildScrollView(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children:[
// === Name ===
Padding(
padding: const EdgeInsets.all(8.0),
child: TextFormField(
decoration: InputDecoration(
hintText: "Product Name",
labelText: "Product Name",
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(5.0),
),
),
onChanged: (String? value) {
setState(() {
_title = value!;
});
},

Untuk listview  beda lagi dia itu membuat kita bisa scroll halaman ke bawah jika textformfield yang ada banyak sekali sehingga
pengguna bisa mengisi semua field pada web tanpa perlu memikirkan ukuran layar mereka dan sebagainya.

contoh:
child: ListView(
children: [
const DrawerHeader(
decoration: BoxDecoration(
color: Colors.blue,
),
child: Column(
children: [
Text(
'Pulga 10 Store',
textAlign: TextAlign.center,
style: TextStyle(
fontSize: 30,
fontWeight: FontWeight.bold,
color: Colors.white,
),
),
Padding(padding: EdgeInsets.all(10)),
Text("Your Messi Collection Hub",
// TODO: Tambahkan gaya teks dengan center alignment, font ukuran 15, warna putih, dan weight biasa
style: TextStyle(
fontSize: 15,
color: Colors.white,
fontWeight: FontWeight.bold
),
),
],
),

            Untuk contoh ini mungkin memang tidak ada pada form tetapi pada tombol drawernya tetapi konsepnya sama aja kita jadi bisa scroll konten
            drawer ke bawah
# 6. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
Pada theme di main.dart saya sesuaikan warna themnya menjadi cyan supaya sesuai dengan tema website saya, kemudian pada menu.dart dan lain lainnya terdapat parameter yang membutuhkan input berupa theme sehingga saya menggunakan theme itu kemudian decoratornya saya ubah juga agar themenya menjadi cyan juga.

contoh:

class MyApp extends StatelessWidget {
const MyApp({super.key});

// This widget is the root of your application.
@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'Pulga 10',
theme: ThemeData(
// This is the theme of your application.
//
// TRY THIS: Try running your application with "flutter run". You'll see
// the application has a purple toolbar. Then, without quitting the app,
// try changing the seedColor in the colorScheme below to Colors.green
// and then invoke "hot reload" (save your changes or press the "hot
// reload" button in a Flutter-supported IDE, or press "r" if you used
// the command line to start the app).
//
// Notice that the counter didn't reset back to zero; the application
// state is not lost during the reload. To reset the state, use hot
// restart instead.
//
// This works for code too, not just values: Most code changes can be
// tested with just a hot reload.
colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent),
),
home: HomePage(theme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent))
);
}
}

// pada menu.dart ada theme data
lass HomePage extends StatelessWidget {
const HomePage({required theme,super.key});


jadi dengan itu segala theme di app saya jadi konsisten. dan juga ada banyak sekali widget color yang diubah yang agar lebih akurat contoh:
return Drawer(
child: ListView(
children: [
const DrawerHeader(
decoration: BoxDecoration(
color: Colors.blue,
),
child: Column(
children: [
Text(
'Pulga 10 Store',
textAlign: TextAlign.center,
style: TextStyle(
fontSize: 30,
fontWeight: FontWeight.bold,
color: Colors.white,
),
),
Padding(padding: EdgeInsets.all(10)),
Text("Your Messi Collection Hub",
// TODO: Tambahkan gaya teks dengan center alignment, font ukuran 15, warna putih, dan weight biasa
style: TextStyle(
fontSize: 15,
color: Colors.white,
fontWeight: FontWeight.bold
),
),
],
),
),


# Tugas 9

# 1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?

Model pada dart berfungsi agar data dari JSON punya DJANGO dapat dicerna dalam template tertentu sehingga kita bisa memanggil tiap
atribut dengan teratur, jika kita langsung memetakan tanpa model dapat terjadi salah key yang digunakan
# 2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.

Http untuk melakukan redirect pada fungsi yang tidak perlu manajemen session sedangkan cookierequest memanggil data sementara dari cookies
pada django sehingga biasanya dia menangani login, logout, dan request lain dengan autentikasi seperti membuat produk.
# 3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

Karena ia menyimpan status login dan session sehingga agar konsisten kita perlu semua halaman flutter menggunakan instance cookieRequest
Jika tidak maka bisa saja kita sudah login di satu halaman, tetapi tidak di halaman lain.
# 4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?

Flutter emulator tidak bisa langsung akses localhost laptop sehingga butuh alamat khusus 10.0.2.2, maka alamat ini harus diizinkan di ALLOWED_HOSTS Django. Kita juga perlu mengaktifkan CORS supaya Flutter diizinkan mengakses backend Django. 
Cookie autentikasi Django membutuhkan pengaturan CSRF agar cookie dapat terkirim dari Flutter. Android juga perlu izin akses internet, kalau tidak, request akan selalu gagal. Jika salah satu konfigurasi ini tidak benar, Flutter tidak akan bisa 
menghubungi Django, login gagal, cookie tidak tersimpan, atau request diblokir
# 5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

Mekanisme data dimulai ketika user mengisi form di Flutter, lalu Flutter mengambil nilai input dan mengirimkannya ke Django melalui HTTP. Django memproses JSON, memvalidasi, menyimpan ke database, lalu mengembalikan respon JSON. 
Flutter menerima respon tersebut, mengubahnya menjadi objek model Dart, menyimpannya ke state, dan menampilkan datanya di UI
# 6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

Pada login dan register flutter mengirim username dan password ke DJango kemudian django memanggil fungsi pada views.py yang mengatur hal tersebut, jika benar maka django membuat session dan mengirim cookie session ke flutter.
CookieRequest akan menyimpan cookie itu sehingga setiap request berikutnya otomatis membawa cookie untuk autentikasi. Logout dilakukan dengan memanggil fungsi logout django, dimana django menghapus session dan cookierequest membersihkan cookie.
# 7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).