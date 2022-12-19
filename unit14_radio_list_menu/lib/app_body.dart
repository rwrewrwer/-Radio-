import 'package:flutter/material.dart';

var cities = ['倫敦', '東京', '舊金山'];

class AppBody extends StatelessWidget {

  final ValueNotifier<String> _cityName = ValueNotifier('');
  final ValueNotifier<int> _selectedCity = ValueNotifier(0);

  AppBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final btn = ElevatedButton(
      child: const Text('確定'),
      onPressed: () {
        _cityName.value =
        _selectedCity.value < 0 ? '' : cities[_selectedCity.value];
      },
    );

    final widget = Center(
      child: Column(
        children: <Widget>[
          Container(
            child: ValueListenableBuilder<int>(
              builder: _radioButtonBuilder,
              valueListenable: _selectedCity,
            ),
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
          Container(child: btn, margin: const EdgeInsets.symmetric(vertical: 10),),
          Container(
            child: ValueListenableBuilder<String>(
              builder: _cityNameWidgetBuilder,
              valueListenable: _cityName,
            ),
          ),
        ],
      ),
    );

    return widget;
  }

  Widget _cityNameWidgetBuilder(BuildContext context, String cityName, Widget? child) {
    final widget = Text(cityName,
        style: const TextStyle(fontSize: 20));
    return widget;
  }

  Widget _radioButtonBuilder(BuildContext context, int selectedItem, Widget? child) {
    var radioItems = <RadioListTile>[];

    // 把選項加入radioItems
    for (var i = 0; i < cities.length; i++) {
      radioItems.add(
          RadioListTile(
            value: i,
            groupValue: _selectedCity.value,
            title: Text(cities[i], style: const TextStyle(fontSize: 20),),
            onChanged: (value) => _selectedCity.value = value,
          )
      );
    }

    final wid = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: radioItems,
    );

    return wid;
  }
}
