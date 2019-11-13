import 'package:flutter/material.dart';
import 'package:fluttertest/Core/Service/Api.dart';
import 'package:pigment/pigment.dart';

class EditProduct extends StatefulWidget {
  final id;
  final nama;
  final umur;
  final gaji;

  const EditProduct({Key key, this.id, this.nama, this.umur, this.gaji}) : super(key: key);
  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  Api api = new Api();
  @override
  Widget build(BuildContext context) {

  TextEditingController controllernama = TextEditingController(text: '${widget.nama}');
  TextEditingController controllersalary = TextEditingController(text: '${widget.gaji}');
  TextEditingController controllerumur = TextEditingController(text: '${widget.umur}');
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Pigment.fromString('#191919'),
          title: Text('Test Daily Click Edit'),
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
                 api.editemploye('${widget.id}','${controllernama.text}', '${controllersalary.text}', '${controllerumur.text}',context);
                },
                color: Colors.pink,
                child: Text('Edit',style: TextStyle(color: Colors.white),),
              ),
            )
          ],
        ),
      ),
      
    );
  }
}