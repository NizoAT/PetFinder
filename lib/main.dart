import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdoptionScreen(),
    );
  }
}

class AdoptionScreen extends StatelessWidget {
   AdoptionScreen({super.key});

  final List<String>  catList = ["Opale","Minuit", "Sirocco", "Nuage","Théa", "Griotte"];
  final List<String>  catImagesList = ['Chat-1.jpeg','Chat-2.jpeg','Chat-3.jpeg','Chat-4.jpeg','Chat-5.jpeg','Chat-6.jpeg'];
  final List<String>  dogList= ['Paco','Roxane','Ulysse', 'Câline', 'Hurley'];
   final List<String>  dogImagesList= ['chiens-2.jpeg', 'chiens-3.jpeg', 'chiens-4.jpeg', 'chiens-5.jpeg', 'chiensAndChat.jpega'];
   final List<String>  sexList = ["Male","Female", "Male","Female","Male","Female",];
   final List<String>  dogRaceList = ["Labrador Retriever","Berger Allemand", "Husky de Sibérie","Border collie","Bulldog anglais",];
   final List<String>  catRaceList = ["Maine Coon","British Shorthair", "Scottish fold","Sacré de Birmanie","Angora turc","Havana brown",];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leading: Icon(Icons.pets, color: Colors.red),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage:  AssetImage("assets/images/Chat-1.jpeg"),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAdoptionSection(context, "Adoption"),
              SizedBox(height: 16),
              _buildTopCard(context),
              SizedBox(height: 16),
              _buildAdoptionList(context, "Dog", dogList, dogImagesList,dogRaceList,sexList),
              SizedBox(height: 16),
              _buildAdoptionList(context, "Cat", catList, catImagesList,catRaceList,sexList),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildTopCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image(
              image:  AssetImage("assets/images/chiensAndChat.jpega"),
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatColumn("Likes", "120",120),
                  _buildStatColumn("Followers", "340",340),
                  _buildStatColumn("Posts", "45",45),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String label, String count,int counts) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Icon(
              counts ==45 ? Icons.send
                  : counts ==120 ? Icons.thumb_up
                  : Icons.account_circle,
              color: counts ==45 ? Colors.green
                  : counts ==120 ? Colors.blue
                  : Colors.red,
            ),
            SizedBox(width: 8),
            Text(
              count,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: counts ==45 ? Colors.green
                    : counts ==120 ? Colors.blue
                    : Colors.red,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: counts ==45 ? Colors.green
                : counts ==120 ? Colors.blue
                : Colors.red,
          ),
        ),
      ],
    );
  }

  Widget _buildAdoptionSection(BuildContext context, String title) {
    return Container(
      transform: Matrix4.translationValues(-32.0,0.0,0.0),
      padding: const EdgeInsets.symmetric(horizontal: 32.0,vertical: 8.0),
      decoration: BoxDecoration(
        color:  Colors.red,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(4.0),
          topRight: Radius.circular(4.0),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    );
  }

  Widget _buildAdoptionList(BuildContext context, String category, List<String> names,List<String> images ,List<String> races, List<String> sexe) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          transform: Matrix4.translationValues(-32.0,0.0,0.0),
          padding: const EdgeInsets.symmetric(horizontal: 32.0,vertical: 8.0),
          decoration: BoxDecoration(
            color:  Colors.blue,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          child:Text(
            category,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 16),
        Container(
          height: 218,
          child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            scrollDirection: Axis.horizontal,
            itemCount: names.length,
            itemBuilder: (context, index) {
              return _buildAnimalCard(context, names[index],images[index],races[index],sexe[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAnimalCard(BuildContext context, String name, String images, String races, String sexe) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.only(right: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          color: Colors.white,//color: Color(0xFFFED3D8),
          boxShadow: [
            BoxShadow(
              color: Colors.blue,
              offset: Offset(2.0, 2.0),
              blurRadius: 0.80,
              spreadRadius: 0.8,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              child: Image(
                image:  AssetImage("assets/images/"+images),
                height: 128,
                width: 130,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 16),
                        Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0),
                            border: Border.all(
                              color: sexe=="Male"? Colors.blue : Colors.red ,
                            ),
                            color: sexe=="Male"? Colors.blue : Colors.red ,
                          ),
                          child:Text(
                            sexe,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white ,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          races,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

