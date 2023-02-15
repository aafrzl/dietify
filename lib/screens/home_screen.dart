import 'package:diet_planner_app/models/daily_plans_models.dart';
import 'package:diet_planner_app/screens/meals_ingridents.dart';
import 'package:diet_planner_app/utils/pref_data.dart';
import 'package:diet_planner_app/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../utils/colors.dart';
import '../utils/constant_widget.dart';
import 'profil_page.dart';
import 'package:restart_app/restart_app.dart';

List<double> trackCalorie = [
  0.0,
  0.0,
  0.0,
  0.0,
  0.0,
  0.0,
  0.0,
];

class MealsTime {
  MealsTime({this.breakfast = true, this.dinner = true, this.lunch = true});
  bool? breakfast;
  bool? lunch;
  bool? dinner;
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.dailyPlans}) : super(key: key);

  final DailyPlans? dailyPlans;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();
  int page = 0; // HomeSreen

  @override
  void initState() {
    super.initState();
    animateToPageMethod(page);
    getData();
  }

  List<MealsTime> mealsTime = [
    MealsTime(),
    MealsTime(),
    MealsTime(),
    MealsTime(),
    MealsTime(),
    MealsTime(),
    MealsTime(),
  ];

  List<int> friId = [];
  List<int> satId = [];
  List<int> sunId = [];
  List<int> monId = [];
  List<int> tueId = [];
  List<int> wenId = [];
  List<int> thuId = [];

  late List<List<int>> mealsIngridentsID = [
    friId,
    satId,
    sunId,
    monId,
    tueId,
    wenId,
    thuId
  ];

  /// meals = [[1,2,3],[4,3,7]];

  getData() async {
    if (widget.dailyPlans.hashCode == 2011) {
      const Center(
        child: ListTile(
          leading: Icon(
            Icons.wifi_off,
            size: 55,
          ),
          title: Text('Some error occurred!'),
          subtitle: Text('Silahkan periksa internet Anda dan coba lagi.'),
        ),
      );
    } else {
      for (var element in widget.dailyPlans!.week!.friday!.meals!) {
        mealsIngridentsID[0].add(element.id!);
      }
      for (var element in widget.dailyPlans!.week!.saturday!.meals!) {
        mealsIngridentsID[1].add(element.id!);
      }
      for (var element in widget.dailyPlans!.week!.sunday!.meals!) {
        mealsIngridentsID[2].add(element.id!);
      }
      for (var element in widget.dailyPlans!.week!.monday!.meals!) {
        mealsIngridentsID[3].add(element.id!);
      }
      for (var element in widget.dailyPlans!.week!.tuesday!.meals!) {
        mealsIngridentsID[4].add(element.id!);
      }
      for (var element in widget.dailyPlans!.week!.wednesday!.meals!) {
        mealsIngridentsID[5].add(element.id!);
      }
      for (var element in widget.dailyPlans!.week!.thursday!.meals!) {
        mealsIngridentsID[6].add(element.id!);
      }
    }
  }

  animateToPageMethod(int index) {
    if (pageController.hasClients) {
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<double> calories = [];
    List<double> fat = [];
    List<double> protein = [];
    List<double> carbo = [];

    if (widget.dailyPlans.hashCode == 2011) {
      const Center(
        child: ListTile(
          leading: Icon(
            Icons.wifi_off,
            size: 55,
          ),
          title: Text('Some error occurred!'),
          subtitle: Text('Silahkan periksa internet Anda dan coba lagi.'),
        ),
      );
    } else {
      calories = [
        widget.dailyPlans!.week!.friday!.nutrients!.calories!,
        widget.dailyPlans!.week!.friday!.nutrients!.calories!,
        widget.dailyPlans!.week!.saturday!.nutrients!.calories!,
        widget.dailyPlans!.week!.sunday!.nutrients!.calories!,
        widget.dailyPlans!.week!.monday!.nutrients!.calories!,
        widget.dailyPlans!.week!.tuesday!.nutrients!.calories!,
        widget.dailyPlans!.week!.wednesday!.nutrients!.calories!,
        widget.dailyPlans!.week!.thursday!.nutrients!.calories!,
      ];

      fat = [
        widget.dailyPlans!.week!.friday!.nutrients!.fat!,
        widget.dailyPlans!.week!.saturday!.nutrients!.fat!,
        widget.dailyPlans!.week!.sunday!.nutrients!.fat!,
        widget.dailyPlans!.week!.monday!.nutrients!.fat!,
        widget.dailyPlans!.week!.tuesday!.nutrients!.fat!,
        widget.dailyPlans!.week!.wednesday!.nutrients!.fat!,
        widget.dailyPlans!.week!.thursday!.nutrients!.fat!,
      ];

      protein = [
        widget.dailyPlans!.week!.friday!.nutrients!.protein!,
        widget.dailyPlans!.week!.saturday!.nutrients!.protein!,
        widget.dailyPlans!.week!.sunday!.nutrients!.protein!,
        widget.dailyPlans!.week!.monday!.nutrients!.protein!,
        widget.dailyPlans!.week!.tuesday!.nutrients!.protein!,
        widget.dailyPlans!.week!.wednesday!.nutrients!.protein!,
        widget.dailyPlans!.week!.thursday!.nutrients!.protein!,
      ];

      carbo = [
        widget.dailyPlans!.week!.friday!.nutrients!.carbohydrates!,
        widget.dailyPlans!.week!.saturday!.nutrients!.carbohydrates!,
        widget.dailyPlans!.week!.sunday!.nutrients!.carbohydrates!,
        widget.dailyPlans!.week!.monday!.nutrients!.carbohydrates!,
        widget.dailyPlans!.week!.tuesday!.nutrients!.carbohydrates!,
        widget.dailyPlans!.week!.wednesday!.nutrients!.carbohydrates!,
        widget.dailyPlans!.week!.thursday!.nutrients!.carbohydrates!,
      ];
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.020,
            fontWeight: FontWeight.bold),
        unselectedLabelStyle:
            TextStyle(fontSize: MediaQuery.of(context).size.height * 0.017),
        selectedItemColor: statusBar,
        onTap: (currentPage) async {
          animateToPageMethod(currentPage);
          setState(() {});
        },
        currentIndex: page,
        items: [
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset('assets/navIcon/a-home.svg',
                  height: MediaQuery.of(context).size.height * 0.035,
                  width: MediaQuery.of(context).size.width * 0.035,
                  color: statusBar),
              icon: SvgPicture.asset(
                'assets/navIcon/home.svg',
                height: MediaQuery.of(context).size.height * 0.03,
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset('assets/navIcon/a-profile.svg',
                  height: MediaQuery.of(context).size.height * 0.035,
                  width: MediaQuery.of(context).size.width * 0.035,
                  color: statusBar),
              icon: SvgPicture.asset(
                'assets/navIcon/profile.svg',
                height: MediaQuery.of(context).size.height * 0.03,
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              label: 'Profil')
        ],
      ),
      body: widget.dailyPlans != null
          ? SafeArea(
              child: PageView(
                onPageChanged: (selectedPage) {
                  page = selectedPage;
                  setState(() {});
                },
                scrollDirection: Axis.horizontal,
                controller: pageController,
                children: [
                  DailyMealsPlan(
                    calories: calories,
                    fat: fat,
                    protein: protein,
                    carbo: carbo,
                    mealsTime: mealsTime,
                    mealsIngridentIDs: mealsIngridentsID,
                  ),
                  ProfilPage(
                    key: UniqueKey(),
                  )
                ],
              ),
            )
          : Center(
              child: ListTile(
                leading: const Icon(
                  Icons.wifi_off,
                  size: 45,
                ),
                title: const Text(
                    'Silahkan koneksikan internet Anda dan coba lagi.'),
                subtitle: GestureDetector(
                  onTap: () {
                    Restart.restartApp();
                  },
                  child: const Text(
                    'Coba lagi!',
                    style: TextStyle(
                        color: statusBar, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
    );
  }
}

class DailyMealsPlan extends StatefulWidget {
  const DailyMealsPlan(
      {Key? key,
      required this.calories,
      required this.fat,
      required this.protein,
      required this.carbo,
      required this.mealsTime,
      required this.mealsIngridentIDs})
      : super(key: key);

  final List<double> calories;
  final List<double> fat;
  final List<double> protein;
  final List<double> carbo;
  final List<MealsTime> mealsTime;
  final List<List<int>> mealsIngridentIDs;

  @override
  State<DailyMealsPlan> createState() => _DailyMealsPlanState();
}

class _DailyMealsPlanState extends State<DailyMealsPlan> {
  save() async {
    List<String> myListOfStrings =
        trackCalorie.map((i) => i.toString()).toList();
    await PrefData.setDailyCalorie(myListOfStrings);
  }

  @override
  void initState() {
    super.initState();
    List<String> myList = (PrefData.getDailyCalorie() ?? <String>[]);
    trackCalorie = myList.map((i) => double.parse(i)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) => SizedBox(
        child: PageView.builder(
          itemCount: 7,
          itemBuilder: (ctx, index) => Column(
            children: [
              Container(
                height: constraints.maxHeight * 0.3,
                decoration: const BoxDecoration(
                  color: statusBar,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  ),
                ),
                child: Stack(
                  children: [
                    SfRadialGauge(
                      axes: [
                        RadialAxis(
                          showTicks: false,
                          minimum: 0,
                          maximum: widget.calories[index],
                          showLabels: false,
                          startAngle: 180,
                          endAngle: 0,
                          radiusFactor: 1.23,
                          canScaleToFit: true,
                          axisLineStyle: const AxisLineStyle(
                            thickness: 0.03,
                            color: Colors.white24,
                            thicknessUnit: GaugeSizeUnit.factor,
                            cornerStyle: CornerStyle.bothCurve,
                          ),
                          pointers: <GaugePointer>[
                            RangePointer(
                                color: Colors.white,
                                value: trackCalorie[index],
                                width: 0.03,
                                sizeUnit: GaugeSizeUnit.factor,
                                cornerStyle: CornerStyle.bothCurve)
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LimitedBox(
                          child: getCalorieLabel(
                              trackCalorie[index].round().toString(),
                              constraints),
                        ),
                        getCalorieSubtitle(
                            widget.calories[index].round().toString(),
                            constraints),
                        SizedBox(height: constraints.maxHeight * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            UserInfo(
                                index: index,
                                info: widget.protein,
                                label: 'Protein',
                                color: Colors.redAccent),
                            UserInfo(
                              index: index,
                              info: widget.fat,
                              label: 'Lemak',
                              color: Colors.amber,
                            ),
                            UserInfo(
                                index: index,
                                info: widget.carbo,
                                label: 'Carbo',
                                color: Colors.lightBlue)
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.05,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth * 0.05),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/ios_arrow_left.svg',
                          height: constraints.maxHeight * 0.020,
                          width: constraints.maxWidth * 0.020,
                        ),
                        getDay(index, constraints),
                        SvgPicture.asset(
                          'assets/icons/ios_arrow_right.svg',
                          height: constraints.maxHeight * 0.020,
                          width: constraints.maxWidth * 0.020,
                        ),
                      ],
                    ),
                    SizedBox(height: constraints.maxHeight * 0.05),
                    SizedBox(
                      height: constraints.maxHeight * 0.55,
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          MealsWidget(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) => DishDetailPage(
                                    id: widget.mealsIngridentIDs[index][0],
                                    protein: widget.protein[index],
                                    fat: widget.fat[index],
                                    carbo: widget.carbo[index],
                                    appBarTitle: 'Sarapan',
                                  ),
                                ),
                              );
                            },
                            onTap: () {
                              if (widget.mealsTime[index].breakfast == true) {
                                trackCalorie[index] +=
                                    (widget.calories[index] / 3);
                                save();
                                setState(() {});
                                widget.mealsTime[index].breakfast = false;
                              } else {
                                showSnackBar(context, 'Anda sudah sarapan',
                                    Colors.black54, false);
                              }
                            },
                            constraints: constraints,
                            title: 'Sarapan',
                            subtitle: widget.calories[index] / 3,
                            imgPath: 'assets/meals/breakfast.svg',
                          ),
                          MealsWidget(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (ctx) => DishDetailPage(
                                        id: widget.mealsIngridentIDs[index][1],
                                        protein: widget.protein[index],
                                        fat: widget.fat[index],
                                        carbo: widget.carbo[index],
                                        appBarTitle: 'Makan Siang',
                                      ),
                                    ));
                              },
                              onTap: () {
                                if (widget.mealsTime[index].lunch == true) {
                                  trackCalorie[index] +=
                                      (widget.calories[index] / 3);
                                  save();
                                  setState(() {});

                                  widget.mealsTime[index].lunch = false;
                                } else {
                                  showSnackBar(
                                      context,
                                      'Anda sudah makan siang',
                                      Colors.black54,
                                      false);
                                }
                              },
                              constraints: constraints,
                              title: 'Makan Siang',
                              subtitle: widget.calories[index].round() / 3,
                              imgPath: 'assets/meals/lunch.svg'),
                          MealsWidget(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (ctx) => DishDetailPage(
                                      id: widget.mealsIngridentIDs[index][2],
                                      protein: widget.protein[index],
                                      fat: widget.fat[index],
                                      carbo: widget.carbo[index],
                                      appBarTitle: 'Makan Malam',
                                    ),
                                  ),
                                );
                              },
                              onTap: () {
                                if (widget.mealsTime[index].dinner == true) {
                                  trackCalorie[index] +=
                                      (widget.calories[index] / 3);
                                  save();
                                  setState(() {});

                                  widget.mealsTime[index].dinner = false;
                                } else {
                                  showSnackBar(
                                      context,
                                      'Anda sudah makan malam',
                                      Colors.black54,
                                      false);
                                }
                              },
                              constraints: constraints,
                              title: 'Makan Malam',
                              subtitle: widget.calories[index].round() / 3,
                              imgPath: 'assets/meals/dinner.svg'),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo(
      {Key? key, required this.info, this.label, this.color, this.index})
      : super(key: key);

  final List<double> info;
  final String? label;
  final Color? color;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.009),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
              backgroundColor: color!.withOpacity(0.9),
              radius: MediaQuery.of(context).size.height * 0.005),
          SizedBox(
            width: MediaQuery.of(context).size.height * 0.009,
          ),
          FittedBox(
            child: Text(
              '$label : ${info[index!].round()}',
              style: GoogleFonts.roboto(
                fontSize: MediaQuery.of(context).size.height * 0.016,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MealsWidget extends StatelessWidget {
  const MealsWidget({
    Key? key,
    required this.constraints,
    required this.title,
    required this.imgPath,
    required this.subtitle,
    required this.onTap,
    required this.onPressed,
  }) : super(key: key);

  final BoxConstraints constraints;
  final String title;
  final String imgPath;
  final double subtitle;
  final VoidCallback onTap;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
        child: Container(
          height: constraints.maxHeight * 0.2,
          width: constraints.maxWidth,
          decoration: BoxDecoration(
            color: mealsBoxes,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth * 0.05,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: constraints.maxHeight * 0.05,
                          width: constraints.maxWidth * 0.25,
                          child: SvgPicture.asset(
                            imgPath,
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.01,
                        ),
                        LimitedBox(
                          child: Text(
                            title,
                            style: GoogleFonts.roboto(
                              fontSize: constraints.maxHeight * 0.04,
                              color: const Color(0xB31E1E1E),
                            ),
                          ),
                        ),
                        LimitedBox(
                          child: Text('${subtitle.round()} kKal',
                              style: GoogleFonts.roboto(
                                fontSize: constraints.maxHeight * 0.02,
                                color: const Color(0xB31E1E1E),
                              )),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: constraints.maxWidth * 0.025,
                        bottom: constraints.maxHeight * 0.012),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        height: constraints.maxHeight * 0.05,
                        width: constraints.maxWidth * 0.1,
                        child: CircleAvatar(
                          backgroundColor: mealBoxAddButtonColor,
                          child: IconButton(
                            icon: SvgPicture.asset('assets/icon_plus.svg'),
                            onPressed: onTap,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
