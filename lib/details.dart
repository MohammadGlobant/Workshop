import 'package:flutter/material.dart';
import 'package:workshop/Mount_item.dart';

class details extends StatelessWidget {
  final Mount_item item;
  final path =  'https://sa.kapamilya.com/absnews/abscbnnews/media/2021/afp/01/17/20210116-mt-semeru-indonesia-ash-afp-s.jpg';
  const details({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(item.path),
                      fit: BoxFit.cover
                  ),
                  borderRadius: const BorderRadius.only(bottomLeft:Radius.circular(20),bottomRight: Radius.circular(20)),
                ),

                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () => Navigator.of(context).pop(),
                              icon: const Icon(Icons.arrow_back,color: Colors.white)
                          ),
                          const Icon(Icons.terrain,color: Colors.white,size: 50,),
                          const CircleAvatar(
                            child: Icon(Icons.list),
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.grey,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      alignment: AlignmentDirectional.bottomStart,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(item.name,style: const TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                          ),
                            textAlign: TextAlign.left,
                          ),
                          Text(item.location,style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white
                          ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      )
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:Border.all(color: Colors.grey.withOpacity(0.6))
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text("Rating",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),),
                                Text("9.2",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:Border.all(color: Colors.grey.withOpacity(0.6))
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text("Price",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),),
                                Text(" \$12 ",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:Border.all(color: Colors.grey.withOpacity(0.6))
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text("Open",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),),
                                Text("14hr",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "About ${item.name}",
                        style:const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(item.description),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 70,
              padding: const EdgeInsets.all(10),
              child:Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text("Book Now",style: TextStyle(
                          color: Colors.white
                        ),),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.bookmark,color: Colors.red,)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
