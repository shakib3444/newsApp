import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_api/controller/news_controller.dart';
import 'package:first_api/view/braking_news/single_braking_news/single_braking_news.dart';
import 'package:flutter/material.dart';

class BrakingNews extends StatefulWidget {
  const BrakingNews({super.key});

  @override
  State<BrakingNews> createState() => _BrakingNewsState();
}

class _BrakingNewsState extends State<BrakingNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: NewsController.headLineController(),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child:CircularProgressIndicator(),);
          }
          return ListView.builder(
            itemCount: snapshot.data!.articles!.length,
              itemBuilder: (context,index){
              final data = snapshot.data!.articles![index];
            return InkWell(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SingleBrakingNews(data: data))),
              child: Container(
                margin:const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
                  boxShadow: const[
                    BoxShadow(
                      blurRadius:.9,
                      spreadRadius: 2,
                    ),
                  ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius:const BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                        child: CachedNetworkImage(
                          imageUrl: data.urlToImage.toString(),height: 150,width:double.infinity,fit: BoxFit.cover,
                          placeholder: (context,url)=>const CircularProgressIndicator(),
                          errorWidget: (context,url,error)=>const Icon(Icons.error_outline,color: Colors.red,),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                   Padding(
                     padding: const EdgeInsets.only(left:10.0),
                     child: Text(data.source!.name.toString(),
                       style:const TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Colors.black),
                     ),
                   ),

                   const SizedBox(height: 10,),


                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(data.title.toString(),
                        style:const TextStyle(fontWeight: FontWeight.w500,fontSize:15,color: Colors.black),
                      ),
                    ),
                   const SizedBox(height: 10,),

                  ],
                ),

              ),
            );
          });
        },
      ),
    );
  }
}
