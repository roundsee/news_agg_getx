class SuggestionModel {
  String? id;
  String? datePublish;
  String? author;
  String? header;
  String? category;
  String? title;
  String? slug;
  String? tag;
  double? similarity;
  int? like;
  int? save;
  int? share;

  SuggestionModel(
      {this.id,
      this.datePublish,
      this.author,
      this.header,
      this.category,
      this.title,
      this.slug,
      this.tag,
      this.similarity,
      this.like,
      this.save,
      this.share});
}
