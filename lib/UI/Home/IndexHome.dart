import 'package:fluttertest/Core/Model/user.dart';
import 'package:fluttertest/Core/ViewModel/ListcarsVM.dart';
import 'package:fluttertest/Helper/settingApp.dart';
import 'package:indonesia/indonesia.dart';
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
        endDrawer: Drawer(
          child: new Column(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: primary,
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(Provider.of<User>(context)
                        .value[0]
                        .extraInfoList[0]
                        .appPicture),
                  ),
                  accountName: new Text(
                    "${Provider.of<User>(context).value[0].firstName}",
                    style: new TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.w500),
                  ),
                  accountEmail: new Text(
                    "${Provider.of<User>(context).value[0].email}",
                    style: new TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.w500),
                  )),
              new Column(children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacementNamed(context, 'login');
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.arrow_left,size: 35,color: secondary,),
                      Text('Keluar',style: TextStyle(color: secondary,fontSize: 18),),
                    ],
                  ),
                )
                ])
            ],
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Pigment.fromString('#191919'),
          title: Row(
            children: <Widget>[
              Image.asset('assets/img/index.png'),
            ],
          ),
        ),
        body: BaseWidget<ListCarsVM>(
            model: ListCarsVM(api: Provider.of(context)),
            onModelReady: (model) => model.getPosts(),
            builder: (context, model, child) => SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  model.busy
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                          itemCount: model.posts.length,
                          itemBuilder: (context, index) => Container(
                            // padding: EdgeInsets.all(20),
                            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(color: Colors.black54, blurRadius: 5)
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                    child: Image.network(
                                        '${model.posts[index].carImage}')),
                                Container(
                                    padding: EdgeInsets.all(15),
                                    child: Text(
                                      '${model.posts[index].carName}',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Divider(),
                                Container(
                                    padding: EdgeInsets.all(15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                            'IDR ${rupiah(model.posts[index].startFromPrice)}',
                                            style: TextStyle(
                                                color: Pigment.fromString('#e2ab10'),
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                        RaisedButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(5.0),
                                          ),
                                          color: primary,
                                          child: Text(
                                            'Choose',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          onPressed: () {},
                                        )
                                      ],
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Divider(),
                        Container(
                          color:Pigment.fromString('#e6e9ed'),
                          padding: EdgeInsets.all(20),
                          child: Text('Hidup terlalu pendek untuk mengendarai mobil yang itu-itu saja di Nemob anda dapat menyewa berbagai mobil spesial seperti Lamborghini, Ferrari, Lexus, Hummer, Range Rover, BMW, Mercedes Benz, Porsche dan masih banyak lagi pada Nemob App. Nemob ada untuk memudahkan Anda untuk menyewa mobil untuk keperluan liburan, pernikahan atau kebutuhan bisnis. Sewa mobil mewah menjadi lebih mudah di Nemob. Dapatkan harga terbaik, pesan sekarang!')),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            // height: 200,
                          padding: EdgeInsets.all(20),
                            color: secondary,
                            child:
                            Container(
                              child: Column(children: <Widget>[
                                Text('Best Destination',style: TextStyle(color: primary),),
                                 Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('Rent Car in Bali -',style: TextStyle(color: Colors.white)),
                                        Text(' Rent Car in Bandung',style: TextStyle(color: Colors.white)),
                                      ],
                                  
                                    ),
                                   Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('Rent Car in Semarang -',style: TextStyle(color: Colors.white)),
                                        Text(' Rent Car in Jakarta',style: TextStyle(color: Colors.white)),
                                      ],
                                  
                                    ), Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text('Rent Car in Medan -',style: TextStyle(color: Colors.white)),
                                        Text(' Rent Car in Yogyakarta',style: TextStyle(color: Colors.white)),
                                      ],
                                  
                                    ),
                          
                                
                              ],),
                            )
                          )
                ],
              ),
            ),
                  
                  ));
  }
}
