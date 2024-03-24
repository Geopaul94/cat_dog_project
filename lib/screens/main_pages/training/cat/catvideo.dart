import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CatVideo extends StatefulWidget {
  const CatVideo({super.key});

  @override
  State<CatVideo> createState() => _CatVideoState();
}

class _CatVideoState extends State<CatVideo> {
  late List<YoutubePlayerController> _controllers;
  List<String> linkURL = [
    "https://youtu.be/L_vDpAllafs?si=L_i-jOIeWIKUOhYl", // Removed query parameters
    "https://youtu.be/iPppiSvaFAI?si=RVhgpps4YOWYOBK4",
    "https://youtu.be/IfA5kcHGFss?si=FoC1aS-hOXpPiVG0",
    "https://youtu.be/qLro3q_IIaw?si=G0c3xfys30Ult_bz",
    "https://youtu.be/aWvpHsju8qM?si=Rtzuc7JNS5_mx2NP",
    "https://youtu.be/HqjksMmwRTk?si=YEJLFbG066dbPO9K",
    "https://youtu.be/D0Nh9YUCp50?si=Ifshb1cWHluWKUEk",
    "https://youtu.be/IUHeSblxRNY?si=5qqy0LZwiP_GVbPV",
    "https://youtu.be/u23qeh974RI?si=CGFhv3afrMZKJhG1",
    "https://youtu.be/7ir1RK5uIsU?si=C5Bxd73tpvEhj4SD",
    "https://youtu.be/uG6PcxMuPTQ?si=hJH9OpCXQXjpKCk7",
  ];

  @override
  void initState() {
    super.initState();
    _controllers = linkURL.map((url) {
      final videoId = YoutubePlayer.convertUrlToId(url);
      return YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(
          autoPlay: false, // Set autoPlay to false by default
        ),
      );
    }).toList();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Training Cat Videos'),
        backgroundColor: const Color.fromRGBO(117, 67, 191, 1),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: _controllers.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (_controllers.isEmpty) {
                  return const Center(child: Text('No Videos'));
                }
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: YoutubePlayer(
                      thumbnail: const Text(''),
                      controller: _controllers[index],
                      showVideoProgressIndicator: true,
                      progressColors: const ProgressBarColors(
                        handleColor: Colors.indigo,
                        playedColor: Colors.indigo,
                        bufferedColor: Colors.grey,
                      ),
                      onReady: () => debugPrint(
                        'Ready',
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
