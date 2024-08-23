import 'package:flutter/material.dart';

class DoiMatKhauPage extends StatelessWidget {
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
          'Đổi mật khẩu',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Make text bold
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFEEEEEE),
      ),
      backgroundColor: Color(0xFFEEEEEE),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Old Password Box
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nhập mật khẩu cũ',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: '',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),

            // New Password Box
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nhập mật khẩu mới',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: '',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),

            // Confirm New Password Box
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nhập lại mật khẩu mới',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: '',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 32.0),

            // Styled Button
            SizedBox(
              width: double.infinity, // Match the width of the text fields
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFEEEEEE), // Background color
                  foregroundColor: Color(0xFF006FFD), // Text color
                  side: BorderSide(color: Color(0xFF006FFD), width: 2), // Border color and width
                  padding: EdgeInsets.symmetric(vertical: 16.0), // Vertical padding
                ),
                onPressed: () {
                  // Handle password change logic here
                },
                child: Text(
                  'Đổi mật khẩu',
                  textAlign: TextAlign.center, // Center the text
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
