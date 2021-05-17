abstract class SongProtocol {
  Future<void> play();
  Future<void> pause();
  Future<void> previousSong();
  Future<void> nextSong();
}

class Song {
  String name, author, songLength;
  Song({
    this.name,
    this.author,
    this.songLength,
  });
}