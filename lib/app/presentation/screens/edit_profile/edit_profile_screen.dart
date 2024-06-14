import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:main_platform/app/domain/entity/edit_profile/edit_profile_entity.dart';
import 'package:main_platform/app/presentation/bloc/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:main_platform/app/presentation/bloc/edit_profile/cubit/edit_profile_state.dart';
import 'package:main_platform/app/presentation/widgets/custom_textfield.dart';
import 'package:sizer/sizer.dart';

@RoutePage()
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditProfileCubit>(
      create: (_) => EditProfileCubit(),
      child: BlocListener<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          if (state is EditProfileError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          } else if (state is EditProfileUpdated) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Profile updated successfully!')),
            );
          }
        },
        child: _EditProfileScreenContent(),
      ),
    );
  }
}

class _EditProfileScreenContent extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? avatar;
  Future<XFile?> chooseImage(ImageSource source) {
    return _picker.pickImage(source: source, imageQuality: 80);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Profile",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 24,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
          onPressed: () {
            context.router.maybePop();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                                width: 80,
                                height: 80,
                                child: Image.asset(
                                  'assets/images/avatar.png',
                                  height: 20.h,
                                  width: 20.w,
                                )),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 39,
                                height: 39,
                                decoration: BoxDecoration(
                                  color: Colors.blue[600],
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.edit),
                                  color: Colors.white,
                                  onPressed: () {
                                    chooseImage(ImageSource.gallery).then(
                                      (value) {
                                        avatar = value;
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10.0),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Read before uploading profile picture",
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 13,
                                ),
                              ),
                              SizedBox(height: 3.0),
                              Text(
                                "- No \"anime\" pictures.",
                                style: TextStyle(fontSize: 11),
                              ),
                              Text(
                                "- Profile picture must be an appropriate picture of you.",
                                style: TextStyle(fontSize: 11),
                              ),
                              Text(
                                "- Must not contain any offensive, inappropriate, or illegal content.",
                                style: TextStyle(fontSize: 11),
                              ),
                              Text(
                                "- Any break against the rules will lead to you being permanently banned from the application.",
                                style: TextStyle(fontSize: 11),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      "Name",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      ),
                    ),
                    const Text(
                      "You already wrote your national full name when you signed up, but we also need your name written in English to improve user experience.",
                      style: TextStyle(fontSize: 13),
                    ),
                    const SizedBox(height: 20.0),
                    CustomTextField(
                      controller: _nameController,
                      hint: 'John Doe',
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      "Bio",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      ),
                    ),
                    const Text(
                      "Write briefly about yourself. Share what you want people to know about you, but try not to share sensitive information.",
                      style: TextStyle(fontSize: 13),
                    ),
                    const SizedBox(height: 20.0),
                    CustomTextField(
                      controller: _bioController,
                      hint: 'Your thoughts',
                      minLines: 3,
                      maxLines: 5,
                      type: TextInputType.multiline,
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      "Phone Number",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                      ),
                    ),
                    const Text(
                      "Add a phone number to let people know how to contact you. We don’t require a phone number by default due to privacy concerns, so you are not forced to add one. You can also adjust privacy settings to limit who can see your phone number.",
                      style: TextStyle(fontSize: 13),
                    ),
                    const SizedBox(height: 20.0),
                    CustomTextField(
                      controller: _phoneController,
                      hint: '+20 123 456 7890',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              height: 40,
              child: FilledButton.icon(
                onPressed: () {
                  final editedProfile = EditProfileEntity(
                    displayName: _nameController.text,
                    bio: _bioController.text,
                    phone: _phoneController.text,
                    profilePicture: avatar,
                  );
                  BlocProvider.of<EditProfileCubit>(context)
                      .editProfile(editedProfile);
                },
                icon: const Icon(Icons.save),
                label: const Text("Update profile"),
                style: FilledButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
