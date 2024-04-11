import 'package:dio/dio.dart';
import 'package:dmregister/bloc/print_bloc.dart';
import 'package:dmregister/bloc/user_bloc.dart';
import 'package:dmregister/dannyeapi.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/translations/codegen_loader.g.dart';
import '/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'pages/bottom.dart';
import 'model/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final dio = Dio();
  final userDataClient = UserData(dio);
  final printDataClient = UserData(dio);

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ru'), Locale('kk')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      assetLoader: CodegenLoader(),
      child: MyApp(
          userDataClient: userDataClient, printDataClient: printDataClient),
    ),
  );
}

class MyApp extends StatelessWidget {
  final UserData userDataClient;
  final UserData printDataClient;

  MyApp({required this.userDataClient, required this.printDataClient});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (_) => UserBloc()..add(LoadUser()),
        ),
        BlocProvider<PrintBloc>(
          create: (_) => PrintBloc(printDataClient),
        ),
      ],
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          Widget home = RegistrationForm();
          if (state is UserLoaded) {
            home = Bottom();
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: home,
          );
        },
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _lifeStoryController = TextEditingController();

  final List<String> _countries = [
    'Kazakhstan',
    'Ukraine',
    'Germany',
    'France'
  ];
  String _selectedCountry = 'Kazakhstan';

  final _nameFocus = FocusNode();
  final _phoneFocus = FocusNode();

  User newUser = User();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _lifeStoryController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserLoaded) {
          _nameController.text = state.name;
          _phoneNumberController.text = state.phoneNumber;
          _emailController.text = state.email;
          _selectedCountry = state.country;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.form.tr()),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    focusNode: _nameFocus,
                    autofocus: true,
                    onFieldSubmitted: (_) {
                      _fieldFocusChange(context, _nameFocus, _phoneFocus);
                    },
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: LocaleKeys.name.tr(),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                    onSaved: (value) => newUser.name = value!,
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: LocaleKeys.email.tr(),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onSaved: (value) => newUser.email = value!,
                  ),
                  SizedBox(height: 10.0),
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    items: _countries.map((country) {
                      return DropdownMenuItem(
                        child: Text(country),
                        value: country,
                      );
                    }).toList(),
                    onChanged: (country) {
                      print(country);
                      setState(() {
                        _selectedCountry = country as String;
                        newUser.country = country;
                      });
                    },
                    value: _selectedCountry,
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: _lifeStoryController,
                    decoration: InputDecoration(
                      labelText: LocaleKeys.stor.tr(),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.book),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: LocaleKeys.password.tr(),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a password';
                      } else if (value.length < 8) {
                        return 'Password must be at least 8 characters long';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.0),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<UserBloc>().add(SaveUser(
                            _nameController.text,
                            _phoneNumberController.text,
                            _emailController.text,
                            _selectedCountry));

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Bottom()),
                        );
                      }
                    },
                    child: Text(LocaleKeys.register.tr()),
                  ),
                  SizedBox(height: 20.0),
                  OutlinedButton(
                    onPressed: () {
                      context.setLocale(Locale('en'));
                    },
                    child: Text('Eng'),
                  ),
                  SizedBox(width: 10.0),
                  OutlinedButton(
                    onPressed: () {
                      context.setLocale(Locale('ru'));
                    },
                    child: Text('Ru'),
                  ),
                  SizedBox(width: 10.0),
                  OutlinedButton(
                    onPressed: () {
                      context.setLocale(Locale('kk'));
                    },
                    child: Text('Kaz'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? _validateName(String? value) {
    final _nameExp = RegExp(r'^[A-Za-z ]+$');
    if (value == null) {
      return 'Name is reqired.';
    } else if (!_nameExp.hasMatch(value)) {
      return 'Please enter alphabetical characters.';
    } else {
      return null;
    }
  }

  bool _validatePhoneNumber(String input) {
    final _phoneExp = RegExp(r'^\(\d\d\d\)\d\d\d\-\d\d\d\d$');
    return _phoneExp.hasMatch(input);
  }

  String? _validateEmail(String? value) {
    if (value == null) {
      return 'Email cannot be empty';
    } else if (!_emailController.text.contains('@')) {
      return 'Invalid email address';
    } else {
      return null;
    }
  }

  String? _validatePassword(String? value) {
    if (_passwordController.text.length <= 8) {
      return '8 character required for password';
    } else {
      return null;
    }
  }
}
