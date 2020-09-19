import 'package:flutter/material.dart';

class ProfileSell extends StatelessWidget {
  static const routename = '/Profile-sell';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (ctx,constrais)=>
                   Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                     minHeight: constrais.maxHeight+500
                  ),
                  
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CircleAvatar(
                          maxRadius: 50,
                          backgroundColor: Colors.grey[300],
                          backgroundImage:
                              AssetImage('assets/images/homebackground2.jpg'),
                        ),
                        _infocards(
                            Icon(
                              Icons.person_outline,
                              color: Colors.black,
                            ),
                            'دجاج كنتاكي'),
                        _infocards(
                            Icon(
                              Icons.mail_outline,
                              color: Colors.black,
                            ),
                            'kentaky@gamil.com'),
                        _infocards(
                            Icon(
                              Icons.phone,
                              color: Colors.black,
                            ),
                            '01272262950'),
                        _infocards(
                            Icon(
                              Icons.home,
                              color: Colors.black,
                            ),
                            'القاهرة',
                            icon2: Icon(Icons.arrow_downward)),
                        _infocards(
                            Icon(
                              Icons.home,
                              color: Colors.black,
                            ),
                            'حي شبرا',
                            icon2: Icon(Icons.arrow_downward)),
                        _infocards(
                          Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          'كلمة المرور',
                        ),
                        _infocards(
                            Icon(
                              Icons.person_outline,
                              color: Colors.black,
                            ),
                            'سندوتشات-وجبات',
                            icon2: Icon(Icons.arrow_downward)),
                        _infocards(
                          Icon(
                            Icons.attach_money,
                            color: Colors.black,
                          ),
                          '70 جنية',
                        ),
                        _infocards(
                          Icon(
                            Icons.attach_money,
                            color: Colors.black,
                          ),
                          '10 جنية',
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Wrap(
                           
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: <Widget>[
                              Text('الحالة'),
                              Switch(value:true, onChanged: (_){})
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text('بيانات التواصل',
                          style: TextStyle(
                            fontSize: 20
                          ),
                          ),
                        ),
                        _infocards(
                            Icon(
                              Icons.phone,
                              color: Colors.black,
                            ),
                            '01272262950'),
                            _infocards(
                            Icon(
                              Icons.phone,
                              color: Colors.black,
                            ),
                            '01272262950'),










                        RaisedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text('تعديل'),
                          ),
                          color: Colors.pink,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      
    );
  }

  Widget _infocards(Icon icon, String content, {Icon icon2}) {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.grey[300],
        child: ListTile(
          leading: icon,
          title: Text(content),
          trailing: icon2,
        ),
      ),
    );
  }
}
