import 'package:flutter/material.dart';

import '../styling/main_screen_styles.dart';

class pizzaPhotoInCornerWidget extends StatelessWidget {
  const pizzaPhotoInCornerWidget.pizzavuglu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: 170, //MediaQuery.of(context).size.width ,
        child: Image.network(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpJeSmr8Wt-dK3vkDEQayqePNWuwH3RG-_xc7TTN9LBfNgV4GrBucpu0Z7S3BZYnD2b7I&usqp=CAU',
        ),
        transform: Matrix4.translationValues(0, 0, 0),
      ),
    );
  }
}

class kakoetesto extends StatelessWidget {
  const kakoetesto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 20, bottom: 7),
      child: Text(
        "Тип теста:",
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}

class viborparametrov extends StatelessWidget {
  const viborparametrov({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Выберите параметры:",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline5,
      //TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
    );
  }
}

class zagolovok extends StatelessWidget {
  const zagolovok({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class razmerpizzi extends StatelessWidget {
  const razmerpizzi({
    Key? key,
    required int pizzaRadius,
  })  : _pizzaRadius = pizzaRadius,
        super(key: key);

  final int _pizzaRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(top: 20, left: 20),
      child: Text(
        "Радиус пиццы, в см: $_pizzaRadius",
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}

class zakazat extends StatelessWidget {
  const zakazat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: buyBtnStyle,
      onPressed: () {},
      child: const Text('Заказать'),
    );
  }
}

class viborsousa extends StatelessWidget {
  const viborsousa({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        "Соус:",
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
