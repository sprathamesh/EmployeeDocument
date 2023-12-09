import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:assignment4/presentation/bloc/documentBloc.dart';
import 'package:assignment4/presentation/bloc/documentEvent.dart';
import 'package:assignment4/presentation/bloc/documentState.dart';
import 'package:assignment4/presentation/widgets/tabs.dart';
import 'package:assignment4/presentation/widgets/transactionTab.dart';
import '../../../../data/models/document.dart';

// for document screen
class DesktopDocumentScreen extends StatefulWidget {
  const DesktopDocumentScreen({super.key});

  @override
  State<DesktopDocumentScreen> createState() => _DesktopDocumentScreenState();
}

class _DesktopDocumentScreenState extends State<DesktopDocumentScreen> {
  @override
  void initState() {
    BlocProvider.of<DocumentBloc>(context).add(DocumentsInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 34, horizontal: 30),
        child: DefaultTabController(
          length: 04,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Text(
                  "Documents",
                  style: GoogleFonts.roboto(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              /// Padding
              const SizedBox(
                height: 30,
              ),

              /// Building the tab bar
              Container(
                width: 750,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 197, 190, 190),
                ),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: const Color.fromARGB(255, 204, 111, 111),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFF2F2F2),
                  ),
                  dividerColor: Colors.transparent,
                  tabs: const [
                    Tab(
                      text: "Joining Documents",
                    ),
                    Tab(
                      text: "Transaction Documents",
                    ),
                    Tab(
                      text: "Team Documents",
                    ),
                    Tab(
                      text: "Tax Documents",
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 30,
              ),
              
              Expanded(
                child: TabBarView(
                  children: [
                    /// joining doc
                    BlocBuilder<DocumentBloc, DocumentState>(
                      builder: (context, state) {
                        if (state is DocumentsFetchedState) {
                          return buildTabs(documents: DocumentsData.joining);
                        }
                        return buildTabs(documents: DocumentsData.joining);
                      },
                    ),

                    /// transaction doc
                    BlocBuilder<DocumentBloc, DocumentState>(
                      builder: (context, state) {
                        if (state is DocumentsFetchedState) {
                          return BuildTransactionTab(
                            transactions: DocumentsData.transactions,
                          );
                        }
                        return BuildTransactionTab(
                            transactions: DocumentsData.transactions);
                      },
                    ),

                    /// team doc
                    BlocBuilder<DocumentBloc, DocumentState>(
                      builder: (context, state) {
                        if (state is DocumentsFetchedState) {
                          return buildTabs(documents: DocumentsData.team);
                        }
                        return buildTabs(documents: DocumentsData.team);
                      },
                    ),

                    /// tax doc
                    BlocBuilder<DocumentBloc, DocumentState>(
                      builder: (context, state) {
                        if (state is DocumentsFetchedState) {
                          return buildTabs(documents: DocumentsData.tax);
                        }
                        return buildTabs(documents: DocumentsData.tax);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}