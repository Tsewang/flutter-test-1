part of 'login_imports.dart';

@RoutePage()
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late LoginViewModel loginViewModel;

  @override
  void initState() {
    loginViewModel = LoginViewModel(repository: context.read<Repository>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.secondaryColor,
      body: SafeArea(
          child: ListView(
        children: [
          Image.asset(
            Assets.assetsImagesJournoLogo,
            width: 139.h,
            height: 42.w,
          ).centered(),
          Form(
            key: loginViewModel.formKey,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              decoration: const BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(36),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Login",
                      style: TextStyle(
                        color: MyColors.primaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomEmailTextField(
                        controller: loginViewModel.emailController,
                        hintText: "Enter your email"),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomPasswordTextField(
                        controller: loginViewModel.passwordController,
                        hintText: "Enter your password"),
                    const SizedBox(height: 30),
                    PrimaryButton(
                        title: "Login",
                        onPressed: () {
                          if(loginViewModel.formKey.currentState!.validate()) {
                            loginViewModel.login(context);
                          }
                        }),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
