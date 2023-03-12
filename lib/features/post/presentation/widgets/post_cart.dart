import 'package:clean_arch_linkedin/features/post/domain/entities/post_entity.dart';
import 'package:flutter/material.dart';

class PostCart extends StatelessWidget {
  final PostEntity index;
  const PostCart({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Padding(
      padding: const EdgeInsets.all(1.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // ClipOval(
                //   child: Image.network('src'),
                // ),
                const Icon(
                  Icons.person,
                  size: 40,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          index.name!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          index.lastName!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 13.0,
              bottom: 10,
            ),
            child: Row(
              children: [
                Text(index.description!),
              ],
            ),
          ),
          index.awsURL != null
              ? Image.network(
                  index.awsURL!,
                  fit: BoxFit.cover,
                  height: 240,
                  width: 400,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: Column(
                      children: const [
                        Icon(Icons.thumb_up_alt_sharp),
                        SizedBox(
                          height: 4,
                        ),
                        Text('Like')
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      children: const [
                        Icon(Icons.chat_bubble_outline),
                        SizedBox(
                          height: 4,
                        ),
                        Text('Comment')
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      children: const [
                        Icon(Icons.share),
                        SizedBox(
                          height: 4,
                        ),
                        Text('Share')
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      children: const [
                        Icon(Icons.arrow_downward_rounded),
                        SizedBox(
                          height: 4,
                        ),
                        Text('Send')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.black,
            height: 8,
          )
        ],
      ),
    ));
  }
}
