import 'package:flutter/material.dart';
import 'package:workshop/AppButtonBar.dart';
import 'package:workshop/Mount_item.dart';
import 'details.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static String mohammadImage = "https://avatars.githubusercontent.com/u/32689856?s=400&u=bd58ece9ce4e672c79751ada56fe5004d2f949aa&v=4";
  @override
  Widget build(BuildContext context) {
    final List<Mount_item> mount_item = [
      Mount_item(
          path: 'https://sa.kapamilya.com/absnews/abscbnnews/media/2021/afp/01/17/20210116-mt-semeru-indonesia-ash-afp-s.jpg',
          name: 'Mount Semeru',
          description: 'Semeru, or Mount Semeru, is an active volcano in East Java, Indonesia. It is located in the subduction zone, where the Indo-Australia plate subducts under the Eurasia plate. It is the highest mountain on the island of Java.',
          location: 'East Java'),
      Mount_item(
          path: 'https://media-cdn.tripadvisor.com/media/photo-s/04/a5/6f/ce/dsc-5622jpg.jpg',
          name: 'Mount Merbaru',
          description: 'Mount Merbabu is a dormant stratovolcano in Central Java province on the Indonesian islandof Java. The name Merbabu could be loosely translated as Mountain of Ash from the Javanesecombined words; Meru means mountain and awu or abu means ash.',
          location: 'Central Java'),
      Mount_item(
          path: 'https://cdn.images.express.co.uk/img/dynamic/78/590x/mount-vesuvius-1100807.jpg',
          name: 'Mount Vesuvius',
          description: 'Mount Vesuvius is a somma-stratovolcano located on the Gulf of Naples in Campania, Italy, about 9 km east of Naples and a short distance from the shore. It is one of several volcanoes which form the Campanian volcanic arc.',
          location: 'Italy'),
      Mount_item(
          path: 'https://upload.wikimedia.org/wikipedia/commons/0/04/PopoAmeca2zoom.jpg',
          name: 'Mount Popocatépetl',
          description: 'Popocatépetl is an active stratovolcano located in the states of Puebla, Morelos, and Mexico  in central Mexico. It lies in the eastern half of the Trans-Mexican volcanic belt. At 5,426 m it is the second highest peak in Mexico, after Citlaltépetl at 5,636 m.',
          location: 'Mexico'),
      Mount_item(
          path: 'https://cdn.dlmag.com/wp-content/uploads/2019/07/maunaloa1.jpg',
          name: 'Mauna Loa',
          description: 'Mauna Loa is one of five volcanoes that form the Island of Hawaii in the U.S. state of Hawai inthe Pacific Ocean. The largest subaerial volcano in both mass and volume, Mauna Loa has historically been considered the largest volcano on Earth, dwarfed only by Tamu Massif.',
          location: 'Hawaii')
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.red[800]),
        title: const Center(child: Icon(Icons.terrain,size: 50.0,)),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.red,
          padding: const EdgeInsets.all(30),
          alignment: Alignment.bottomLeft,
          child:const Icon(
            Icons.terrain,color: Colors.white,size: 40,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: NetworkImage(mohammadImage),
                        ),
                      ),
                      const SizedBox(width: 10.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Hello, Mohammad",
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),),
                          Text("Good Morning",style: TextStyle(
                              color: Colors.red[700]
                          ),)
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Discover",style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold
                        ),),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(15.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Row(
                                  children: const [
                                    Icon(Icons.search,color: Colors.grey),
                                    Text("Search",style: TextStyle(
                                        color: Colors.grey
                                    ),),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Container(
                              padding: const EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                  color: Colors.red[800],
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              child: const Icon(Icons.tune,color: Colors.white),
                            )
                          ],
                        ),
                        const SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 250,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) => BuildListItem(mount_item[index],context),
                      itemCount: mount_item.length,
                      separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 10.0,),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:const [
                        Text("Category",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text("See More",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.grey.withOpacity(0.5))
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.park,color: Colors.red),
                              Text("Forset")
                            ],
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.grey.withOpacity(0.5))
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.beach_access,color: Colors.red),
                              Text("Beach")
                            ],
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.grey.withOpacity(0.5))
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.directions,color: Colors.red),
                              Text("Hiking")
                            ],
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.grey.withOpacity(0.5))
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.terrain,color: Colors.red),
                              Text("Terrain")
                            ],
                          ),
                        ),
                        const SizedBox(width: 10,),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppButtonBar(),
    );
  }
  Widget BuildListItem(Mount_item item,BuildContext context) => Row(
    children: [
      GestureDetector(
        onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  details(item: item)));},
        child: Container(
          height: double.infinity,
          width: 150,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),

            image: DecorationImage(
              image: NetworkImage(item.path),
              fit: BoxFit.cover
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.name,style:
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17
                )
                ,),
              Text(item.location,style:
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15
                ),
              ),
            ],
          ),
        ),
      )
    ],
  );
  
}

