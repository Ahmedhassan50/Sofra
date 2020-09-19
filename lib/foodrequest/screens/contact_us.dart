import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sofra/provider/main_provider.dart';
import 'package:sofra/screens/main_screen.dart';
import 'package:sofra/widgets/appbar.dart';
import 'package:sofra/widgets/navigationbar.dart';

class ContactUs extends StatelessWidget {
  static const routename = '/Contact-Us';
  @override
  Widget build(BuildContext context) {
    final mainData = Provider.of<MainProvider>(context, listen: false);
    return Scaffold(
      appBar: MainAppbar().appbar(context),
      bottomNavigationBar: MainNavbar(
        ontab: (index) {
          mainData.changepage(index);

          Navigator.of(context)
              .popUntil(ModalRoute.withName(MainScreen.routename));
        },
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: LayoutBuilder(
          builder: (ctx, constrans) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: constrans.maxHeight, minWidth: constrans.maxWidth),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'تواصل معنا',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  _infoInput('الأسم كاملاً'),
                  _infoInput('البريد الألكتروني'),
                  _infoInput('العنوان'),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: 'ما هي رسالتك؟',
                      ),
                      maxLines: 4,
                    ),
                    color: Colors.grey[200],
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                      Radio(value: 1, groupValue: null, onChanged: (_) {}),
                      Text('شكوى'),
                      Radio(value: 1, groupValue: null, onChanged: (_) {}),
                      Text('اقتراح'),
                      Radio(value: 1, groupValue: null, onChanged: (_) {}),
                      Text('استعلام'),
                    ],
                  ),
                  RaisedButton(
                    onPressed: () {},
                    color: Color(0xFFC2185B),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 50),
                      child: Text(
                        'ارسال',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoInput(String hint) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: hint,
        ),
      ),
      color: Colors.grey[200],
    );
  }
}
