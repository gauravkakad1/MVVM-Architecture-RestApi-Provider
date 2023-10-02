import 'package:flutter/material.dart';
import 'package:mvvm_architecture_restapi_provider/data/response/api_response.dart';
import 'package:mvvm_architecture_restapi_provider/data/response/status.dart';
import 'package:mvvm_architecture_restapi_provider/model/MovieListModel.dart';
import 'package:mvvm_architecture_restapi_provider/utils/routes/routes_name.dart';
import 'package:mvvm_architecture_restapi_provider/utils/utils.dart';
import 'package:mvvm_architecture_restapi_provider/view_model/home_view_model.dart';
import 'package:mvvm_architecture_restapi_provider/view_model/services/splash_services.dart';
import 'package:mvvm_architecture_restapi_provider/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeViewViewModel = HomeViewViewModel();
  @override
  void initState() {
    homeViewViewModel.fetchMovieListApi();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPreferance = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Movies List",style: Theme.of(context).textTheme.titleLarge,),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: (){
              userPreferance.removeUser().then((value){
                Navigator.pushNamed(context, RoutesName.login);
              });
            },
            child: Center(
              child: Text("Logout"),
            ),
          ),
          SizedBox(width: 20,)
        ],
      ),
      body: ChangeNotifierProvider<HomeViewViewModel>(
        create: (BuildContext context) => homeViewViewModel,
        child: Consumer<HomeViewViewModel>(
          builder: (context, value, child) {
            switch(value.movieList.status){
              case Status.LOADING :
                return SafeArea(child: Center(child: CircularProgressIndicator(),));
              case Status.ERROR:
                return SafeArea(child: Center(child: Text(value.movieList.message.toString()),));
              case Status.COMPLETED:
                return SafeArea(
                  child: ListView.builder(
                      itemCount: value.movieList.data!.movies!.length,
                      itemBuilder : (context, index) {
                        return Card(

                          child: ListTile(
                            leading: Image.network(value.movieList.data!.movies![index].posterurl.toString(),
                              width: 50,height: 50,
                              errorBuilder: (context, error, stackTrace) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 20),
                                  child: Icon(Icons.error,color: Colors.red,),
                                );
                              },
                            ),
                            title: Text(value.movieList.data!.movies![index].title.toString()),
                            subtitle: Text(value.movieList.data!.movies![index].year.toString()),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                              Text(Utils.avgMovieRating(value.movieList.data!.movies![index].ratings!).toStringAsFixed(1)),
                              Icon(Icons.star,color: Colors.yellow,)

                            ],)
                          )

                        );
                      },
                  ),
                );
              default :
                return Container();
            }
            return Container();
          },
        ),
      ),

    );
  }
}
