import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helloworld/blocs/sign_in_bloc/sign_in_bloc.dart';
import '../blocs/authentication_bloc/authentication_bloc.dart';
import 'scan.dart';
import 'account.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tổng hợp kiểm kê')),
      body: Center(child: Text('This is Page 1')),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tạo phiên kiểm kê')),
      body: Center(child: Text('This is Page 2')),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lịch sử kiểm kê')),
      body: Center(child: Text('This is Page 3')),
    );
  }
}

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Báo cáo kiểm kê')),
      body: Center(child: Text('This is Page 4')),
    );
  }
}

class Page5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quản lý tài khoản')),
      body: Center(
          child: TextButton(
        child: Text('Đăng xuất'),
        onPressed: () {
          context.read<SignInBloc>().add(SignOutRequired());
          Navigator.pop(context);
        },
      )),
    );
  }
}

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  int _selectedIndex = 0;

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Page1()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AccountPage()), // Update here
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ScanPage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Page3()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Page4()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_searchFocusNode.hasFocus) {
        _searchFocusNode.unfocus();
      }
    });

    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),

      // AppBar configuration
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.search, size: 24),
                onPressed: () {},
              ),
              Expanded(
                child: TextField(
                  controller: _searchController,
                  focusNode: _searchFocusNode,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Color(0xFFFFEEEEEE),
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: GridView.builder(
          padding: EdgeInsets.all(16.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 1.5,
          ),
          itemCount: 5,
          itemBuilder: (context, index) {
            final List<Widget> pages = [
              Page1(),
              Page2(),
              Page3(),
              Page4(),
              BlocProvider<SignInBloc>(
                create: (_) => SignInBloc(
                    myUserRepository:
                        context.read<AuthenticationBloc>().userRepository),
                child: Page5(),
              ),
            ];

            final List<String> texts = [
              'Tổng hợp kiểm kê',
              'Tạo phiên kiểm kê',
              'Lịch sử kiểm kê',
              'Báo cáo kiểm kê',
              'Quản lý tài khoản',
            ];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => pages[index]),
                );
              },
              child: Container(
                color: Color(0xFFD9D9D9),
                child: Center(
                  child: Text(
                    texts[index],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );
          },
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 8),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.data_usage,
                        color: Color(0xFF006FFD), size: 28),
                    onPressed: () {
                      _onItemTapped(0);
                    },
                  ),
                  SizedBox(width: 20),
                  IconButton(
                    icon: Icon(Icons.account_circle,
                        color: Color(0xFF006FFD), size: 28),
                    onPressed: () {
                      _onItemTapped(1);
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Color(0xFF006FFD),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon:
                    Icon(Icons.qr_code_scanner, color: Colors.white, size: 28),
                onPressed: () {
                  _onItemTapped(2);
                },
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.notifications,
                        color: Color(0xFF006FFD), size: 28),
                    onPressed: () {
                      _onItemTapped(3);
                    },
                  ),
                  SizedBox(width: 20),
                  IconButton(
                    icon: Icon(Icons.settings,
                        color: Color(0xFF006FFD), size: 28),
                    onPressed: () {
                      _onItemTapped(4);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
