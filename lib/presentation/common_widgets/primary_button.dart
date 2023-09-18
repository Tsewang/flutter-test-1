part of 'common_widgets_imports.dart';
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.title, required this.onPressed,});

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 235, 40, 6),
          minimumSize: Size(MediaQuery.of(context).size.width, 44.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11.r),
          )),
      child: title
          .text
          .size(16)
          .fontWeight(FontWeight.w700)
          .color(Colors.white60)
          .make(),
    );
  }
}