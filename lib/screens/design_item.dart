import 'package:flutter/material.dart';
import 'package:news/screens/web_view.dart';

class DesignItem extends StatelessWidget {
  dynamic article ;
  bool isSearch=true;

  DesignItem(this.article,this.isSearch);

  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap: (){
         Navigator.push(context, MaterialPageRoute(builder: (context)=>WebViewScreen(article['url'])));
       },
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 110.0,
                height: 110.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: NetworkImage('${article['urlToImage']}'),
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: Container(
                  height: 120.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          "${article['title']}",
                          style: Theme.of(context).textTheme.bodyText1,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        "'${article['publishedAt']}'",
                        style: const TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
