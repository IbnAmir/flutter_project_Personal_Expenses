import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTx;

  TransactionList(this.transaction, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No Fuckin Transactions Mr. Idiot',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    height: 200,
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover)),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                // return Card(
                //   child: Row(
                //     children: <Widget>[
                //       Container(
                //         child: Text(
                //           '\$${transaction[index].amount.toStringAsFixed(2)}',
                //           // tx.amount.toString(),
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 20,
                //             color: Colors.teal,
                //           ),
                //         ),
                //         margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                //         decoration: BoxDecoration(
                //           border: Border.all(
                //             width: 2,
                //             color: Colors.teal,
                //           ),
                //         ),
                //         padding: EdgeInsets.all(10),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: <Widget>[
                //           Text(
                //             transaction[index].title,
                //             style: Theme.of(context).textTheme.subtitle1,
                //
                //           ),
                //           Text(DateFormat.yMMMd().format(transaction[index].date),
                //               style: TextStyle(
                //                 color: Colors.grey,
                //                 fontWeight: FontWeight.bold,
                //                 fontSize: 14,
                //               )),
                //         ],
                //       )
                //     ],
                //   ),
                // );
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text('\$${transaction[index].amount}')),
                      ),
                    ),
                    title: Text(
                      transaction[index].title,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transaction[index].date),
                    ),
                    trailing:
                        IconButton(
                            onPressed:() => deleteTx(transaction[index].id),
                            icon: Icon(Icons.delete),
                           color: Theme.of(context).errorColor,
                        ),
                  ),
                );
              },
              itemCount: transaction.length,
            );
  }
}
