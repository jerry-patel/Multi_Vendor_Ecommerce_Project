import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:multi_vendor_ecommerce/widgets/auth_widgets.dart';
import 'package:multi_vendor_ecommerce/widgets/snackbar.dart';
import 'package:image_picker/image_picker.dart';

class CustomerRegisterScreen extends StatefulWidget {
  const CustomerRegisterScreen({Key? key}) : super(key: key);

  @override
  State<CustomerRegisterScreen> createState() => _CustomerRegisterScreenState();
}

class _CustomerRegisterScreenState extends State<CustomerRegisterScreen> {

  late String name;
  late String email;
  late String password;

  bool passwordVisible = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldMessengerState> scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  // TextEditingController nameController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();

  final ImagePicker imagePicker = ImagePicker();
  XFile? imageFile;
  dynamic pickedImageError;

  void pickImageFromCamera() async {
    try {
      final pickedImage = await imagePicker.pickImage(
        source: ImageSource.camera,
        maxHeight: 300,
        maxWidth: 300,
        imageQuality: 95,
      );
      setState(()=> imageFile = pickedImage);
    } catch(e){
      setState(()=> pickedImageError = e);
      log('pickedImageError : $pickedImageError');
    }
  }

  void pickImageFromGallery() async {
    try {
      final pickedImage = await imagePicker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 300,
        maxWidth: 300,
        imageQuality: 95,
      );
      setState(()=> imageFile = pickedImage);
    } catch(e){
      setState(()=> pickedImageError = e);
      log('pickedImageError : $pickedImageError');
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: scaffoldKey,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                reverse: true,
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const AuthHeaderLabel(headerLabel: 'Sign Up'),

                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.purpleAccent,
                              backgroundImage: imageFile == null
                              ? null 
                              : FileImage(File(imageFile!.path)),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    log('Camera');
                                    pickImageFromCamera();
                                  },
                                  icon: const Icon(Icons.camera_alt, color: Colors.white,),
                                ),
                              ),

                              const SizedBox(height: 6),


                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    log('Gallery');
                                    pickImageFromGallery();
                                  },
                                  icon: const Icon(Icons.photo, color: Colors.white,),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          // controller: nameController,
                          validator: (value){
                            if(value!.isEmpty) {
                              return 'please enter your full name';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                          },
                          decoration: textFormDecoration.copyWith(
                            labelText: 'Full Name',
                            hintText: 'Enter your full name'
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          // controller: emailController,
                          validator: (value){
                            if(value!.isEmpty) {
                              return 'please enter your email';
                            } else if(value.isValidEmail() == false) {
                              return 'Invalid email';
                            } /*else if(value.isValidEmail() == true) {
                              return null;
                            }*/
                            return null;
                          },
                          onChanged: (value) {
                            email = value;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: textFormDecoration.copyWith(
                              labelText: 'Email',
                              hintText: 'Enter your email'
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          // controller: passwordController,
                          validator: (value){
                            if(value!.isEmpty) {
                              return 'please enter your password';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            password = value;
                          },
                          obscureText: passwordVisible,
                          decoration: textFormDecoration.copyWith(
                              labelText: 'Password',
                              hintText: 'Enter your password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                              icon: Icon(
                                passwordVisible ? Icons.visibility : Icons.visibility_off,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                        ),
                      ),


                      HaveAccount(
                        haveAccount: 'Already have account? ',
                        actionLabel: 'Log In',
                        onPressed: () {},
                      ),

                      AuthMainButton(
                        mainButtonLabel: 'SignUp',
                        onPressed: () {
                          if(formKey.currentState!.validate()) {
                            if(imageFile != null) {
                              log('name : $name');
                              log('email : $email');
                              log('password : $password');
                              formKey.currentState!.reset();
                              setState(() => imageFile = null);
                            } else {
                              MyMessageHandler.showSnackBar(
                                  scaffoldKey,
                                  'Please pick image first',
                              );
                            }
                            // setState(() {
                            //   name = nameController.text.trim();
                            //   email = emailController.text.toLowerCase().trim();
                            //   password = passwordController.text.trim();
                            // });

                          } else {
                            log('invalid');
                            MyMessageHandler.showSnackBar(scaffoldKey, 'Please fill all fields');
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}



