import 'package:flutter/material.dart';
import 'package:fluttertest/Core/Service/Api.dart';
import 'package:pigment/pigment.dart';

class AddEmployee extends StatefulWidget {
  @override
  _AddEmployeeState createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  TextEditingController controllernama = TextEditingController();
  TextEditingController controllersalary = TextEditingController();
  TextEditingController controllerumur = TextEditingController();
  Api api = new Api();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Pigment.fromString('#191919'),
          title: Text('Test Daily Click Create'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Nama',style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold)),
            TextField(
              controller: controllernama,
            ),
            SizedBox(height: 20,),
            Text('Salary',style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold)),
            TextField(
              keyboardType: TextInputType.number,
              controller: controllersalary,
            ),

            SizedBox(height: 20,),
            Text('Umur',style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold)),
            TextField(
              keyboardType: TextInputType.number,
              controller: controllerumur,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              alignment: Alignment.center,
              child: RaisedButton(
                onPressed: ()async{
                 api.createemploye('${controllernama.text}', '${controllersalary.text}', '${controllerumur.text}',context);
                },
                color: Colors.pink,
                child: Text('Create',style: TextStyle(color: Colors.white),),
              ),
            )
          ],
        ),
      ),
      
    );
  }
}