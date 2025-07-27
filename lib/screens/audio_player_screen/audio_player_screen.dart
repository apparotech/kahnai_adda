import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

/// Provider for managing audio player state
final audioPlayerProvider =
    StateNotifierProvider<AudioPlayerNotifier, AudioPlayerState>((ref) {
  return AudioPlayerNotifier();
});

class AudioPlayerNotifier extends StateNotifier<AudioPlayerState> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioPlayerNotifier() : super(AudioPlayerState.initial()) {
    _initialize();
  }

  void _initialize() async {
    await _audioPlayer.setUrl(
        'https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3');
    _audioPlayer.durationStream.listen((duration) {
      state = state.copyWith(duration: duration ?? Duration.zero);
    });
    _audioPlayer.positionStream.listen((position) {
      state = state.copyWith(position: position);
    });
    _audioPlayer.playingStream.listen((isPlaying) {
      state = state.copyWith(isPlaying: isPlaying);
    });
  }

  void playPause() {
    if (_audioPlayer.playing) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }
  }

  void seekTo(Duration position) {
    _audioPlayer.seek(position);
  }

  void previous() {
    // Implement logic for previous track
  }

  void next() {
    // Implement logic for next track
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}

class AudioPlayerState {
  final Duration duration;
  final Duration position;
  final bool isPlaying;

  AudioPlayerState({
    required this.duration,
    required this.position,
    required this.isPlaying,
  });

  factory AudioPlayerState.initial() {
    return AudioPlayerState(
        duration: Duration.zero, position: Duration.zero, isPlaying: false);
  }

  AudioPlayerState copyWith({
    Duration? duration,
    Duration? position,
    bool? isPlaying,
  }) {
    return AudioPlayerState(
      duration: duration ?? this.duration,
      position: position ?? this.position,
      isPlaying: isPlaying ?? this.isPlaying,
    );
  }
}

class AudioPlayerScreen extends ConsumerWidget {
  const AudioPlayerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audioState = ref.watch(audioPlayerProvider);
    final audioNotifier = ref.read(audioPlayerProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              // Implement favorite functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Implement share functionality
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Book cover
              Container(
                height: 250,
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThcjTy_SgHP_EnZw53sDkYvB3V67-qXdeyuA&s',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              // Track details
              const Text(
                'Introduction Part 1',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'By Robert Kiyosaki',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // Timestamps and Slider
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_formatDuration(audioState.position)),
                  Text(_formatDuration(audioState.duration)),
                ],
              ),
              Slider(
                value: audioState.position.inSeconds.toDouble(),
                max: audioState.duration.inSeconds.toDouble(),
                onChanged: (value) {
                  audioNotifier.seekTo(Duration(seconds: value.toInt()));
                },
              ),

              // Playback controls with Next, Previous, and Play/Pause
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.skip_previous),
                    onPressed: () => audioNotifier.previous(),
                  ),
                  IconButton(
                    icon: const Icon(Icons.replay_10),
                    onPressed: () => audioNotifier.seekTo(
                        audioState.position - const Duration(seconds: 10)),
                  ),
                  IconButton(
                    icon: Icon(
                        audioState.isPlaying ? Icons.pause : Icons.play_arrow),
                    onPressed: () => audioNotifier.playPause(),
                  ),
                  IconButton(
                    icon: const Icon(Icons.forward_10),
                    onPressed: () => audioNotifier.seekTo(
                        audioState.position + const Duration(seconds: 10)),
                  ),
                  IconButton(
                    icon: const Icon(Icons.skip_next),
                    onPressed: () => audioNotifier.next(),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Track list
              Expanded(
                child: ListView(
                  children: [
                    _buildTrackItem('Introduction Part 1', '12 min'),
                    _buildTrackItem('Introduction Part 2', '24 min'),
                    _buildTrackItem('How Do I Start Getting Rich?', '34 min'),
                    _buildTrackItem('My Job Vs My Business', '15 min'),
                    _buildTrackItem('Money is Not Real', '45 min'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTrackItem(String title, String duration) {
    return ListTile(
      leading: const Icon(Icons.play_circle_outline),
      title: Text(title),
      subtitle: Text(duration),
      trailing: const Icon(Icons.file_download),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "${duration.inHours > 0 ? '${twoDigits(duration.inHours)}:' : ''}$minutes:$seconds";
  }
}
