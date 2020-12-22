import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sofra/foodrequest/provider/auth_user.dart';
import '../widgets/current_order.dart';

class OrdersScreen extends StatefulWidget {
  static const routename = '/Order-screen';
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabcontroller;

  @override
  void initState() {
    _tabcontroller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.grey[300]),
          child: TabBar(
              indicatorWeight: 3,
              labelPadding: EdgeInsets.symmetric(vertical: 10),
              controller: _tabcontroller,
              tabs: [
                Text('طلبات حالية'),
                Text('طلبات سابقة'),
              ]),
        ),
        Expanded(
          child: TabBarView(controller: _tabcontroller, children: [
            Provider.of<AuthUser>(context, listen: false).isAuth
                ? CurrentOrder()
                : Center(
                    child: Text('الرجاء تسجيل الدخول'),
                  ),
            _lastOrders(),
          ]),
        )
      ],
    );
  }

  Widget _lastOrders() {
    return ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        itemCount: 10,
        itemBuilder: (ctx, i) => Container(
              padding: EdgeInsets.only(bottom: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 2, color: Colors.grey[200]))),
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.pink,
                    backgroundImage:
                        AssetImage('assets/images/homebackground2.jpg'),
                    maxRadius: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      direction: Axis.vertical,
                      children: <Widget>[
                        Text(
                          'وجبة تشيز بيرجر',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          'رقم الطلب :12356',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          'الاجمالي :100 جنية',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}
