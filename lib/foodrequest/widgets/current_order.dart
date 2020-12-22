import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sofra/foodrequest/provider/order_provider.dart';

class CurrentOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<OrderProvider>(context, listen: false).fechOrders(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('an error'),
          );
        } else if (snapshot.hasData) {
          return ListView.builder(
              padding: EdgeInsets.symmetric(
                vertical: 20,
                // horizontal: 20
              ),
              itemCount: snapshot.data.length,
              itemBuilder: (ctx, i) => Container(
                    padding: EdgeInsets.only(bottom: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 2, color: Colors.grey[200]))),
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
                          padding: const EdgeInsets.only(right: 5),
                          child: Wrap(
                            alignment: WrapAlignment.start,
                            direction: Axis.vertical,
                            children: <Widget>[
                              Text(
                                '${snapshot.data[i]['clientName']}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                'رقم الطلب :12356',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                'الاجمالي :${snapshot.data[i]['totalprice']} جنية',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: Wrap(
                            direction: Axis.vertical,
                            alignment: WrapAlignment.end,
                            children: <Widget>[
                              RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  color: Colors.green,
                                  child: Text(
                                    'استلام',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {}),
                              RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  color: Colors.red,
                                  child: Text(
                                    'رفض',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {}),
                            ],
                          ),
                        )
                      ],
                    ),
                  ));
        }
        return Center(
          child: CupertinoActivityIndicator(
            radius: 25,
          ),
        );
      },
    );
  }
}
