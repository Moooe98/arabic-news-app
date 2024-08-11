class ArticleModel{
   final String? image;
   final String title;
   final String? subTitle;
   final String url;


  ArticleModel( {required this.image,required this.title,required this.subTitle, required this.url});

  factory ArticleModel.fromJson(json){
    return  ArticleModel(
        url: json['url'],
        image: json['image'],
        title: json['title'],
        subTitle: json['description']
    );
   }

}