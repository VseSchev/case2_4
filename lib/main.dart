import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';

import 'styling/main_screen_styles.dart';
import 'widgets/main_screen.dart';

void main() {
  runApp(const PizzaApp());
}

const String appTitle = 'Калькулятор пиццы';

class PizzaApp extends StatelessWidget {
  const PizzaApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: globalThemeLight(),
      home: const PizzaAppHomePage(),
    );
  }
}

class PizzaAppHomePage extends StatefulWidget {
  const PizzaAppHomePage({Key? key}) : super(key: key);
  @override
  State<PizzaAppHomePage> createState() => _PizzaAppHomePageState();
}

enum Souce { ostr, kislslad, sirn }

class _PizzaAppHomePageState extends State<PizzaAppHomePage> {
  double _cost = 0;
  bool _isTonkoeTesto = false;
  int _pizzaRadius = 15;
  Souce? _souce = Souce.ostr;
  bool _addCheese = false;

  var _icon = Icons.wb_sunny;

  double _calcCost() {
    _cost = 0;
    if (_isTonkoeTesto) {
      _cost += 15;
    } else {
      _cost += 30;
    }

    switch (_pizzaRadius) {
      case 15:
        _cost += 100;
        break;
      case 30:
        _cost += 150;
        break;
      case 45:
        _cost += 200;
        break;
      case 60:
        _cost += 300;
        break;
    }

    switch (_souce) {
      case Souce.ostr:
        _cost += 20;
        break;
      case Souce.kislslad:
        _cost += 15;
        break;
      case Souce.sirn:
        _cost += 10;
        break;
      default:
        _cost += 0;
    }

    _addCheese == true ? _cost += 50 : _cost += 0;

    return _cost;
  }

  void _onSouceChanged(Souce? value) {
    setState(() {
      _souce = value;
      setState(() {
        _calcCost();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text(appTitle)),
      body: SingleChildScrollView(
        child: Container(
          //color: Colors.white,
          child: Column(
            children: [
              pizzaPhotoInCornerWidget.pizzavuglu(),
              zagolovok(text: appTitle),
              const SizedBox(height: 10),
              viborparametrov(),
              const SizedBox(height: 20),
              kakoetesto(),
              tiptesta(),
              Divider(),
              razmerpizzi(pizzaRadius: _pizzaRadius),
              razmerpizzivibor(),
              const SizedBox(height: 3),
              const Divider(),
              viborsousa(),
              ostriy(),
              kisliy(),
              sirniy(),
              const SizedBox(height: 5),
              const Divider(),
              dopolnitelniysir(context),
              stoimostpizzi(),
              zakazat(),
            ],
          ),
        ),
      ),
    );
  }

  Padding stoimostpizzi() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: Text(
          "Стоимость : ${_calcCost()} руб.",
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }

  SizedBox dopolnitelniysir(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        elevation: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 20,
              ),
              child: SizedBox(
                width: 70,
                height: 70,
                child: Image.network(
                  'https://i.insider.com/61951eb18e9bfa0019875316?width=1200&format=jpeg',
                ),
              ),
            ),
            Text(
              'Дополнительный сыр',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Switch(
              value: _addCheese,
              onChanged: (bool value) {
                setState(() {
                  _addCheese = value;
                  _calcCost();
                });
              },
              activeThumbImage: new NetworkImage(
                  'https://www.freeiconspng.com/thumbs/yes-png/yes-png-9.png'),
              inactiveThumbImage: new NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d5/No_sign.svg/300px-No_sign.svg.png'),
            ),
          ],
        ),
      ),
    );
  }

  SlidingSwitch tiptesta() {
    return SlidingSwitch(
      value: _isTonkoeTesto,
      width: 280,
      onChanged: (bool value) {
        _isTonkoeTesto = value;
        setState(() {
          _calcCost();
        });
      },
      height: 35,
      animationDuration: const Duration(milliseconds: 400),
      onTap: () {},
      onDoubleTap: () {},
      onSwipe: () {},
      textOff: "Обычное тесто",
      textOn: "Тонкое тесто",
      colorOn: const Color(0xffdc6c73),
      colorOff: const Color(0xff6682c0),
      background: const Color(0xffe4e5eb),
      buttonColor: const Color(0xfff7f5f7),
      inactiveColor: const Color(0xff636f7b),
    );
  }

  SizedBox sirniy() {
    return SizedBox(
      height: 30,
      child: RadioListTile<Souce>(
        title: Text('Сырный'),
        value: Souce.sirn,
        groupValue: _souce,
        onChanged: _onSouceChanged,
      ),
    );
  }

  SizedBox kisliy() {
    return SizedBox(
      height: 30,
      child: RadioListTile<Souce>(
        title: Text('Кисло-сладкий'),
        value: Souce.kislslad,
        groupValue: _souce,
        onChanged: _onSouceChanged,
      ),
    );
  }

  SizedBox ostriy() {
    return SizedBox(
      height: 30,
      child: RadioListTile<Souce>(
        title: Text('Острый'),
        value: Souce.ostr,
        groupValue: _souce,
        onChanged: _onSouceChanged,
      ),
    );
  }

  SliderTheme razmerpizzivibor() {
    return SliderTheme(
      data: SliderThemeData(
        thumbColor: Theme.of(context).splashColor, //Colors.green,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
        showValueIndicator: ShowValueIndicator.never,
      ),
      child: Slider(
        value: _pizzaRadius.toDouble(),
        min: 15,
        max: 60,
        divisions: 3,
        label: _pizzaRadius.round().toString(),
        onChanged: (double value) {
          setState(() {
            _pizzaRadius = value.toInt();
            setState(() {
              _calcCost();
            });
          });
        },
      ),
    );
  }
}
