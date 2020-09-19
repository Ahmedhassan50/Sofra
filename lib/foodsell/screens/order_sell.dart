import 'package:flutter/material.dart';
import 'package:sofra/foodsell/widgets/order_sell.dart';

class OrderSell extends StatefulWidget {
  static const routename = '/Order-sell';
  @override
  _OrderSellState createState() => _OrderSellState();
}

class _OrderSellState extends State<OrderSell>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.grey[300]),
              child: TabBar(
                  indicatorWeight: 3,
                  labelPadding: EdgeInsets.symmetric(vertical: 10),
                  controller: _tabController,
                  tabs: [
                    Text('طلبات جديدة'),
                    Text('طلبات حالية'),
                    Text('طلبات سابقة'),
                  ]),
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: [
                _neworders(),
                _currentOrders(),
                _lastOrders(),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _neworders() {
    return Orders(
      children: <Widget>[
        RaisedButton.icon(
            color: Colors.red,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {},
            icon: Icon(
              Icons.phone,
              color: Colors.white,
            ),
            label: Text(
              'اتصال',
              style: TextStyle(color: Colors.white),
            )),
        RaisedButton.icon(
            color: Colors.green[700],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {},
            icon: Icon(Icons.thumb_up, color: Colors.white),
            label: Text(
              'قبول',
              style: TextStyle(color: Colors.white),
            )),
        RaisedButton.icon(
            color: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {},
            icon: Icon(Icons.close, color: Colors.white),
            label: Text(
              'رفض',
              style: TextStyle(color: Colors.white),
            )),
      ],
    );
  }

  Widget _currentOrders() {
    return Orders(
      children: <Widget>[
        RaisedButton.icon(
            color: Colors.red,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {},
            icon: Icon(
              Icons.phone,
              color: Colors.white,
            ),
            label: Text(
              '01272262950',
              style: TextStyle(color: Colors.white),
            )),
        RaisedButton.icon(
            color: Colors.green[700],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {},
            icon: Icon(Icons.thumb_up, color: Colors.white),
            label: Text(
              'تاكيد التسليم',
              style: TextStyle(color: Colors.white),
            )),
      ],
    );
  }

  Widget _lastOrders() {
    return Orders(
      children: <Widget>[
        RaisedButton(
            color: Colors.green[700],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: () {},
            child: Text(
              'الطلب مكتمل',
              style: TextStyle(color: Colors.white),
            )),
      ],
    );
  }
}
