import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          body: const Card(child: ListTile()),
          appBar: AppBar(
            title: const Text('Tranferencias'),
            backgroundColor: Colors.blue.shade200,
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.blue.shade200,
            onPressed: () => {},
          ),
        ),
      ),
    );
