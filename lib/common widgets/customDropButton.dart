import 'package:autoaidv5/cubits/request/request_cubit.dart';
import 'package:flutter/material.dart';

class DropdownButtonExample extends StatefulWidget {
  DropdownButtonExample({required this.list, super.key});
  List<Map<String, dynamic>> list = [];

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  Map<String, dynamic>? value;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Map<String, dynamic>>(
      isExpanded: true,
      value: value,
      hint: Text("Please choose a service"),
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.black87),
      underline: Container(
        height: 2,
        color: Colors.black87,
      ),
      onChanged: (Map<String, dynamic>? v) {
        setState(() {
          value = v!;
          RequestCubit.get(context).value = v;
        });
      },
      items: widget.list.map<DropdownMenuItem<Map<String, dynamic>>>(
          (Map<String, dynamic> value) {
        return DropdownMenuItem<Map<String, dynamic>>(
          value: value,
          child: Text(value["name"]),
        );
      }).toList(),
    );
  }
}
