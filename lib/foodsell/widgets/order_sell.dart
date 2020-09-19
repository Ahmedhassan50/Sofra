import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  final List<Widget>children;
  Orders({this.children});
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        itemCount: 10,
        itemBuilder: (ctx, i) => Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              width: double.infinity,
              // height: 300,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/homebackground2.jpg',
                      ),
                    ),
                    title: Text('العميل : مازن محمد'),
                    subtitle: Wrap(
                      direction: Axis.vertical,
                      children: <Widget>[
                        Text('رقم الطلب:12345'),
                        Text('الاجمالي:110 جنية'),
                        Text('العنوان: 15 شارع شبراويشي'),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: children,
                  )
                ],
              ),
            )
            );
  }
}