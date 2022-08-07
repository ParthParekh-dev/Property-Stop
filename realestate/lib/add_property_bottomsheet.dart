import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:propertystop/utils/constants.dart' as constants;
class Addpropertylist extends StatefulWidget {
  const Addpropertylist({Key? key}) : super(key: key);

  @override
  State<Addpropertylist> createState() => _AddpropertylistState();
}

class _AddpropertylistState extends State<Addpropertylist> {
  String? room;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:SafeArea(
      child: Column(
        children: [
          Text("I Have a resale property" ,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
        SizedBox(height: 10,),
          TextField(
            decoration: new InputDecoration(
              prefixIcon: Icon(Icons.search_rounded),
              labelText: "Add Building/Society",
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
          ),

          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: double.infinity - 50,
            child: DropdownButtonFormField<String>(
              isExpanded: false,
              items: [
                buildMenuItem("1 BHK"),
                buildMenuItem("2 BHK"),
                buildMenuItem("3 BHK"),
                buildMenuItem("4 BHK"),
                buildMenuItem("5 BHK"),
                buildMenuItem("6 BHK"),
                buildMenuItem("7 BHK"),
                buildMenuItem("8 BHK")
              ],
              onChanged: (value) => setState(() {
                room = value;
              }),
              value: room,
              hint: const Text(
                "Select Room",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.cabin),
                labelText: "Select Room",
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            decoration: new InputDecoration(
              prefixIcon: Icon(Icons.currency_rupee),
              labelText: "Price",
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            decoration: new InputDecoration(
              prefixIcon: Icon(Icons.area_chart_sharp),
              labelText: "Carpet Area",
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
          ),
SizedBox(height: 10,),
          TextField(
              keyboardType:TextInputType.number,
            decoration: new InputDecoration(
              prefixIcon: Icon(Icons.numbers),
              labelText: "Enter Floar Number",
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
          ),

        ],
      ),
    )
      ,);
  }
  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
