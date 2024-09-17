import 'package:first_api/utility/assets.dart';
import 'package:first_api/view/auth/widget/button.dart';
import 'package:first_api/view/home_screen/home_screen.dart';
import 'package:first_api/view/widget/app_button.dart';
import 'package:first_api/view/widget/app_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../utility/app_color.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _email = TextEditingController();
  final _password = TextEditingController();
   bool _isVisible=false;
  final bool _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _password.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return  SafeArea(child: Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SingleChildScrollView(
        padding:const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           const SizedBox(height: 150,),
            const Text("L O G I N",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color:AppColors.whiteText ,
              ),
            ),

            const SizedBox(height: 50,),

            //email
            AppInput(
              hint: "Email",
              controller: _email,
              textType: TextInputType.emailAddress,
              validator: (v){
                if(v !=null){
                  return "Must be required";
                }
                return null;
              },
            ),

           const SizedBox(height: 20,),
            //password
            AppInput(
                hint: "Password",
                controller: _password,
              obscureText: _isVisible,
              suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      _isVisible =! _isVisible;

                    });
                  },
                  icon: Icon(_isVisible?Icons.visibility:Icons.visibility_off,color: Colors.grey,)),
            ),

           const SizedBox(height: 15,),
            //forgot password
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                  onTap:(){},
                  child:const Text("Forgot Password?",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.red),
                  ),
              ),
            ),

           const SizedBox(height: 40,),
            //loginButton
            AppButton(
                name: "LOGIN",
                onClick: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen())),
              isLoading: _isLoading,
            ),

           const SizedBox(height: 30,),
            //signup with google or phone
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Button(image: Assets.google,onTap: (){},),
                Button(image: Assets.phone,onTap: (){},),
              ],
            ),

           const SizedBox(height: 30,),
            //signUp
            Center(
              child: InkWell(
                onTap: (){},
                  child: const Text("S I G N U P",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.blue),)),
            ),
          const  SizedBox(height: 20,),

          ],
        ),
      ),
    ));
  }
}


