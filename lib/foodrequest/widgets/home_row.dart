import 'package:flutter/material.dart';

class HomeRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0),
                              blurRadius: 3.0)
                        ]),
                    child: Theme(
                      data: ThemeData(
                        fontFamily: 'cairo',
                        canvasColor: Colors.grey[200],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: DropdownButton(
                          items: <String>['Cairo', 'Giza', 'Benha']
                              .map<DropdownMenuItem<String>>(
                                  (val) => DropdownMenuItem<String>(
                                        value: val,
                                        child: Center(child: Text(val)),
                                      ))
                              .toList(),
                          onChanged: (_) {},
                          hint: Text('اختر المدينة'),
                          icon: Icon(
                            Icons.arrow_downward,
                            color: Colors.pink,
                          ),
                          elevation: 10,
                          isExpanded: true,
                          underline: SizedBox.shrink(),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0),
                              blurRadius: 3.0)
                        ]),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding:
                              EdgeInsets.only(left: 10, right: 10, top: 5),
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.pink,
                          )),
                    ),
                  ),
                )
              ],
            );
  }
}