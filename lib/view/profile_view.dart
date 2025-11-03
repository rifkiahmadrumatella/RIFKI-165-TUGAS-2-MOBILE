import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_theater/routes/app_pages.dart';
import '../controller/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> cinemas = [
      'XI CINEMA',
      'PONDOK KELAPA 21',
      'CGV',
      'CINEPOLIS',
      'CP MALL',
      'HERMES',
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF3D3D6E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFFFFC107)),
          onPressed: () {
            Get.offAllNamed(Routes.LOGIN);
          },
        ),

        title: Text(
          'THEATER',
          style: GoogleFonts.poppins(
            color: const Color(0xFFFFC107),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildLocationHeader(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              itemCount: cinemas.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: _buildCinemaCard(cinemas[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCinemaCard(String name) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: EdgeInsets.zero,
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          backgroundColor: const Color(0xFFEEEEEE),
          collapsedBackgroundColor: const Color(0xFFEEEEEE),

          title: Text(
            name,
            style: GoogleFonts.poppins(
              color: Colors.black87,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          iconColor: Colors.grey[700],
          collapsedIconColor: Colors.grey[700],

          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                'Tampilkan jadwal untuk $name...',
                style: GoogleFonts.poppins(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationHeader() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          const Icon(
            Icons.location_on_outlined,
            color: Color(0xFF3D3D6E),
            size: 28,
          ),
          const SizedBox(width: 12),
          Obx(
            () => Text(
              controller.locationName.value,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const Spacer(),
          Icon(Icons.keyboard_arrow_down, color: Colors.grey[700]),
        ],
      ),
    );
  }
}
