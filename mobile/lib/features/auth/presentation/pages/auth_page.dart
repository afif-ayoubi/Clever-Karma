import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/theme/hex_color.dart';
import '../../../../core/util/snackbar_message.dart';
import '../../../../core/wdigets/loading_widget.dart';
import '../../../../routes/class_routes.dart';
import '../../domain/entities/user.dart';
import '../bloc/users/users_bloc.dart';
import '../widgets/auth_page/auth_popup.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  late TextEditingController _confirmPasswordController;
  late String role;
  Map<String, dynamic> signIn = {
    'title': "Sign In",
    'body': "Welcome back! Sign in to continue\nmaking a difference.",
    'btnText': "Sign In",
    'caption': "Don't have an account?",
    'isLogin': true,
  };

  Map<String, dynamic> signUp = {
    'title': "Sign Up",
    'body': "Unlock your potential to make a\n difference. ",
    'btnText': "Sign Up",
    'caption': "Already have an account?",
    'isLogin': false,
  };

  late Map<String, dynamic> currentAuthData;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
    Future.delayed(Duration.zero, () {
      currentAuthData = signIn;
      _toggleAuth(context);
      _getRoleFromSharedPreferences();
    });
  }

  _getRoleFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    role = prefs.getString('role') ?? '';
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<UsersBloc, UsersState>(listener: (context, state) {
      if (state is SuccessUserState) {
        final role = state.role;

        if (role == "Organization") {
          context.go(Routes.orgEntryPage);
        } else {
          context.go(Routes.entryPage);
        }
      } else if (state is ErrorUsersState) {
        SnackBarMessage.instance.showErrorSnackBar(
          message: state.message,
          context: context,
        );
      }
    }, builder: (context, state) {
      return _buildBody();
    }));
  }

  Widget _buildBody() {
    return Container(
      color: HexColor.primaryColor,
    );
  }

  void _toggleAuth(BuildContext context) {
    Future.delayed(Duration.zero, () {
      authPopUp(
        emailController: _emailController,
        passwordController: _passwordController,
        confirmPasswordController: _confirmPasswordController,
        currentAuthData: currentAuthData,
        context: context,
        forgotOnPressed: () {
          context.push(Routes.forgotPasswordRoute);
        },
        btnOnPressed: () {
          User user = User(
            email: _emailController.text,
            password: _passwordController.text,
          );
          currentAuthData == signIn
              ? BlocProvider.of<UsersBloc>(context)
                  .add(LoginUserEvent(user: user))
              : BlocProvider.of<UsersBloc>(context)
                  .add(CreateUserEvent(user: user));
        },
        btnTextOnPressed: () {
          Navigator.of(context).pop();
          print('convert to ${currentAuthData == signIn ? signUp : signIn}');
          setState(() {
            currentAuthData = currentAuthData == signIn ? signUp : signIn;
          });
          _recallAuth(context);
        },
      );
    });
  }

  void _recallAuth(BuildContext context) {
    Future.delayed(Duration.zero, () {
      _toggleAuth(context);
    });
  }
}
