import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});
  final ArticleModel articleModel;



  @override
  Widget build(BuildContext context) {
    if (articleModel.image == null) {
      return Container();}
    return GestureDetector(
      onTap: (){
       WebViewController controller;
       Navigator.of(context).push(MaterialPageRoute(builder: (context){
           controller = WebViewController()
           ..setJavaScriptMode(JavaScriptMode.unrestricted)
           ..setBackgroundColor(const Color(0x00000000))
           ..setNavigationDelegate(
             NavigationDelegate(
               onProgress: (int progress) {
                 // Update loading bar.
               },
               onPageStarted: (String url) {},
               onPageFinished: (String url) {},
               onWebResourceError: (WebResourceError error) {},
               onNavigationRequest: (NavigationRequest request) {
                 if (request.url.startsWith('https://www.youtube.com/')) {
                   return NavigationDecision.prevent;
                 }
                 return NavigationDecision.navigate;
               },
             ),
           )
           ..loadRequest(Uri.parse(articleModel.url));
         return WebViewWidget(controller: controller);
       }));
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl:articleModel.image!,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => new Icon(Icons.error),
              )),
          const SizedBox(
            height: 12,
          ),
          Text(
            articleModel.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            articleModel.subTitle??' ',
            maxLines: 2,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          )
        ],
      ),
    );
  }
}


