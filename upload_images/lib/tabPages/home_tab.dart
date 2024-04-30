import 'package:flutter/material.dart';
import 'package:upload_images/models/artilce_model.dart';
import 'package:upload_images/screens/article_screen.dart';
import 'package:upload_images/widgets/custom_tag.dart';
import 'package:upload_images/widgets/image_container.dart';

class HomeTabPage extends StatefulWidget {
  const HomeTabPage({super.key});

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  @override
  Widget build(BuildContext context) {
    Article article = Article.articles[0];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu, color: Colors.white,),
        ),
        ),
        extendBodyBehindAppBar: true,
        body: ListView(padding: EdgeInsets.zero, children: [
          _NewsOfTheDay(article: article),
          _BreakingNews(articles: Article.articles),

        ],
        ),
    );
  }
}


class _BreakingNews extends StatelessWidget {
  const _BreakingNews({
    super.key,
    required this.articles,
  });
  final List<Article> articles;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Noticias de última hora',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              'Más',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            
          ],
        ),
        const SizedBox(height: 20,),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: articles.length,
            itemBuilder: (context, index)
            {
              return Container(
                
                width: MediaQuery.of(context).size.width * .5,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey.shade300,),
                child: InkWell(
                  onTap: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (c) => const ArticleScreen()));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    imageContainer(
                      width: MediaQuery.of(context).size.width * .5,
                      imageUrl: articles[index].imageUrl,
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        articles[index].title,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold, height: 1.5),
                      ),
                      const SizedBox(height: 5,),
                      Text(
                        'Hace ${DateTime.now().difference(articles[index].createdAt).inHours} horas',
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodySmall, 
                      ),
                      Text(
                        'Por ${articles[index].author}',
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodySmall, 
                      ),
                  ],),
                ),
              );
            }
            ),
        )

      
      ],
      ),
    );
  }
}

class _NewsOfTheDay extends StatelessWidget {
  const _NewsOfTheDay({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return imageContainer(
      height: MediaQuery.of(context).size.height * 0.45,
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      imageUrl: article.imageUrl,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTag(backgroundColor: Colors.grey.withAlpha(150), children: [
            Text(
            'Aviso del Dia',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.white,
            ),
          )
          ]),
          const SizedBox(height: 10.0,),
              Text(article.title,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold,
              height: 1.25,
              color: Colors.white,)
              ),
              TextButton(onPressed: (){},
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child: Row(children: [
                Text(
                  'Leer más...',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10.0),
                const Icon(Icons.arrow_right_alt,
                color: Colors.white),
    
              ],
              )
              
    
          )
      
    
          
        ],
      ),
      );
  }
}
