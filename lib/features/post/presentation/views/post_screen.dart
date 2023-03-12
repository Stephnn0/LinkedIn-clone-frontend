import 'dart:io';

import 'package:clean_arch_linkedin/features/post/presentation/bloc/post_bloc.dart';
import 'package:clean_arch_linkedin/features/post/presentation/views/post_job_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  File? image;
  TextEditingController description = TextEditingController();

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imagePathObject = File(image.path);
      setState(() {
        this.image = imagePathObject;
      });
    } on PlatformException catch (err) {
      print('failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<PostBloc>().add(
                      CreatePost(
                        description: description.text,
                        postImagePath: image!,
                      ),
                    );
              },
              child: const Text('Post'),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        )
      ]),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            TextField(
              controller: description,
              decoration: const InputDecoration(
                hintText: 'description',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            image != null
                ? Container(
                    height: 300,
                    decoration: BoxDecoration(),
                    child: Image.file(
                      image!,
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Icon(
                      Icons.add_photo_alternate,
                      size: 90,
                    )),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PostJobScreen(),
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () => pickImage(),
            child: const Icon(Icons.add_a_photo),
          ),
        ],
      ),
    );
  }
}
