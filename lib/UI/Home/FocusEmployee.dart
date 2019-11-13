import 'package:fluttertest/Core/Service/Api.dart';
import 'package:fluttertest/Core/ViewModel/FocusEmployee.dart';
import 'package:fluttertest/Core/ViewModel/ListProductVM.dart';
import 'package:fluttertest/Helper/settingApp.dart';
import 'package:pigment/pigment.dart';
import 'package:provider/provider.dart';

class FocusEmployee extends StatefulWidget {
  final id;
  FocusEmployee({Key key, this.id}) : super(key: key);

  @override
  _FocusEmployeeState createState() => _FocusEmployeeState();
}

class _FocusEmployeeState extends State<FocusEmployee> {
  Api api = Api();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Pigment.fromString('#191919'),
          title: Text('Test Daily Click View')
        ),
        body: BaseWidget<FocusEmployeVM>(
          model: FocusEmployeVM(api: Provider.of(context),id: widget.id),
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
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 1,
                        itemBuilder: (context, index) => Container(
                              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  // mainAxisAlignment:
                                  //     MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Flexible(
                                      fit: FlexFit.tight,
                                      flex: 2,
                                      child: Text('${model.posts.id}',
                                          style: TextStyle(
                                              color: Colors.pink,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                    ),
                                    Flexible(
                                      flex: 2,
                                      fit: FlexFit.tight,
                                      child: Text(
                                          '${model.posts.employeeName}',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                    ),
                                    Flexible(
                                      flex: 2,
                                      fit: FlexFit.tight,
                                      child: Text(
                                          '${model.posts.employeeAge}',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                    ),
                                    Flexible(
                                      flex: 2,
                                      fit: FlexFit.tight,
                                      child: Text(
                                          '${model.posts.employeeSalary}',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16)),
                                    ),
                                  ]),
                            )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.red,
                      onPressed: () {
                        api.delete(widget.id,context);
                      },
                      child: Text('Delete',
                          style: TextStyle(color: Colors.white)),
                    ),
                    RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.pushNamed(context, 'edit/${model.posts.id}/${model.posts.employeeName}/${model.posts.employeeAge}/${model.posts.employeeSalary}');
                  },
                  child: Text('Edit',
                      style: TextStyle(color: Colors.white)),
                )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
