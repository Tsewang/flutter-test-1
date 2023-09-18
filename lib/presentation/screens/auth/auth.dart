part of 'auth_imports.dart';

@RoutePage()
class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  AuthViewModel authViewModel = AuthViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.assetsImagesOnboard1,
                ),
                const SizedBox(
                  height: 30,
                ),
                PrimaryButton(
                  title: "Login",
                  onPressed: () =>
                      AutoRouter.of(context).push(const LoginRoute()),
                ),
                const SizedBox(
                  height: 30,
                ),
                OutlineButton(
                    title: "Register",
                    onPressed: () =>
                        AutoRouter.of(context).push(const RegisterRoute())),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
