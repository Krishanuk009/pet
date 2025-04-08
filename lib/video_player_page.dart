import 'package:flutter/material.dart';
import 'package:better_player/better_player.dart';

class VideoPlayerPage extends StatefulWidget {
  final String videoUrl;
  
  const VideoPlayerPage({
    super.key,
    required this.videoUrl,
  });

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late BetterPlayerController _betterPlayerController;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  void _initializePlayer() {
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      widget.videoUrl,
    );

    _betterPlayerController = BetterPlayerController(
      BetterPlayerConfiguration(
        aspectRatio: 16 / 9,
        fit: BoxFit.contain,
        autoPlay: true,
        controlsConfiguration: const BetterPlayerControlsConfiguration(
          enablePlayPause: true,
          enableFullscreen: true,
          enablePlaybackSpeed: true,
          enableSkips: true,
          enableQualities: true,
          loadingWidget: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
      betterPlayerDataSource: dataSource,
    );
  }

  @override
  void dispose() {
    _betterPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: BetterPlayer(
              controller: _betterPlayerController,
            ),
          ),
        ),
      ),
    );
  }
} 