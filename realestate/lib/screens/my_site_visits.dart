import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:propertystop/controllers/my_site_visit_viewmodel.dart';

class MySiteVisits extends StatefulWidget {
  const MySiteVisits({Key? key}) : super(key: key);

  @override
  State<MySiteVisits> createState() => _MySiteVisitsState();
}

class _MySiteVisitsState extends State<MySiteVisits> {
  var controller = MySiteVisitsViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My site visits")),
      body: Obx(() => (controller.isLoading.value)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Center(child: (CircularProgressIndicator())),
              ],
            )
          : SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                physics: const BouncingScrollPhysics(),
                itemCount: controller.siteVisits.length,
                itemBuilder: ((context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Text(controller.siteVisits[index].projectName),
                        Text(controller.siteVisits[index].visitDate),
                        Text(controller.siteVisits[index].visitTime),
                      ],
                    ),
                  );
                }),
              ),
            )),
    );
  }
}
