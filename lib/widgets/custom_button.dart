import 'package:flutter/material.dart';
 

import '../utils/hexcolor.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.isLoading,this.buttonStyle,this.onPressed,this.textStyle,this.title
  });

  final bool isLoading;
  final String? title;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final ButtonStyle? buttonStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:buttonStyle==null? ButtonStyle(
          elevation: const MaterialStatePropertyAll(1),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
              Theme.of(context).buttonTheme.colorScheme?.primary)):buttonStyle,
     
      onPressed: onPressed,
      child: isLoading
          ? Container(
              height: 22,
              width: 22,
              // margin: EdgeInsets.all(2),
      
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: CircularProgressIndicator(
                  backgroundColor: Theme.of(context).indicatorColor,
                  strokeWidth: 2,
                  // width: MediaQuery.of(context).size.aspectRatio,
                ),
              ))
          :  Text(
             title?? "Continue",
              style:
                 textStyle==null? TextStyle(fontSize: 18, color: Colors.white):textStyle
            ),
    );
  }
}


class CustomButton2 extends StatelessWidget {
  final bool loading;
  final VoidCallback onClick;
  final String title;

  const CustomButton2(
      {Key? key,
      this.loading = false,
      required this.onClick,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox
    (width: double.infinity,
      child: ElevatedButton(
        
        style: ButtonStyle(
            elevation: MaterialStatePropertyAll(1),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
                Theme.of(context).buttonTheme.colorScheme?.primary)),
        onPressed: loading == true ? null : onClick,
        child: Container(
            // width: double.infinity,
            padding: const EdgeInsets.all(2),
            constraints: const BoxConstraints(minWidth: 0.0),
            child: loading == true
                ? Container(
                    height: 22,
                    width: 22,
                    // margin: EdgeInsets.all(2),
    
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: CircularProgressIndicator(
                        backgroundColor: Theme.of(context).indicatorColor,
                        strokeWidth: 2,
                        // width: MediaQuery.of(context).size.aspectRatio,
                      ),
                    ))
                : Text(
                    title,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  )),
      ),
    );
  }
}
class sb extends StatelessWidget {
  sb({super.key, this.height, this.width});
  double? height;
  double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}


class SubmitButton extends StatelessWidget {
  final bool? loading;
  final VoidCallback? onClick;
  final String title;
  final TextStyle? titleStyle;

  const SubmitButton(
      {Key? key,
      this.loading = false,
      this.onClick,
      required this.title,
      this.titleStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: HexColor("FF5722"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        onPressed: onClick,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: loading == true
              ? const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.5,
                  ),
                )
              : Text(
                  title,
                  style: titleStyle ??
                      const TextStyle(color: Colors.white, fontSize: 14),
                ),
        ),
      ),
    );
  }
}
