import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_api/models/all_news_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class SingleAllNews extends StatelessWidget {
  final Article data;
  const SingleAllNews({super.key, required this.data});



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: size.height * 0.5,
              width: size.width,
              child: CachedNetworkImage(
                imageUrl: data.urlToImage.toString(),
                height: size.height * 0.5,
                width: size.width,
                fit: BoxFit.contain,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.brown.shade600,
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    data.source!.name.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.white),
                  ),

                  //url launcher
                  ElevatedButton.icon(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.brown),
                      ),
                      onPressed: ()async{
                         final Uri uri = Uri.parse(data.url.toString());
                         if(!await launchUrl(uri)){
                           throw Exception("could not launch");
                         }
                      },
                      icon: const Icon(Icons.language,color: Colors.white,),
                      label:const Text("More...",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.white),))


                ],
              ),

              //name


              //date Time
              Text(
                DateFormat('yyyy-MM-dd – hh:mm a').format(data.publishedAt as DateTime),
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),

              //title
              Text(
                data.title.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),

              //author


              //description
              Text(
                data.description.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.white),
              ),
              const SizedBox(height: 10,),

              //content
              Text(
                data.content.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.white),
              ),

            ],
          ),
        ),

      ],
    ),
          ),
        );
  }
}
