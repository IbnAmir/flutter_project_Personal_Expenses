import 'package:flutter/material.dart';
import '../widgets/transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTx;

  const TransactionList(this.transaction, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No Fuckin Transactions Mr. Idiot',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover)
                ),
              ],
            );
          })
        : ListView(children:
          transaction.map((tx) =>  TransactionItem(
              key: ValueKey(tx.id),
              transaction: tx,
              deleteTx: deleteTx
          )).toList()
          );
            // ListView.builder(
            // itemBuilder: (ctx, index) {
            //   // return Card(
            //   //   child: Row(
            //   //     children: <Widget>[
            //   //       Container(
            //   //         child: Text(
            //   //           '\$${transaction[index].amount.toStringAsFixed(2)}',
            //   //           // tx.amount.toString(),
            //   //           style: TextStyle(
            //   //             fontWeight: FontWeight.bold,
            //   //             fontSize: 20,
            //   //             color: Colors.teal,
            //   //           ),
            //   //         ),
            //   //         margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            //   //         decoration: BoxDecoration(
            //   //           border: Border.all(
            //   //             width: 2,
            //   //             color: Colors.teal,
            //   //           ),
            //   //         ),
            //   //         padding: EdgeInsets.all(10),
            //   //       ),
            //   //       Column(
            //   //         crossAxisAlignment: CrossAxisAlignment.start,
            //   //         children: <Widget>[
            //   //           Text(
            //   //             transaction[index].title,
            //   //             style: Theme.of(context).textTheme.subtitle1,
            //   //
            //   //           ),
            //   //           Text(DateFormat.yMMMd().format(transaction[index].date),
            //   //               style: TextStyle(
            //   //                 color: Colors.grey,
            //   //                 fontWeight: FontWeight.bold,
            //   //                 fontSize: 14,
            //   //               )),
            //   //         ],
            //   //       )
            //   //     ],
            //   //   ),
            //   // );
            //   return TransactionItem(transaction: transaction[index], deleteTx: deleteTx,);
            }
          //   itemCount: transaction.length,
          // );
  }
// }
