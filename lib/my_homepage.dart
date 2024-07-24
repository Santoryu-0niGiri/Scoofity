import 'package:flutter/material.dart';
import 'package:scootify/my_list/my_list.dart';
import 'package:scootify/song_player.dart';

class MyScoofity extends StatefulWidget {
  const MyScoofity({super.key});

  @override
  State<MyScoofity> createState() => _MyScoofityState();
}

class _MyScoofityState extends State<MyScoofity> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        title: const Text("Scoofity"),
        backgroundColor: Colors.blue.shade200,
        actions: [
          Container(
            width: 58,
            child: PopupMenuButton(
              icon: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://4.bp.blogspot.com/-Jx21kNqFSTU/UXemtqPhZCI/AAAAAAAAh74/BMGSzpU6F48/s1600/funny-cat-pictures-047-001.jpg"),
                backgroundColor: Colors.red,
              ),
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem<String>(
                    value: '1',
                    child: Text('Login'),
                  ),
                ];
              },
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: Music().music.length,
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (2),
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Colors.black,
                    child: InkWell(
                      onTap: () {
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => SongPage(
                                imageAlbum: AlbumImage().albumImage[index],
                                artist: Singer().singer[index],
                                song: Music().music[index]),
                          ),
                        );
                      },
                      child: GridTile(
                        footer: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ListTile(
                              subtitle: Text(
                                "${Music().music[index]}",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(1),
                          color: Colors.black,
                          child: Image(image: AlbumImage().albumImage[index]),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: Music().music.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => SongPage(
                              imageAlbum: AlbumImage().albumImage[index],
                              artist: Singer().singer[index],
                              song: Music().music[index]),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Container(
                        child: Image(image: AlbumImage().albumImage[index]),
                      ),
                      title: Text(
                        "${Music().music[index]}",
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        "${Singer().singer[index]}",
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: InkWell(
                          onTap: () {},
                          child: PopupMenuButton(
                            child: const Icon(Icons.more_horiz),
                            itemBuilder: (BuildContext context) {
                              return [
                                PopupMenuItem<String>(
                                  value: '1',
                                  child: Text('Add to Playlist'),
                                  onTap: () {},
                                ),
                              ];
                            },
                          )),
                      iconColor: Colors.grey,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.blue.shade200,
          child: ListView(
            children: const [
              SizedBox(
                  height: 70,
                  child: DrawerHeader(
                    child: Text(
                      "Menu",
                    ),
                  )),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text("About"),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.grey,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.bolt), label: "PlayList"),
          NavigationDestination(icon: Icon(Icons.person_2), label: "Likes"),
        ],
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
    );
  }
}
