class IndustryModel {
  final List<Industry> industry;
  final List<Industry> noiconIndustry;

  IndustryModel({
    required this.industry,
    required this.noiconIndustry,
  });

  factory IndustryModel.fromJson(dynamic json) {
    // API may return a bare list of industries instead of an object
    if (json is List) {
      return IndustryModel(
        industry: json
            .whereType<Map<String, dynamic>>()
            .map((e) => Industry.fromJson(e))
            .toList(),
        noiconIndustry: [],
      );
    }
    if (json is! Map<String, dynamic>) {
      return IndustryModel(industry: [], noiconIndustry: []);
    }
    return IndustryModel(
      industry: (json['industry'] as List?)
              ?.map((e) => Industry.fromJson(e))
              .toList() ??
          [],

      noiconIndustry: (json['noiconIndustry'] as List?)
              ?.map((e) => Industry.fromJson(e))
              .toList() ??
          [],
    );
  }
}
class Industry {
  final String cateName;
  final int catId;
  final String icon;
  final int site;
  final List<String> bindTags;

  Industry({
    required this.cateName,
    required this.catId,
    required this.icon,
    required this.site,
    required this.bindTags,
  });

  factory Industry.fromJson(Map<String, dynamic> json) {
    return Industry(
      cateName: json['cate_name'] ?? '',
      catId: json['cat_id'] ?? 0,
      icon: json['icon'] ?? '',
      site: json['site'] ?? 0,

      bindTags: (json['bind_tags'] as List?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
    );
  }
}