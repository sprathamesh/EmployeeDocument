import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:assignment4/data/models/transactionDocument.dart';
import 'package:assignment4/presentation/bloc/documentBloc.dart';
import 'package:assignment4/presentation/bloc/documentEvent.dart';
import 'package:assignment4/presentation/bloc/documentState.dart';
import 'package:assignment4/presentation/widgets/subtitleText.dart';
import 'package:assignment4/presentation/widgets/titleText.dart';
import 'package:assignment4/presentation/widgets/transactionTable.dart';

class BuildTransactionTab extends StatelessWidget {
  final List<Transaction> transactions;

  const BuildTransactionTab({super.key, required this.transactions});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 728,
      child: ListView.separated(
        itemBuilder: (context, index) {
          final documentBloc = DocumentBloc();
          return BlocProvider.value(
            value: documentBloc,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  title: titleText(transactions[index].address),
                  subtitle: subtitleText(
                    "\nTransaction ID #${transactions[index].transactionId}",
                  ),
                  trailing: BlocBuilder<DocumentBloc, DocumentState>(
                    builder: (context, state) {
                      if (state is ShowTransactionDocumentsState) {
                        return IconButton(
                            onPressed: () {
                              BlocProvider.of<DocumentBloc>(context).add(
                                HideTransactionDocumentsEvent(
                                  transactionId:
                                      transactions[index].transactionId,
                                ),
                              );
                            },
                            icon: Image.asset(
                              'assets/arrow_up.png',
                              color: Colors.grey,
                            ));
                      }
                      return IconButton(
                        onPressed: () {
                          BlocProvider.of<DocumentBloc>(context).add(
                            LoadTransactionDocumentsEvent(
                              transactionId: transactions[index].transactionId,
                            ),
                          );
                        },
                        icon: Image.asset(
                          'assets/right.png',
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                  titleAlignment: ListTileTitleAlignment.center,
                  shape: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(48, 48, 48, 0.05),
                      width: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                BlocBuilder<DocumentBloc, DocumentState>(
                  builder: (context, state) {
                    if (state is ShowTransactionDocumentsState &&
                        state.transactionId ==
                            transactions[index].transactionId) {
                      return transactionTable(
                        context: context,
                        documents: transactions[index].documents,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: transactions.length,
      ),
    );
  }
}