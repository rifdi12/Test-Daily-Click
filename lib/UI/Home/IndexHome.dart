import 'dart:ui' as prefix0;

import 'package:fluttertest/Core/ViewModel/ListProductVM.dart';
import 'package:fluttertest/Helper/settingApp.dart';
import 'package:pigment/pigment.dart';
import 'package:provider/provider.dart';

class HomeIndex extends StatefulWidget {
  HomeIndex({Key key}) : super(key: key);

  @override
  _HomeIndexState createState() => _HomeIndexState();
}

class _HomeIndexState extends State<HomeIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Pigment.fromString('#191919'),
          title: Text('Test Daily Click List')
        ),
        body: BaseWidget<ListProductVM>(
          model: ListProductVM(api: Provider.of(context)),
          onModelReady: (model) => model.getPosts(),
          builder: (context, model, child) => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  // width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 2,
                        child: Text('ID',
                            style: TextStyle(
                                color: Colors.black38,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 2,
                        child: Text('Nama',
                            style: TextStyle(
                                color: Colors.black38,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 2,
                        child: Text('Umur',
                            style: TextStyle(
                                color: Colors.black38,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                      Flexible(
                        flex: 2,
                        child: Text('Salary',
                            style: TextStyle(
                                color: Colors.black38,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                      ),
                    ],
                  ),
                ),
                model.busy
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        reverse: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 20,
                        itemBuilder: (context, index) => Container(
                              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, 'focusemployee/${model.posts[index].id}');
                                },
                                child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Flexible(
                                        fit: FlexFit.tight,
                                        flex: 2,
                                        child: Text('${model.posts[index].id}',
                                            style: TextStyle(
                                                color: Colors.pink,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16)),
                                      ),
                                      Flexible(
                                        flex: 2,
                                        fit: FlexFit.tight,
                                        child: Text(
                                            '${model.posts[index].employeeName}',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16)),
                                      ),
                                      Flexible(
                                        flex: 2,
                                        fit: FlexFit.tight,
                                        child: Text(
                                            '${model.posts[index].employeeAge}',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16)),
                                      ),
                                      Flexible(
                                        flex: 2,
                                        fit: FlexFit.tight,
                                        child: Text(
                                            '${model.posts[index].employeeSalary}',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16)),
                                      ),
                                    ]),
                              ),
                            )),
                RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.pushNamed(context, 'create');
                  },
                  child: Text('Add employe',
                      style: TextStyle(color: Colors.white)),
                )
              ],
            ),
          ),
        ));
  }
}
