import 'package:flutter/material.dart';

import '../../models/food_model.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  int i = 0;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late ListModel<FoodsData> _list;
  FoodsData? _selectedItem;
  late FoodsData _nextItem;

  @override
  void initState() {
    super.initState();
    _list = ListModel<FoodsData>(
      listKey: _listKey,
      initialItems: fruits,
      removedItemBuilder: _buildRemovedItem,
    );
    _nextItem = veggies[i];
  }

  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    return CardItem(
      animation: animation,
      item: _list[index],
      selected: _selectedItem == _list[index],
      onTap: () {
        setState(() {
          _selectedItem = _selectedItem == _list[index] ? null : _list[index];
        });
      },
    );
  }

  Widget _buildRemovedItem(
      FoodsData item, BuildContext context, Animation<double> animation) {
    return CardItem(
      animation: animation,
      item: item,
      // No gesture detector here: we don't want removed items to be interactive.
    );
  }

  void _insert() {
    final int index =
        _selectedItem == null ? _list.length : _list.indexOf(_selectedItem!);
    _list.insert(index, veggies[i++]);
  }

  void _remove() {
    if (_selectedItem != null) {
      _list.removeAt(_list.indexOf(_selectedItem!));
      setState(() {
        _selectedItem = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fruits and Veggies'),
          elevation: 0,
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_circle),
              onPressed: _insert,
              tooltip: 'insert a new item',
            ),
            IconButton(
              icon: const Icon(Icons.remove_circle),
              onPressed: _remove,
              tooltip: 'remove the selected item',
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
          child: AnimatedList(
            key: _listKey,
            initialItemCount: _list.length,
            itemBuilder: _buildItem,
          ),
        ),
      ),
    );
  }
}

class ListModel<E> {
  ListModel({
    required this.listKey,
    required this.removedItemBuilder,
    Iterable<E>? initialItems,
  }) : _items = List<E>.from(initialItems ?? <E>[]);

  final GlobalKey<AnimatedListState> listKey;
  final RemovedItemBuilder<E> removedItemBuilder;
  final List<E> _items;

  AnimatedListState? get _animatedList => listKey.currentState;

  void insert(int index, E item) {
    _items.insert(index, item);
    _animatedList!.insertItem(index);
  }

  E removeAt(int index) {
    final E removedItem = _items.removeAt(index);
    if (removedItem != null) {
      _animatedList!.removeItem(
        index,
        (BuildContext context, Animation<double> animation) {
          return removedItemBuilder(removedItem, context, animation);
        },
      );
    }
    return removedItem;
  }

  int get length => _items.length;

  E operator [](int index) => _items[index];

  int indexOf(E item) => _items.indexOf(item);
}

typedef RemovedItemBuilder<T> = Widget Function(
    T item, BuildContext context, Animation<double> animation);

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    this.onTap,
    this.selected = false,
    required this.animation,
    required this.item,
  }) : super(key: key);

  final Animation<double> animation;
  final VoidCallback? onTap;
  final FoodsData item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle =
        Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 20);
    Color containerColor = Color.fromARGB(255, 199, 218, 199);
    if (selected) {
      //textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
      containerColor = Colors.red;
    }
    return Padding(
        padding: const EdgeInsets.all(2.0),
        child: SizeTransition(
          sizeFactor: animation,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTap,
            child: SizedBox(
              height: 80.0,
              child: ListTile(
                tileColor: containerColor,
                title: Text(item.title, style: textStyle),
                leading: Container(
                  height: 50,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5), ),
                  child: Image.asset(item.image),
                ),
              ),
            ),
          ),
        ));
  }
}
