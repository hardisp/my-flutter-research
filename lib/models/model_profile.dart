part of experiment_model;

class ModelProfile {
  const ModelProfile({
    required this.name,
    required this.distance,
    required this.imageAsset,
    this.bgColor,
  });
  final String name;
  final String distance;
  final String imageAsset;
  final Color? bgColor;
}
