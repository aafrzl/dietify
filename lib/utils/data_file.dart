import 'package:flutter/cupertino.dart';

import '../models/diet_model.dart';
import '../models/intro_model.dart';

class DataFile {
  static List<IntroModel> getIntroModel(BuildContext context) {
    List<IntroModel> introList = [];

    IntroModel mainModel = IntroModel();
    mainModel.id = 1;
    mainModel.name = "Selamat Datang!";
    mainModel.image = "assets/images/img_1.0.png";
    mainModel.desc =
        "Anda tidak perlu khawatir tentang rencana diet Anda, di aplikasi ini Anda akan dipandu dengan benar untuk menambah atau mengurangi berat badan Anda.";
    introList.add(mainModel);

    mainModel = IntroModel();
    mainModel.id = 2;
    mainModel.name = "Renacanakan makanan Anda dengan mudah";
    mainModel.image = "assets/images/img_2.0.png";
    mainModel.desc =
        "Hasilkan rencana diet tanpa waktu dan dapatkan semua makanan bersama bahan yang Anda butuhkan.";
    introList.add(mainModel);
    return introList;
  }

  static getGender() {
    List<DietModel> list = [];

    DietModel model = DietModel();
    model.title = "Laki-Laki";
    model.subTitle = "male.png";
    list.add(model);

    model = DietModel();
    model.title = "Perempuan";
    model.subTitle = "female.png";
    list.add(model);

    return list;
  }

  static increaseWeightGoal() {
    List<DietModel> list = [];

    DietModel model = DietModel();
    model.title = "0.5";
    list.add(model);

    model = DietModel();
    model.title = "1.0";
    list.add(model);

    model = DietModel();
    model.title = "1.5";
    list.add(model);

    model = DietModel();
    model.title = "2.0";
    list.add(model);

    return list;
  }

  static conditionConcerned() {
    List<DietModel> list = [];

    DietModel model = DietModel();
    model.title = "Penyakit Jantung";
    list.add(model);

    model = DietModel();
    model.title = "Obesitas";
    list.add(model);

    model = DietModel();
    model.title = "Diabetes";
    list.add(model);

    model = DietModel();
    model.title = "Tidak ada(Sehat)";
    list.add(model);

    return list;
  }

  static getUsersPreferences() {
    List<DietModel> list = [];

    DietModel model = DietModel();
    model.title = "Saya mau menaikan berat badan";
    list.add(model);

    model = DietModel();
    model.title = "Saya mau menurunkan berat badan";
    list.add(model);

    return list;
  }
}
