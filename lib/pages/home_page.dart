import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_app_using_bloc/bloc/search_bloc.dart';
import 'package:search_app_using_bloc/bloc/search_event.dart';
import 'package:search_app_using_bloc/bloc/search_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();
  final searchControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: searchControler,
                onChanged: (value) {
                  context.read<SearchBloc>().add(SearchWord(value));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is LoadedState) {
                    return ListView.builder(
                      itemCount: state.words.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Text(state.words[index]);
                      },
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
