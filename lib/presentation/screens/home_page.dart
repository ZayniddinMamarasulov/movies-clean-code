import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample2/data/datasources/remote/movies_datasource_impl.dart';
import 'package:provider_sample2/domain/repositories/movies_repository_impl.dart';
import 'package:provider_sample2/domain/usecases/popular_movies_use_case_impl.dart';

import '../provider/home_page_vm.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    Provider.of<HomePageViewModel>(context).getMovies();

    return Scaffold(
        appBar: AppBar(
          title: Text("Movie App"),
        ),
        body: Consumer<HomePageViewModel>(
          builder: (context, data, child) {
            if (data.popularMovies.isNotEmpty) {
              return ListView.builder(
                  itemCount: data.popularMovies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Container(
                        height: 240,
                        child: Row(
                          children: [
                            Image.network(
                                "${data.imgUrl}${data.popularMovies[index].posterPath}"),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    Text(
                                      data.popularMovies[index].title ?? "...",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
