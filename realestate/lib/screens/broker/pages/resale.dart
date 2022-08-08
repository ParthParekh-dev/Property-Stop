import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gif_view/gif_view.dart';
import 'package:propertystop/controllers/resale_list_viewmodel.dart';
import 'package:propertystop/models/response/propery_list_response.dart';
import 'package:propertystop/screens/broker/components/property_card.dart';
import 'package:propertystop/utils/constants.dart' as constants;

import '../../../add_property_bottomsheet.dart';

class ResalePage extends StatefulWidget {
  const ResalePage({Key? key}) : super(key: key);

  @override
  State<ResalePage> createState() => _ResalePageState();
}

class _ResalePageState extends State<ResalePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final controller = ResaleListViewModel();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabIndex);
    controller.getResalePropertyList();
    controller.getResaleClientList();
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: const Text(
                  "Resale",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                bottom: TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.white,
                  indicatorWeight: 3.0,
                  tabs: const [
                    Tab(text: "Resale Property"),
                    Tab(text: "Resale Client"),
                  ],
                ),
              ),
              body: TabBarView(
                controller: _tabController,
                children: [
                  Obx(() => SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 24,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: TextFormField(
                                  // controller: mobileNumberInput,
                                  style: Theme.of(context).textTheme.headline6,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    suffixIcon: const Icon(
                                      Icons.search,
                                      // color: constants.PRIMARY_COLOR,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    fillColor: constants.FIELD_COLOR,
                                    contentPadding: const EdgeInsets.all(12),
                                    hintText:
                                        "Search by location, area, pincode",
                                    hintStyle: const TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Expanded(
                                child: (controller.isPropertyLoading.value)
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: SizedBox(
                                              child: GifView.asset(
                                                'assets/gifs/logo_red.gif',
                                                height: 50,
                                                width: 50,
                                                frameRate:
                                                    30, // default is 15 FPS
                                              ),
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                        ],
                                      )
                                    : ListView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        itemCount: controller
                                            .resalePropertyList.length,
                                        itemBuilder: ((context, index) {
                                          var property = controller
                                              .resalePropertyList[index];
                                          return BrokerPropertyListCard(
                                            property: Datum(
                                                id: property.propId,
                                                projectName:
                                                    property.projectName,
                                                propType: "propType",
                                                propAddress: "",
                                                propCity: "propCity",
                                                propState: "propState",
                                                propCountry: "propCountry",
                                                buildFloors:
                                                    property.buildFloors,
                                                buildWings: 0,
                                                builderName: "builderName",
                                                possesssionDate:
                                                    "possesssionDate",
                                                buildStatusReady:
                                                    "buildStatusReady",
                                                uniqueId: property.uniqueId,
                                                propImg: "propImg",
                                                propRooms: "",
                                                downloadCls: "",
                                                downloadBrochure: "",
                                                downloadParameter: ""),
                                          );
                                        }),
                                      ),
                              )
                            ],
                          ),
                        ),
                      )),
                  Obx(() => SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 24,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: TextFormField(
                                  // controller: mobileNumberInput,
                                  style: Theme.of(context).textTheme.headline6,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    suffixIcon: const Icon(
                                      Icons.search,
                                      // color: constants.PRIMARY_COLOR,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    fillColor: constants.FIELD_COLOR,
                                    contentPadding: const EdgeInsets.all(12),
                                    hintText: "Search by client name",
                                    hintStyle: const TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Expanded(
                                child: (controller.isClientLoading.value)
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: SizedBox(
                                              child: GifView.asset(
                                                'assets/gifs/logo_red.gif',
                                                height: 50,
                                                width: 50,
                                                frameRate:
                                                    30, // default is 15 FPS
                                              ),
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                        ],
                                      )
                                    : ListView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        itemCount:
                                            controller.resaleClientList.length,
                                        itemBuilder: ((context, index) {
                                          var property = controller
                                              .resaleClientList[index];
                                          return Container(
                                            width: double.infinity,
                                            padding: const EdgeInsets.all(18.0),
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 8),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              boxShadow: const [
                                                BoxShadow(
                                                  offset: Offset(0, 2),
                                                  blurRadius: 12,
                                                  color: Colors.black12,
                                                ),
                                              ],
                                            ),
                                            child: Text(
                                              property.projectName,
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                              )
                            ],
                          ),
                        ),
                      ))
                ],
              ),
              floatingActionButton: FloatingActionButton(
                  shape: const StadiumBorder(),
                  onPressed: () {
                    // Navigator.pushNamed(context, resaleProperty);
                    showModalBottomSheet<dynamic>(
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: Colors.white,
                        context: context,
                        builder: (BuildContext bc) {
                          return Wrap(children: const [Addpropertylist()]);
                        });
                  },
                  backgroundColor: constants.PRIMARY_COLOR,
                  child: const Icon(
                    Icons.add_business,
                    size: 24.0,
                  ))),
        ),
      ),
    );
  }
}
