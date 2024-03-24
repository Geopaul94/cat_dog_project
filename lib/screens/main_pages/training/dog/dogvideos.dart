import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DogVideos extends StatefulWidget {
  const DogVideos({super.key});

  @override
  State<DogVideos> createState() => _DogVideosState();
}

class _DogVideosState extends State<DogVideos> {
  late List<YoutubePlayerController> _controllers;
  List<String> linkURL = [
    "https://youtu.be/3gnTjbrTJGc", // Removed query parameters
    "https://youtu.be/V4EKDgP84TU",
    "https://youtu.be/ipFUM84lZek",
    "https://youtu.be/k_iSLT4B_cs",
    "https://youtu.be/BLdPks74qZo",
    "https://youtu.be/2VCxfews9TU",
    "https://youtu.be/P6_5bayrUOo",
    "https://youtu.be/CvzLVpf_0bA",
    "https://youtu.be/VM6GR8uf2cI",
    "https://youtu.be/4z93ALdpmJI",
    "https://youtu.be/NMVotNhtTYQ",
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
        title: const Text('Training Dog Videos'),
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
