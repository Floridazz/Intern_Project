import 'package:flutter/material.dart';
import 'change_pass.dart';
import 'noti_config.dart';
class AccountPage extends StatelessWidget {
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
        title: Text('Tài khoản'),
        centerTitle: true,
        backgroundColor: Color(0xFFEEEEEE),
      ),
      backgroundColor: Color(0xFFEEEEEE), // Page background color
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Box: Avatar, Name, Email, Role
            Container(
              padding: EdgeInsets.all(16.0),
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
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/avatar.png'), // Replace with your avatar image path
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Name',
                          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4.0),
                        Text('youremail@example.com'),
                        SizedBox(height: 4.0),
                        Text('Your Role'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.0), // Increased space between the first and second box

            // Cài đặt Header Text
            Text(
              'Cài đặt',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.0), // Space between header text and second box

            // Second Box: Cài đặt with 2 Options
            Container(
              padding: EdgeInsets.all(16.0),
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
              child: Column(
                children: [
                  ListTile(
                    title: Text('Đổi mật khẩu'),
                    trailing: Icon(Icons.chevron_right, color: Color(0xFF006FFD)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoiMatKhauPage(),
                        ),
                      );
                    },
                  ),

                  Divider(),
                  ListTile(
                    title: Text('Cài đặt thông báo'),
                    trailing: Icon(Icons.chevron_right, color: Color(0xFF006FFD)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotiConfigPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.0), // Increased space between the second and third box

            // Third Box: Đăng xuất Button
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFEEEEEE), // Background color
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.red), // Border color
              ),
              child: TextButton(
                onPressed: () {
                  // Implement logout logic here
                },
                child: Text(
                  'Đăng xuất',
                  style: TextStyle(color: Colors.red, fontSize: 16.0), // Text color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
