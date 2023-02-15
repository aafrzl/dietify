import 'package:diet_planner_app/utils/colors.dart';
import 'package:diet_planner_app/utils/constant_data.dart';
import 'package:diet_planner_app/utils/constant_widget.dart';
import 'package:diet_planner_app/utils/size_config.dart';
import 'package:diet_planner_app/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  Future<bool> _requestPop() {
    Navigator.of(context).pop();
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> students = [
      {'id': '10117005', 'name': 'AFRIZAL MUFRIZ FOUJI'},
      {'id': '10120015', 'name': 'MAHENDRA NUGRAHA'},
      {'id': '10120014', 'name': 'NURUL FAJAR'},
      {'id': '10120023', 'name': 'HIKAL MUHAMMAD ALFARIDZHI'},
      {'id': '10120028', 'name': 'MUHAMMAD FARHAN'},
    ];

    SizeConfig().init(context);
    double topMargin = getScreenPercentSize(context, 1);

    double profileHeight = getScreenPercentSize(context, 18);
    double defaultMargin = getScreenPercentSize(context, 2);

    double heightContainer = getScreenPercentSize(context, 22);

    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: getPrimaryAppBarText(context, 'Tentang Aplikasi Ini'),
          backgroundColor: statusBar,
          leading: IconButton(
            icon: const Icon(
              Icons.keyboard_backspace_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) => Stack(
              children: [
                ListView(
                  primary: true,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: (topMargin * 2)),
                      child: SizedBox(
                        height: profileHeight + (profileHeight / 6),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: profileHeight,
                            width: profileHeight,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/logo_unikom_kuning.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(defaultMargin),
                      child: Column(
                        children: [
                          Text(
                            'Dietify',
                            style: titleApp,
                          ),
                          SizedBox(
                            height: defaultMargin,
                          ),
                          Container(
                            height: heightContainer,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                getScreenPercentSize(context, 2),
                              ),
                              color: mealsBoxes,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(defaultMargin),
                              child: Text(
                                'Dietify adalah aplikasi yang dibuat untuk membantu pengguna dalam menentukan menu makanan yang sehat dan sesuai dengan kebutuhan tubuh. Aplikasi ini dibuat oleh kelompok mahasiswa Universitas Komputer Indonesia (UNIKOM) untuk memenuhi kebutuhan Tugas Besar Rekayasa Perangkat Lunak II (RPL II) yang beranggotakan:',
                                style: GoogleFonts.roboto(
                                  fontSize: getScreenPercentSize(context, 1.8),
                                  fontWeight: FontWeight.w400,
                                  color: textColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: defaultMargin,
                          ),
                          for (var student in students)
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              padding: EdgeInsets.all(defaultMargin),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: mealsBoxes,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                '${student['id']} - ${student['name']}',
                                style: GoogleFonts.roboto(
                                  fontSize: getScreenPercentSize(context, 2),
                                  fontWeight: FontWeight.w400,
                                  color: textColor,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: defaultMargin,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
