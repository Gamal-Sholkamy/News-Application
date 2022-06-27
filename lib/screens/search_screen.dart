import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/states.dart';
import 'package:news/screens/design_item.dart';
import '../cubit/cubit.dart';

class SearchScreen extends StatelessWidget {
  bool isSearch=true;
  @override
  Widget build(BuildContext context) {
    var searchControler = TextEditingController();
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit newsCubit = NewsCubit.get(context);
        List<dynamic> list = newsCubit.search;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              color: Colors.deepOrange,
            ),
            //title: Text("Search",style: Theme.of(context).textTheme.bodyText1,),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: searchControler,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    newsCubit.getSearch(value);
                  },
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Search must be not null";
                    } else {
                      return value;
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    label: Text(
                      "Search",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    prefixIcon:
                        Icon(color: Colors.deepOrange, Icons.search_sharp),
                  ),
                ),
              ),
              const SizedBox(height: 2.0),
              Expanded(
                child: ListView.separated(

                    itemBuilder: (context, index) => DesignItem(list[index],isSearch),
                    separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: double.infinity,
                        height: 1.0,
                        color: Colors.black38,
                      ),
                    ),
                    itemCount: list.length),
              ),
            ],
          ),
        );
      },
    );
  }
}
