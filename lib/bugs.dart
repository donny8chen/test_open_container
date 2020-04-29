
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class BugPage extends StatefulWidget {
  BugPage({Key key}) : super(key: key);

  @override
  _BugPageState createState() => _BugPageState();
}

class _BugPageState extends State<BugPage> with TickerProviderStateMixin,AutomaticKeepAliveClientMixin{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildHomePage(context);
  }

  Widget _buildHomePage(BuildContext context){
    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar(){
    return AppBar(
      elevation: 0,
      brightness: Brightness.light,
      leading: IconButton(
        padding : const EdgeInsets.all(15.0),
        icon: const Icon(Icons.arrow_back,color: Colors.black,),
        alignment: Alignment.centerLeft,
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      centerTitle: true,
      title: Text('Home'),
    );
  }

  List<String> _datas = ['1111','2222','1111','2222','1111','2222'];

  Widget _buildBody(){
    return Container(
      child: ListView(
        padding: const EdgeInsets.only(bottom: 10),
        children: _datas.map<Widget>((f){
          return _ResultItem();
        }).toList(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}


class _ResultItem extends StatelessWidget {
  _ResultItem();

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      openBuilder: (BuildContext context,VoidCallback openContainer){
        return OrderDetailedPage(
        );
      },
      tappable: true,
      closedColor: Theme.of(context).scaffoldBackgroundColor,
      closedBuilder: (BuildContext context,VoidCallback openContainer){
        return Card(
          color: Colors.orange.shade200,
          margin: const EdgeInsets.only(left: 10,right: 10,top: 15),
          child: InkWell(
            onTap: openContainer,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                        margin:const EdgeInsets.only(right: 10,left: 10,bottom: 10),
                        child: Text('Now',style: TextStyle(fontSize: 12,color: Colors.white),),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10.0)),
                        ),
                      ),
                      Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text('2020.04.19日 12:00',
                              style: TextStyle(
                                  fontSize: 12,
                                  color:Colors.black54
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(height: 5,),
                  Container(
                    color: Colors.greenAccent,
                    child: ListView(
                      shrinkWrap: true,
                      //primary: false,
                      //reverse: false,
                      physics: NeverScrollableScrollPhysics(),
                      children: <Widget>[
                        Text('111',style: TextStyle(color: Colors.blue),),
                        Text('2222'),
                      ],
                    ),
                  ),
                  //const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.local_shipping,size: 18,),
                            const SizedBox(width: 5,),
                            Text('6.9',style: TextStyle(fontSize: 13,color: Colors.black87),),
                          ],
                        ),
                        const SizedBox(width: 8,),
                        Row(
                          children: <Widget>[
                            Icon(Icons.place,size: 18,),
                            Text('10',style: TextStyle(fontSize: 13,color: Colors.black87),),
                          ],
                        ),
                      ],),

                      Text('90',style: TextStyle(fontSize: 26,color: Colors.redAccent),)
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


class OrderDetailedPage extends StatefulWidget {

  OrderDetailedPage({Key key}) : super(key: key);

  @override
  _OrderDetailedPageState createState() => _OrderDetailedPageState();
}


class _OrderDetailedPageState extends State<OrderDetailedPage> with TickerProviderStateMixin{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar(){
    return AppBar(
      title: Text('Detailed'),
      elevation: 0,
      brightness: Brightness.light,
      backgroundColor: Colors.white,
      leading: IconButton(
        padding : const EdgeInsets.all(15.0),
        icon: const Icon(Icons.arrow_back,color: Colors.black,),
        alignment: Alignment.centerLeft,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _buildBody(){
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        //收货地址
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.only(left: 10,right: 10,top: 10),
            padding:  const EdgeInsets.only(left: 10,right: 10,top: 15),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('2020.4.17 11:11'),
                    Text('1113323232',style: TextStyle(fontSize: 12),),
                  ],
                ),
                const SizedBox(height: 5,),
                const Divider(),
              ],
            ),
          ),
        ),
      ],
    );
  }


}