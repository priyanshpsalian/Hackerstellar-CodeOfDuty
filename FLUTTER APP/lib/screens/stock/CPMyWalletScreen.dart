import 'package:flutter/material.dart';
import 'package:rive_animation/model/CPModel.dart';
import 'package:rive_animation/utils/CPDataProvider.dart';

class CPMyWalletScreen extends StatefulWidget {
  const CPMyWalletScreen({super.key});

  @override
  CPMyWalletScreenState createState() => CPMyWalletScreenState();
}

class CPMyWalletScreenState extends State<CPMyWalletScreen> {
  List<CPDataModel> myWalletData = getMyWalletDataModel();
  bool isShow = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //setStatusBarColor(CPPrimaryColor, statusBarIconBrightness: Brightness.light);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
    // setStatusBarColor(
    //   appStore.isDarkModeOn ? scaffoldDarkColor : Colors.transparent,
    //   statusBarIconBrightness: appStore.isDarkModeOn ? Brightness.light : Brightness.dark,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2972ff),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff2972ff),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: Color(0x00000000), width: 1),
        ),
        title: const Text(
          "My Wallet",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontStyle: FontStyle.normal,
            fontSize: 16,
            color: Color(0xffffffff),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          iconSize: 18,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
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
                      color: Color(0xffffffff),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      isShow = !isShow;
                      setState(() {});
                    },
                    icon: Icon(
                      isShow
                          ? Icons.remove_red_eye_outlined
                          : Icons.visibility_off_outlined,
                      color: const Color(0xffe6e3e3),
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: Text(
                isShow ? "\$385,142" : "",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.normal,
                  fontSize: 20,
                  color: Color(0xffffffff),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.all(0),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.0),
                    topRight: Radius.circular(32.0)),
              ),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 16, left: 16),
                      child: Text(
                        "Details",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: myWalletData.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        CPDataModel data = myWalletData[index];
                        return Container(
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(8),
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: data.bgColor!),
                                child: Image.asset(data.image!,
                                    fit: BoxFit.cover,
                                    alignment: Alignment.center),
                              ),
                              const SizedBox(height: 16, width: 16),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    data.currencyName!,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.clip,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 4, width: 16),
                                  Text(
                                    data.currencyUnit!,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.clip,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      color: Color(0xffa4a4a4),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
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
                                        fontWeight: FontWeight.w100,
                                        fontStyle: FontStyle.normal,
                                        fontSize: 14,
                                        color: Color(0xff919191),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
