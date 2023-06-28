import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen(this.onSettingsChanged, this.settings);

  final Settings settings;

  final Function(Settings) onSettingsChanged;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings? settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings!);
      },
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Configurações'),
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              child: Text('Configurações',
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            Expanded(
                child: ListView(
              children: <Widget>[
                _createSwitch(
                    "Sem Glutén",
                    "Só exibe receitas sem glutén!",
                    settings!.isGlutenFree,
                    (value) => setState(() => settings!.isGlutenFree = value)),
                _createSwitch(
                    "Sem Lactose",
                    "Só exibe receitas sem lactose!",
                    settings!.isLactoseFree,
                    (value) => setState(() => settings!.isLactoseFree = value)),
                _createSwitch(
                    "Receitas Veganas",
                    "Só exibe receitas veganas!",
                    settings!.isVegan,
                    (value) => setState(() => settings!.isVegan = value)),
                _createSwitch(
                    "Receitas Vegetarianas",
                    "Só exibe receitas vegetarianas!",
                    settings!.isVegetarian,
                    (value) => setState(() => settings!.isVegetarian = value)),
              ],
            ))
          ],
        ));
  }
}
