import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  late Color _bgColor;
  
  @override
  initState(){
    const availableColors = [
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.purple,
    ];
    
    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
                child: Text('\$${widget.transaction.amount}')),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme
              .of(context)
              .textTheme
              .subtitle1,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transaction.date),
        ),
        trailing: MediaQuery
            .of(context)
            .size
            .width > 460
            ? TextButton.icon(
          // textColor: Theme.of(context).errorColor,
          onPressed: () => widget.deleteTx(widget.transaction.id),
          label: const Text('Delete'),
          icon: const Icon(Icons.delete),
        )
            : IconButton(
          onPressed: () => widget.deleteTx(widget.transaction.id),
          icon: const Icon(Icons.delete),
          color: Theme
              .of(context)
              .errorColor,
        ),
      ),
    );
  }
}