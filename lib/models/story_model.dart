class Story {
  final String id;
  final String title;
  final String? coverImage;
  final List<StoryLine> lines;

  final String description;
  final int routePoints;     
  final int routeTime;
  final String status;

  Story({
    required this.id,
    required this.title,
    this.coverImage,
    required this.lines,
    required this.description,
    required this.routePoints,
    required this.routeTime,
    required this.status,
  });
}

class StoryLine {
  final String text;
  final String? character;
  final String? image;
  final bool isMainHero;
  final bool isNarration;
  final String? backgroundImage;

  final bool isInfoCard;
  final String? infoTitle;
  final String? infoDescription;
  final String? infoImage;

  StoryLine({
    required this.text,
    this.character,
    this.image,
    this.isMainHero = false,
    this.isNarration = false,
    this.backgroundImage,

    this.isInfoCard = false,
    this.infoTitle,
    this.infoDescription,
    this.infoImage,
  });
}