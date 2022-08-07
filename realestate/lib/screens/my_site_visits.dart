import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      appBar: AppBar(title: const Text("My site visits 1")),
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
          padding: const EdgeInsets.symmetric(horizontal: 5),
          physics: const BouncingScrollPhysics(),
          itemCount: controller.siteVisits.length,
          itemBuilder: ((context, index) {
            var w=MediaQuery.of(context).size.width;
            var h=MediaQuery.of(context).size.height;
            Color primaryColor = const Color(0xff1f7396);
            return
                   Container(
                     width: w,
                     margin: const EdgeInsets.all(5.0),
                     child: Card(
                       elevation: 3.0,
                       shape: const RoundedRectangleBorder(
                           borderRadius: BorderRadius.all(
                               Radius.circular(14.0))),
                       child:            Column(
                         mainAxisAlignment:
                         MainAxisAlignment.spaceEvenly,
                         children: [

                           const Divider(),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Row(
                               children: [
                                  Text(
                                   "Name : ",
                                   style: TextStyle(
                                       color: Colors.black54,
                                       fontSize: 13.0,
                                       fontWeight:
                                       FontWeight.bold),
                                 ),
                                 Text(
                                   controller.siteVisits.value[index].fullName.toString(),
                                   style: TextStyle(
                                       color: Colors
                                           .black54,
                                       fontSize: 15.0,
                                       fontWeight:
                                       FontWeight.bold),
                                 )
                               ],
                             ),
                           ),
                           const Divider(),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Row(
                               mainAxisAlignment:
                               MainAxisAlignment
                                   .spaceBetween,
                               children: [
                                 Row(
                                   children: [
                                     const Text(
                                       "Visit Time : ",
                                       style: TextStyle(
                                           color: Colors
                                               .black54,
                                           fontSize: 13.0,
                                           fontWeight:
                                           FontWeight
                                               .bold),
                                     ),
                                     Text(
                                         controller.siteVisits.value[index].visitTime.toString() ,
                                       style: TextStyle(
                                           color: Colors
                                               .black54,
                                           fontSize: 15.0,
                                           fontWeight:
                                           FontWeight
                                               .bold),
                                     )
                                   ],
                                 ),
                               ],
                             ),
                           ),
                           const Divider(),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Row(
                               mainAxisAlignment:
                               MainAxisAlignment
                                   .spaceBetween,
                               children: [
                                 Row(
                                   children: [
                             const Text(
                             "Contact Number : ",
                               style: TextStyle(
                                   color: Colors
                                       .black54,
                                   fontSize: 13.0,
                                   fontWeight:
                                   FontWeight
                                       .bold),
                             ),
                                     SizedBox(
                                       width: w * 0.02,
                                     ),
                                     Text(
                                       controller.siteVisits.value[index].contact.toString(),
                                       style: const TextStyle(
                                           color: Colors
                                               .black54,
                                           fontSize: 16.0,
                                           fontWeight:
                                           FontWeight
                                               .bold),
                                     )
                                   ],
                                 ),
                               ],
                             ),
                           ),
                           const Divider(),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Row(
                               mainAxisAlignment:
                               MainAxisAlignment
                                   .spaceBetween,
                               children: [
                                 Row(
                                   children: [
                                     const Text(
                                       "Enquiry Date : ",
                                       style: TextStyle(
                                           color: Colors
                                               .black54,
                                           fontSize: 13.0,
                                           fontWeight:
                                           FontWeight
                                               .bold),
                                     ),
                                     SizedBox(
                                       width: w * 0.01,
                                     ),
                                     Text(

                                         controller.siteVisits.value[index].enquiryDate.toString(),
                                         style: const TextStyle(
                                             color: Colors
                                                 .black54)),
                                   ],
                                 ),

                                 Row(
                                   children: [
                                     const Text(
                                       "Visit Date : ",
                                       style: TextStyle(
                                           color: Colors
                                               .black54,
                                           fontSize: 13.0,
                                           fontWeight:
                                           FontWeight
                                               .bold),
                                     ),
                                     SizedBox(
                                       width: w * 0.01,
                                     ),
                                     Text(

                                         controller.siteVisits.value[index].visitDate.toString(),
                                         style: const TextStyle(
                                             color: Colors
                                                 .black54)),
                                   ],
                                 )
                               ],
                             ),
                           ),
                         ],
                       ),


                     ),
                   );
//               Card(
//                 child: Column(
//                   children: [
//                     Text(controller.siteVisits[index].projectName),
//                     Text(controller.siteVisits[index].visitDate),
//                     Text(controller.siteVisits[index].visitTime),
//                   ],
//                 ),
//               );
          }),
        ),
      )),
    );
  }
}
