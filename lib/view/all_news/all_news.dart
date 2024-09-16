import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_api/controller/news_controller.dart';
import 'package:first_api/view/all_news/single_all_news/single_all_news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllNews extends StatefulWidget {
  const AllNews({super.key});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: NewsController.allNewsController(),
        builder: (context,snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          return ListView.builder(
            itemCount: snapshot.data!.articles!.length,
              itemBuilder: (context,index){
              final data = snapshot.data!.articles![index];
            return GestureDetector(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SingleAllNews(data: data,))),
              child: Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow:const [
                    BoxShadow(
                      blurRadius: .9,
                      spreadRadius: 2,
                    ),
                  ],
                    color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //image
                    ClipRRect(
                      borderRadius:const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                      child: CachedNetworkImage(
                        imageUrl: data.urlToImage.toString(),height: 150,width:double.infinity,fit: BoxFit.cover,
                        placeholder: (context,url)=>const CircularProgressIndicator(),
                        errorWidget: (context,url,error)=>const Icon(Icons.error_outline,color: Colors.red,),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    //name
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(data.source!.name.toString(),
                        style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black),
                      ),
                    ),
              
                    const SizedBox(height: 10,
                    ),
                    //title
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(data.title.toString(),
                        style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 15,color: Colors.black),
                      ),
                    ),
                   const SizedBox(height: 10,),
              
                  ],
                ),
              ),
            );
          });
        }
      ),
    );
  }
}
