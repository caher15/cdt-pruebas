import 'package:flutter/material.dart';
import 'package:upload_images/models/artilce_model.dart';
import 'package:upload_images/models/items_model.dart';
import 'package:upload_images/screens/article_screen.dart';
import 'package:upload_images/widgets/colors.dart';
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
    Items items = Items.items[0];
    return Scaffold(
      backgroundColor: AppColors.backgroundColor2,
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
          _OtherNews(items: Items.items),

        ],
        ),
    );
  }
}


class _OtherNews extends StatelessWidget {
  const _OtherNews({
    super.key,
    required this.items,
  });
  final List<Items> items;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Items',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'More',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              
            ],
          ),
        ),
       SizedBox(  
  height: MediaQuery.of(context).size.height*.6,  // Asegúrate de que esta altura es adecuada para tu diseño.
  child: Column(
    children: List.generate(items.length, (index) => Container(

      alignment: AlignmentDirectional.topStart,
      width: MediaQuery.of(context).size.width,
      height: 70,
      margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryColor2
        
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (c) => const ArticleScreen()));
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Icon(
                items[index].iconData,
                color: Colors.black87,
                size: 50),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    Text(
                      items[index].title,
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          items[index].subtitle,
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Icon(
              Icons.arrow_circle_right_outlined,
              color: Colors.black87,
              size: 45),
          ],
        ),
      ),
    )),
  ),
),

      ],
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

    return Column(
      children: [
      Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 10),
        child: Row(
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
      ),
      const SizedBox(height: 5,),
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
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: AppColors.primaryColor2,),
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
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        articles[index].title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold, height: 1.5),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        'Hace ${DateTime.now().difference(articles[index].createdAt).inHours} horas',
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodySmall, 
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        'Por ${articles[index].author}',
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodySmall, 
                      ),
                    ),
                ],),
              ),
            );
          }
          ),
      )
    
    
    ],
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
      height: MediaQuery.of(context).size.height * 0.30,
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
