import 'package:flutter/material.dart';
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
  final String fullText =
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset';

  @override
  Widget build(BuildContext context) {
    final List<String> items = List<String>.generate(5, (index) => 'Outdoor');

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              'assets/main_image.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: const Color.fromARGB(255, 195, 36, 34),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'THE WEEKEND',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'Community. +11K Members',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      top: 14.5, bottom: 14.5, left: 2, right: 10),
                  color: const Color.fromARGB(255, 195, 36, 34),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: IconButton(
                      onPressed: () {
                        // TODO: Perform action when the button is pressed
                      },
                      icon: const Icon(Icons.share_sharp),
                      focusColor: Colors.red,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  width: 20,
                  color: const Color.fromARGB(255, 195, 36, 34),
                  height: 69,
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
            // MUTE NOTIFICATION
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 25, right: 25),
              child: MuteNotificationToggle(),
            ),
          ],
        ),
      ),
    );
  }

  String _getShortText(String text) {
    List<String> words = text.split(' ');
    if (words.length <= 30) {
      return text;
    } else {
      return words.take(30).join(' ') + '...';
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
              color: isMuted ? Colors.green : Colors.grey,
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
                      color: Colors.white,
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
