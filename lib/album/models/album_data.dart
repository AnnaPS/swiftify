class AlbumData {
  AlbumData({
    required this.albumId,
    required this.albumTitle,
    required this.coverAlbum,
    required this.albumReleaseDate,
  });

  final int albumId;
  final String albumTitle;
  final String? coverAlbum;
  final String albumReleaseDate;
}
