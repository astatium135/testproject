const titleKey = 'title';
const descriptionKey = 'description';
const dateTimeKey = 'publishingDate';
const authorKey = 'author';

class News{
  late String title;
  late String description;
  late DateTime? dateTime;
  late String author;
  News.fromJson(Map<String, dynamic> json){
    this.title = json[titleKey] ?? '';
    this.description = json[descriptionKey] ?? '';
    this.dateTime = json[dateTimeKey] !=null ? DateTime.parse(json[dateTimeKey]) : null;
    this.author = json[authorKey];
  }
}