import 'package:dmregister/dannye.dart';
import 'package:dmregister/flutp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dmregister/pages/page3.dart';
import 'package:easy_localization/easy_localization.dart';
import 'lenta.dart';
import 'package:dmregister/bloc/user_bloc.dart';
import 'package:dmregister/translations/locale_keys.g.dart';

class Bottom extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Bottom> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoaded) {
          List<Widget> _pages = [
            HomePage(),
            PostPage(),
            CubPage(),
            Insta(),
            SecondUser(
              name: state.name,
              phoneNumber: state.phoneNumber,
              country: state.country,
              email: state.email,
            ),
          ];

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.orange,
              automaticallyImplyLeading: true,
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
            ),
            body: _pages[_currentIndex],
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.orange,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.white.withOpacity(0.6),
                  type: BottomNavigationBarType.fixed,
                ),
              ),
              child: BottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: LocaleKeys.home.tr(),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.data_array),
                    label: LocaleKeys.home.tr(),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.security),
                    label: LocaleKeys.home.tr(),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: LocaleKeys.search.tr(),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: LocaleKeys.profile.tr(),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}

class SecondUser extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final String email;
  final String country;

  SecondUser({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LocaleKeys.name.tr()),
            Text(name, style: TextStyle(fontSize: 18.0)),
            SizedBox(height: 10.0),
            Text(LocaleKeys.email.tr()),
            Text(email, style: TextStyle(fontSize: 18.0)),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
