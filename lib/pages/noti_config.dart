import 'package:flutter/material.dart';

class NotiConfigPage extends StatefulWidget {
  @override
  _NotiConfigPageState createState() => _NotiConfigPageState();
}

class _NotiConfigPageState extends State<NotiConfigPage> {
  bool _allowNotifications = false;
  bool _dbChangesNotifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Color(0xFF006FFD)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Cài đặt thông báo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFEEEEEE),
      ),
      backgroundColor: Color(0xFFEEEEEE),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cho phép thông báo trên thiết bị',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Switch(
                    value: _allowNotifications,
                    onChanged: (bool value) {
                      setState(() {
                        _allowNotifications = value;
                      });
                    },
                    activeColor: Color(0xFF006FFD),
                    inactiveThumbColor: Colors.black12,
                    inactiveTrackColor: Color(0xEEEEEE),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.all(16.0),
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Thông báo thay đổi trong cơ sở dữ liệu',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Switch(
                    value: _dbChangesNotifications,
                    onChanged: (bool value) {
                      setState(() {
                        _dbChangesNotifications = value;
                      });
                    },
                    activeColor: Color(0xFF006FFD),
                    inactiveThumbColor: Colors.black12,
                    inactiveTrackColor: Color(0xEEEEEE),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
