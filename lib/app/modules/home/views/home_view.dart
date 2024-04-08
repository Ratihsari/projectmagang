import 'dart:async'; // Import untuk Timer
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Import package untuk format tanggal
import 'package:flutter_application_2/app/modules/login/views/login_view.dart';
import 'package:flutter_application_2/app/modules/signup/views/signup_view.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int myIndex = 0;
  var user; // Variable user
  late String currentDate; // Variable untuk menyimpan tanggal
  late String currentTime; // Variable untuk menyimpan waktu

  @override
  void initState() {
    super.initState();
    // Mendapatkan tanggal saat ini
    currentDate = DateFormat('dd MMMM yyyy', 'en_US').format(DateTime.now());

    // Mendapatkan waktu saat ini dan mengatur timer untuk memperbarui waktu setiap detik
    currentTime = DateFormat('HH:mm:ss').format(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        currentTime = DateFormat('HH:mm').format(DateTime.now());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    String uId = user?.uid ?? ''; // Handle case if user is null

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  title: Text(
                    'Hello! ${user?.email}', // Menampilkan email pengguna atau "Guest" jika tidak ada pengguna
                    style: TextStyle(color: Color.fromARGB(255, 57, 122, 175)),
                  ),
                  subtitle: Text(
                    'This is your day 75 internship here',
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('../assets/user.png'),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 17.0, right: 17.0, top: 10),
            child: Container(
              alignment: Alignment.center,
              width: 50,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 59, 123, 176),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0, top: 20.0),
                      child: Icon(
                        Icons.calendar_today, // Icon untuk menunjukkan tanggal
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 45.0, top: 23.0),
                      child: Text(
                        "Hari ini, $currentDate", // Menampilkan tanggal secara otomatis
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  // container kiri
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 1.0, top: 60),
                    child: Container(
                      alignment: Alignment.center,
                      width: 170,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 253, 254, 255),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .start, // Mengatur posisi ikon ke kiri
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left:
                                    10.0), // Mengatur jarak antara ikon dan tepi container
                            child: CircleAvatar(
                              backgroundColor: Color.fromARGB(255, 48, 121,
                                  180), // Warna latar belakang ikon
                              child: Icon(
                                Icons.login, // Icon login
                                color: Colors.white, // Warna ikon login
                                size: 24, // Ukuran ikon login
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 6.0, right: 1.0, top: 15),
                              child: Text(
                                'Presensi Masuk',
                                style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 136, 133, 133),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //container kanan
                  Padding(
                    padding: EdgeInsets.only(
                        left: 275.0,
                        top: 60), // Mengatur padding pada sisi kiri
                    child: Container(
                      alignment: Alignment.center,
                      width: 170,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 253, 254, 255),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: CircleAvatar(
                              backgroundColor: Color.fromARGB(255, 226, 68, 63),
                              child: Icon(
                                Icons.logout,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 6.0, right: 1.0, top: 15),
                              child: Text(
                                'Presensi Keluar',
                                style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 136, 133, 133),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 23.0, top: 20.0),
                      child: StreamBuilder(
                        stream: Stream.periodic(Duration(seconds: 1)),
                        builder: (context, snapshot) {
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.access_time_filled,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5),
                              Text(
                                '$currentTime',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 63, 125, 176),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            myIndex = index;
            if (index == 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            } else if (index == 2) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => RegisterPage()),
              );
            }
          });
        },
        currentIndex: myIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard, color: Colors.white),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.login, color: Colors.white),
            label: 'Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add, color: Colors.white),
            label: 'Register',
          ),
        ],
        selectedItemColor: Colors.white, // Warna ikon terpilih
        unselectedItemColor:
            Colors.white.withOpacity(0.5), // Warna ikon tidak terpilih
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.bold), // Gaya teks terpilih
        unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.normal), // Gaya teks tidak terpilih
      ),
    );
  }
}
