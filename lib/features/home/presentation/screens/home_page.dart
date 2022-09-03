import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../bloc/popular_bloc.dart';
import '../provider/home_page_vm.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<PopularBloc>().add(GetPopularMoviesEvent());
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<HomePageViewModel>(context).getMovies();

    return Scaffold(
      appBar: AppBar(
        title: Text("Movie App"),
      ),
      body: BlocBuilder<PopularBloc, PopularState>(
        builder: (context, state) {
          if (state is PopularLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is PopularError) {
            return Center(child: Text(state.error));
          }
          if (state is PopularSuccess) {
            return ListView.builder(
                itemCount: state.movies?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Container(
                      height: 240,
                      child: Row(
                        children: [
                          Image.network(
                              "${state.imgUrl}${state.movies?[index].posterPath}"),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Text(
                                    state.movies?[index].title ?? "...",
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
            return Container();
          }
        },
      ),
      // body: Consumer<HomePageViewModel>(
      //   builder: (context, data, child) {
      //     if (data.popularMovies.isNotEmpty) {
      //       return ListView.builder(
      //           itemCount: data.popularMovies.length,
      //           itemBuilder: (BuildContext context, int index) {
      //             return Card(
      //               child: Container(
      //                 height: 240,
      //                 child: Row(
      //                   children: [
      //                     Image.network(
      //                         "${data.imgUrl}${data.popularMovies[index].posterPath}"),
      //                     Expanded(
      //                       child: Padding(
      //                         padding: EdgeInsets.all(8),
      //                         child: Column(
      //                           children: [
      //                             Text(
      //                               data.popularMovies[index].title ?? "...",
      //                               style: const TextStyle(
      //                                   fontWeight: FontWeight.w500),
      //                             )
      //                           ],
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             );
      //           });
      //     } else {
      //       return Center(child: CircularProgressIndicator());
      //     }
      //   },
      // ),
    );
  }
}
