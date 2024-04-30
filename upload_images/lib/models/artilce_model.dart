import 'package:equatable/equatable.dart';

class Article extends Equatable{
  final String id;
  final String title;
  final String subtitle;
  final String body;
  final String author;
  final String authorImageUrl;
  final String category;
  final String imageUrl;
  final int views;
  final DateTime createdAt;

   const Article({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.body,
    required this.author,
    required this.authorImageUrl,
    required this.category,
    required this.imageUrl,
    required this.views,
    required this.createdAt});


  static List<Article> articles = [
    Article(
    id: '1',
    title: 'No hay Agua',
    subtitle: 'Learn about the ins and outs of Flutter development',
    body: 'This article covers the basics of Flutter, the benefits of using Flutter for cross-platform development, and how to get started with your first Flutter project.',
    author: 'Jane Doe',
    authorImageUrl: 'https://images.pexels.com/photos/861414/pexels-photo-861414.jpeg',
    category: 'Technology',
    imageUrl: 'https://images.pexels.com/photos/861414/pexels-photo-861414.jpeg',
    views: 1500,
    createdAt: DateTime(2024, 4, 20),
  ),
  Article(
    id: '2',
    title: 'Ya se instalo el nuevo alumbrado en el parque',
    subtitle: 'Exploring different state management techniques in Flutter',
    body: 'State management is crucial in Flutter applications. This article explores various methods such as Provider, Bloc, and Riverpod to manage state efficiently.',
    author: 'John Smith',
    authorImageUrl: 'https://images.pexels.com/photos/53514/street-lamp-lantern-afterglow-light-53514.jpeg',
    category: 'Programming',
    imageUrl: 'https://images.pexels.com/photos/53514/street-lamp-lantern-afterglow-light-53514.jpeg',
    views: 2300,
    createdAt: DateTime(2024, 4, 21),
  ),
  Article(
    id: '3',
    title: 'Ahora la cancha de futbol es de pasto sintetico',
    subtitle: 'A guide to seamlessly integrating Firebase services with your Flutter apps',
    body: 'Firebase offers a variety of services that are incredibly useful for mobile app development. This article details how to integrate Firebase authentication and Firestore into a Flutter app.',
    author: 'Alice Johnson',
    authorImageUrl: 'https://images.pexels.com/photos/274506/pexels-photo-274506.jpeg',
    category: 'Mobile Apps',
    imageUrl: 'https://images.pexels.com/photos/274506/pexels-photo-274506.jpeg',
    views: 500,
    createdAt: DateTime(2024, 4, 22),
  ),
  Article(
    id: '4',
    title: 'Se corto el pasto de todo el fraccionamiento',
    subtitle: 'Se corto el pasto de todo el fraccionamiento',
    body: 'With the rise of Flutter 3 and beyond, what can developers expect from this framework? This article discusses upcoming features and the roadmap for Flutter.',
    author: 'Dave Lee',
    authorImageUrl: 'https://images.pexels.com/photos/212324/pexels-photo-212324.jpeg',
    category: 'Tech Trends',
    imageUrl: 'https://images.pexels.com/photos/212324/pexels-photo-212324.jpeg',
    views: 1200,
    createdAt: DateTime(2024, 4, 23),
  ),
  Article(
    id: '5',
    title: 'No habra luz de 6 a 8 de la noche',
    subtitle: 'Best practices for enhancing your Flutter app\'s performance',
    body: 'Optimization is key in creating smooth and efficient applications. This article provides tips on improving performance in your Flutter apps.',
    author: 'Emily White',
    authorImageUrl: 'https://images.pexels.com/photos/53514/street-lamp-lantern-afterglow-light-53514.jpeg',
    category: 'Best Practices',
    imageUrl: 'https://images.pexels.com/photos/53514/street-lamp-lantern-afterglow-light-53514.jpeg',
    views: 800,
    createdAt: DateTime(2024, 4, 24),
  ),
  ];

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    title,
    subtitle,
    body,
    author,
    authorImageUrl,
    category,
    imageUrl,
    views,
    createdAt
  ];

}