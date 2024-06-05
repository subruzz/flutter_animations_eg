import 'package:animation_starter_code/custom_painter_example/bouncing_ball_animation.dart';
import 'package:animation_starter_code/explicit_examples/list_animation.dart';
import 'package:animation_starter_code/explicit_examples/loading_animation.dart';
import 'package:animation_starter_code/explicit_examples/login_animation.dart';
import 'package:animation_starter_code/implicit_examples/animated_color_pallete.dart';
import 'package:animation_starter_code/implicit_examples/animated_shopping_cart_button.dart';
import 'package:animation_starter_code/implicit_examples/animated_tween_animation_builder_example.dart';
import 'package:animation_starter_code/page_route_builder_animation/splash_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
//here we defined the colorscheme then we can use it like this
//  Text(
//  '${(progressAnimation.value * 100).toInt()}%',
//   style: TextStyle(
//     color: Theme.of(context).colorScheme.secondary,
//   ),
          // Define the default brightness and colors.
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.red,
            // ···
            brightness: Brightness.dark,
          ),
          appBarTheme: AppBarTheme(color: Colors.blue),
          // Define the default `TextTheme`. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: TextTheme(
            displayLarge: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            // ···
          ),
        ),
        home: const BouncingBallAnimation());
  }
}
