import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Items extends Equatable{
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
  final IconData iconData;
  

   const Items({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.body,
    required this.author,
    required this.authorImageUrl,
    required this.category,
    required this.imageUrl,
    required this.views,
    required this.iconData,
    required this.createdAt});


  static List<Items> items = [
    Items(
    id: '1',
    title: 'Ralizar Pago',
    subtitle: 'Sube aqui tu comprobante',
    body: 'This article covers the basics of Flutter, the benefits of using Flutter for cross-platform development, and how to get started with your first Flutter project.',
    author: 'Jane Doe',
    authorImageUrl: 'https://images.unsplash.com/photo-1713708613723-cbf297cdacf6',
    category: 'Technology',
    imageUrl: 'https://images.unsplash.com/photo-1713708613723-cbf297cdacf6',
    views: 1500,
    createdAt: DateTime(2024, 4, 20),
    iconData: Icons.monetization_on
  ),
  Items(
    id: '2',
    title: 'Reportes',
    subtitle: 'Sube aqui tus reportes de anomalías',
    body: 'State management is crucial in Flutter applications. This article explores various methods such as Provider, Bloc, and Riverpod to manage state efficiently.',
    author: 'John Smith',
    authorImageUrl: 'https://images.unsplash.com/photo-1714227329153-433a22882346?q=80&w=1200&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    category: 'Programming',
    imageUrl: 'https://images.unsplash.com/photo-1714227329153-433a22882346?q=80&w=1200&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    views: 2300,
    createdAt: DateTime(2024, 4, 21),
    iconData: Icons.warning,
  ),
  Items(
    id: '3',
    title: 'Encuestas',
    subtitle: 'Tu opinion es importante',
    body: 'Firebase offers a variety of services that are incredibly useful for mobile app development. This article details how to integrate Firebase authentication and Firestore into a Flutter app.',
    author: 'Alice Johnson',
    authorImageUrl: 'https://images.unsplash.com/photo-1714227329153-433a22882346?q=80&w=1200&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    category: 'Mobile Apps',
    imageUrl: 'https://images.unsplash.com/photo-1714227329153-433a22882346?q=80&w=1200&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    views: 500,
    createdAt: DateTime(2024, 4, 22),
    iconData: Icons.chat,
  ),
  Items(
    id: '4',
    title: 'Ubicacion',
    subtitle: 'Información de trafico',
    body: 'With the rise of Flutter 3 and beyond, what can developers expect from this framework? This article discusses upcoming features and the roadmap for Flutter.',
    author: 'Dave Lee',
    authorImageUrl: 'https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    category: 'Tech Trends',
    imageUrl: 'https://images.unsplash.com/photo-1498050108023-c5249f4df085?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    views: 1200,
    createdAt: DateTime(2024, 4, 23),
    iconData: Icons.location_on
  ),
  Items(
    id: '5',
    title: 'Seguridad',
    subtitle: 'Informes de seguridad',
    body: 'Optimization is key in creating smooth and efficient applications. This article provides tips on improving performance in your Flutter apps.',
    author: 'Emily White',
    authorImageUrl: 'https://images.unsplash.com/photo-1542744173-8e7e53415bb0?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    category: 'Best Practices',
    imageUrl: 'https://images.unsplash.com/photo-1581091012184-7e0cdfbb6799?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    views: 800,
    createdAt: DateTime(2024, 4, 24),
    iconData: Icons.security
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
    createdAt,
    iconData,
  ];

}