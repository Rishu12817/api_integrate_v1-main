import 'package:api_integrate_v1/Services/remote_services.dart';
import 'package:flutter/material.dart';
import '../models/post.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Post>? posts;
  var isloading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // fetch data from api
    getdata();
  }

  getdata() async {
    posts = await RemoteServices().getPosts();
    if (posts != null) {
      setState(() {
        isloading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Visibility(
        // in future will add shimmer effect here
        visible: isloading,
        replacement: const Center(child: CircularProgressIndicator()),
        child: ListView.builder(
          // controller: ,
            itemCount: posts?.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 50, width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[400],
                        ),
                        ),
                    ),
                    // 
                      SizedBox(width: 16,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              posts![index].title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              posts![index].body ?? '',
                              maxLines: 3 ,
                              overflow: TextOverflow.ellipsis 
                            ),
                          ],
                        ),
                      ),
                    
                  ],
                ),
              );
            }
        ),
      ),
    );
  }
}
