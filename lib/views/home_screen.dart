import 'package:expendituretracker/resources/data.dart';
import 'package:expendituretracker/resources/input_data.dart';
import 'package:expendituretracker/resources/strings/app_strings.dart';
import 'package:expendituretracker/routes/routes.dart';
import 'package:expendituretracker/styles/app_colors.dart';
import 'package:expendituretracker/styles/app_fonts.dart';
import 'package:expendituretracker/styles/spacing.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Data(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              AppStrings.appbarTitle,
              style: TextStyle(fontFamily: AppFonts.inter, letterSpacing: 1.0),
            ),
            backgroundColor: AppColors.thickBlue,
          ),
          endDrawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  child: Column(
                    children: const [
                      Icon(Icons.graphic_eq,
                          size: 60.0, color: AppColors.thickBlue),
                      Text(
                        AppStrings.title,
                        style: TextStyle(
                            fontSize: FontSize.large40,
                            fontFamily: AppFonts.gelasio,
                            fontWeight: AppFontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const Divider(
                    color: AppColors.black, height: 1.0, thickness: 1.0),
                Spacing.sizeBoxHt8,
                ListTile(
                  leading: const Icon(Icons.edit, color: AppColors.black),
                  title: const Text(
                    AppStrings.updateData,
                    style: TextStyle(
                      fontSize: FontSize.large25,
                      fontWeight: AppFontWeight.normal,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.dataInputScreen);
                  },
                ),
              ],
            ),
          ),
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacing.sizeBoxHt10,
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: SfCircularChart(
                    legend: Legend(
                        isVisible: true, position: LegendPosition.bottom),
                    series: <CircularSeries>[
                      PieSeries<ChartData, String>(
                        radius: '100%',
                        dataSource: Data().chartData,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        dataLabelSettings:
                            const DataLabelSettings(isVisible: true),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
                  child: Text(
                    AppStrings.tbTitle,
                    style: TextStyle(
                      fontSize: FontSize.large25,
                      fontFamily: AppFonts.inter,
                      letterSpacing: 1.0,
                      fontWeight: AppFontWeight.semiBold1,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: ListView.builder(
                    itemCount: Provider.of<Data>(context).chartData.length,
                    itemBuilder: (context, index) {
                      var item = Provider.of<Data>(context).chartData[index];
                      return TableRow(
                          name: item.x, amount: item.y, image: item.icon);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class TableRow extends StatelessWidget {
  const TableRow(
      {Key? key, required this.name, required this.amount, required this.image})
      : super(key: key);

  final String? name;
  final double? amount;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            AppColors.primary.withOpacity(0.3),
            AppColors.thickBlue.withOpacity(0.5),
          ]),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 5.0, left: 10.0, right: 10.0, bottom: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                      radius: 25.0,
                      child: Image.asset(
                        image ?? '',
                        width: 35.0,
                        height: 35.0,
                      )),
                  Spacing.sizeBoxWt15,
                  Text(
                    name ?? '',
                    style: const TextStyle(
                      fontSize: FontSize.large20,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '$amount',
                    style: const TextStyle(
                      fontSize: FontSize.large20,
                      color: AppColors.white,
                    ),
                  ),
                  //Icon(Icons.money_round),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
