import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:rive_animation/model/CPModel.dart';
import 'package:rive_animation/screens/stock/CPAllCoinList.dart';
import 'package:rive_animation/screens/stock/CPMyWalletScreen.dart';
import 'package:rive_animation/screens/stock/CPStatisticScreen.dart';
import 'package:rive_animation/utils/CPDataProvider.dart';
import 'package:rive_animation/utils/CPImages.dart';
import 'package:rive_animation/utils/CPWidgets.dart';

class CPHomeFragment extends StatefulWidget {
  const CPHomeFragment({super.key});

  @override
  CPHomeFragmentState createState() => CPHomeFragmentState();
}

class CPHomeFragmentState extends State<CPHomeFragment> {
  List<CPDataModel> tradeCrypto = getTradeCryptoDataModel();
  List<CPDataModel> tradeCryptoName = getTradeCryptoNameDataModel();
  List<CPDataModel> myPortFolio = getMyPortFolioDataModel();

  int tradIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(Colors.transparent);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Have you invested today?", style: boldTextStyle(size: 18)),
        centerTitle: false,
        backgroundColor: context.cardColor,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                onPressed: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context) =>{}));
                },
                icon: const Icon(Icons.qr_code_scanner, size: 20)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color(0xff2972ff),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text(
                          "Your current balance",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xfffffcfc),
                          ),
                        ),
                        const Icon(Icons.remove_red_eye_outlined,
                                color: Color(0xffffffff), size: 22)
                            .onTap(
                          () {
                            const CPMyWalletScreen().launch(context,
                                pageRouteAnimation: PageRouteAnimation.Scale);
                          },
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "\$235,554",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        color: Color(0xffffffff),
                      ),
                    ),
                    const SizedBox(height: 16, width: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        investType(icon: Icons.upgrade, text: "Deposit"),
                        investType(
                            icon: Icons.download_outlined, text: "Withdraw"),
                        investType(
                            icon: Icons.refresh_outlined, text: "History"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16, width: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text(
                    "My Portfolio",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      CPAllCoinList().launch(context,
                          pageRouteAnimation:
                              PageRouteAnimation.SlideBottomTop);
                    },
                    child: const Text(
                      "See all",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xc42972ff),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 160,
              alignment: Alignment.center,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: myPortFolio.length,
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  CPDataModel data = myPortFolio[index];
                  return Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(4),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          offset: const Offset(0.1, 0.1),
                          blurRadius: 0.2,
                          spreadRadius: 0.2,
                        ),
                        BoxShadow(
                            color: context.cardColor,
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0),
                      ],
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                height: 35,
                                width: 35,
                                padding: const EdgeInsets.all(8),
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: data.bgColor),
                                child: Image.network(
                                    "https://www.pngitem.com/pimgs/m/242-2420764_nse-logo-hd-png-download.png",
                                    fit: BoxFit.cover),
                              ),
                              const SizedBox(width: 16),
                              Text(
                                data.currencyUnit!,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    data.totalAmount!,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.clip,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 4, width: 16),
                                  Text(
                                    data.cardName!,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.clip,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      color: Color(0xffa8a8a8),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16, width: 16),
                              Image.network(
                                  "https://thumbs.dreamstime.com/b/bar-graph-growth-chart-isolated-vector-icons-can-be-easily-modified-edit-129801736.jpg",
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ).onTap(
                    () {
                      CPStatisticScreen(model: data).launch(context,
                          pageRouteAnimation: PageRouteAnimation.Slide);
                    },
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                  );
                },
              ),
            ),
            const SizedBox(height: 16, width: 16),
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                "Recommended for you",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.normal,
                  fontSize: 16,
                ),
              ),
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: tradeCryptoName.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                CPDataModel data = tradeCryptoName[index];
                return Slidable(
                  actionPane: const SlidableDrawerActionPane(),
                  actionExtentRatio: 0.17,
                  secondaryActions: [
                    Image.asset(cp_eye, height: 20, width: 20)
                  ],
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16.0),
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      CPStatisticScreen(model: data).launch(context,
                          pageRouteAnimation: PageRouteAnimation.Slide);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(16),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: context.cardColor,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            offset: const Offset(0.1, 0.1),
                            blurRadius: 0.2,
                            spreadRadius: 0.2,
                          ), //BoxShadow
                          const BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            padding: const EdgeInsets.all(8),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: data.bgColor),
                            child: Image.network(
                                "https://www.pngitem.com/pimgs/m/242-2420764_nse-logo-hd-png-download.png"),
                          ),
                          const SizedBox(height: 16, width: 16),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  data.currencyName!,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  data.currencyUnit!,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.clip,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                    color: Color(0xffacacac),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                data.totalAmount!,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.clip,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 4, width: 16),
                              Container(
                                width: 65,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: const Color(0x1c969696),
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                      color: const Color(0x4dfffcfc), width: 1),
                                ),
                                child: Align(
                                  alignment: const Alignment(-0.1, 0.0),
                                  child: Text(
                                    data.percentage!,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 12,
                                      color: data.textColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
