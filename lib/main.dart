import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.openSansTextTheme(),
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isExpanded = false;
  bool showAllItems = false;
  bool isFollowing = false;
  final String fullText =
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset';

  @override
  Widget build(BuildContext context) {
    final List<String> items = List<String>.generate(5, (index) => 'Outdoor');

    return Scaffold(
       
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/main_image.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            AppBar(
                toolbarHeight: 70,
                backgroundColor: Color.fromARGB(255, 220, 26, 12),
                title: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('THE WEEKEND', style: TextStyle(fontSize: 20,color: Colors.white)),
                    SizedBox(height: 8,),
                    Text('Community. +11K Members', style: TextStyle(fontSize: 14,color: Colors.white)),
                  ],
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      // Handle share action
                    },
                    icon: const Icon(Icons.share,color: Colors.white,),
                  ),
                  IconButton(
                    onPressed: () {
                      // Handle settings action
                    },
                    icon: const Icon(Icons.more_vert,color: Colors.white,),
                  ),
                ],
              ),
             
              const SizedBox(height: 10), // Space between row and text
          
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: isExpanded ? fullText : _getShortText(fullText),
                          style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w100,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                        if (!isExpanded)
                          const TextSpan(
                            text: ' Read more',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.red,
                                fontWeight: FontWeight.w500),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: showAllItems
                          ? items.map((item) => _buildItem(item)).toList()
                          : items.asMap().entries.map((entry) {
                              int idx = entry.key;
                              String text = entry.value;
                              if (idx == 3 && items.length > 4) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showAllItems = true;
                                    });
                                  },
                                  child: _buildItem('+${items.length - 3}'),
                                );
                              } else if (idx < 4) {
                                return _buildItem(text);
                              } else {
                                return const SizedBox.shrink();
                              }
                            }).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Media , docs and links',
                      style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 16),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right_sharp,
                      size: 25,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Handle image tap
                        },
                        child: Image.asset('assets/small image.png',
                            width: 100, height: 100),
                      ),
                      const SizedBox(width: 8), // Add spacing between images
          
                      GestureDetector(
                        onTap: () {
                          // Handle image tap
                        },
                        child: Image.asset('assets/small image.png',
                            width: 100, height: 100),
                      ),
                      const SizedBox(width: 8), // Add spacing between images
          
                      GestureDetector(
                        onTap: () {
                          // Handle image tap
                        },
                        child: Image.asset('assets/small image.png',
                            width: 100, height: 100),
                      ),
                      const SizedBox(width: 8), // Add spacing between images
                      GestureDetector(
                        onTap: () {
                          // Handle image tap
                        },
                        child: Image.asset('assets/small image.png',
                            width: 100, height: 100),
                      ),
                      const SizedBox(width: 8), // Add spacing between images
                      GestureDetector(
                        onTap: () {
                          // Handle image tap
                        },
                        child: Image.asset('assets/small image.png',
                            width: 100, height: 100),
                      ),
                      // Add more GestureDetector/Image.asset widgets as needed
                    ],
                  ),
                ),
              ),
                    const SizedBox(height: 10,),

              // MUTE NOTIFICATION
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 25, right: 25),
                child: MuteNotificationToggle(),
              ),
          
            Padding(
  padding: const EdgeInsets.only(top: 10, left: 25, right: 25),
  child: Column(
    children: [
      InkWell(
        onTap: () {
          // Action to perform when 'Clear chat' is clicked
        },
        child: const Row(
          children: [
            Icon(Icons.delete_outline_rounded, size: 25),
            SizedBox(width: 15),
            Text(
              'Clear chat',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 10),
      InkWell(
        onTap: () {
          // Action to perform when 'Encryption' is clicked
        },
        child: const Row(
          children: [
            Icon(Icons.lock_outline, size: 25),
            SizedBox(width: 15),
            Text(
              'Encryption',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 10),
      InkWell(
        onTap: () {
          // Action to perform when 'Exit community' is clicked
        },
        child: const Row(
          children: [
            Icon(Icons.exit_to_app_outlined, size: 25,color: Colors.red,),
            SizedBox(width: 15),
            Text(
              'Exit community',
              style: TextStyle(
                color: Colors.red,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 10),
      InkWell(
        onTap: () {
          // Action to perform when 'Report' is clicked
        },
        child: const Row(
          children: [
            Icon(Icons.thumb_down_outlined, size: 25,color: Colors.red,),
            SizedBox(width: 15),
            Text(
              'Report',
              style: TextStyle(
                color: Colors.red,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ],
  ),
          ),
          const SizedBox(height: 10,),
           //members
          const Padding(
          padding: EdgeInsets.only(top: 10, left: 25, right: 25),
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text('Members',style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                 ),),
                 Icon(Icons.search,size: 27,),
               ],
             ),
          ),
           const SizedBox(height: 10,)
           ,

 Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: SizedBox(
                  height: 400, // Set a fixed height for the list
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return MemberItem();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  String _getShortText(String text) {
    List<String> words = text.split(' ');
    if (words.length <= 45) {
      return text;
    } else {
      return words.take(45).join(' ') + '...';
    }
  }

  Widget _buildItem(String text) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.red),

      ),
    );
  }
}

class MuteNotificationToggle extends StatefulWidget {
  const MuteNotificationToggle({super.key});

  @override
  _MuteNotificationToggleState createState() => _MuteNotificationToggleState();
}

class _MuteNotificationToggleState extends State<MuteNotificationToggle> {
  bool isMuted = false;

  void _toggleMute() {
    setState(() {
      isMuted = !isMuted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Mute notification',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        GestureDetector(
          onTap: _toggleMute,
          child: Container(
            width: 45,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: isMuted ? const Color.fromARGB(255, 237, 83, 72): const Color.fromARGB(255, 212, 212, 212),
            ),
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  left: isMuted ? 30 : 0,
                  right: isMuted ? 0 : 30,
                  child: Container(
                    width:30,
                    height: 25,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MemberItem extends StatefulWidget {
  @override
  _MemberItemState createState() => _MemberItemState();
}

class _MemberItemState extends State<MemberItem> {
  bool isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13, top: 13),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/face.png'),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Yashika ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '29, India ',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          const Spacer(),
          SizedBox(width: 125,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  isFollowing = !isFollowing;
                });
              },
              style: ElevatedButton.styleFrom(
                
                
                backgroundColor: isFollowing ? Colors.grey : Colors.red, // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50), // Rounded corners
                ),
              ),
              child: Text(
                isFollowing ? 'Following' : 'Add',
                style: const TextStyle(
                  color: Colors.white, // Text color
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}