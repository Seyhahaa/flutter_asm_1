import 'package:flutter/material.dart';
import 'package:flutter_pro_1/language_data.dart';
import 'package:flutter_pro_1/language_logic.dart';
import 'package:flutter_pro_1/post_model.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  //const DetailScreen({super.key});

  PostModel post;
  DetailScreen(this.post, {super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Language _lang = Language();
  @override
  Widget build(BuildContext context) {
    _lang = context.watch<LanguageLogic>().language;
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Column(children: [
          Positioned(
            child: Container(
              padding: const EdgeInsets.only(right: 50),
              child: Column(children: const [
                Text('SEYHAA', style: TextStyle(fontSize: 16)),
                Text('Posts',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ]),
            ),
          )
        ]),
      )),
      body: _buildPost(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
          items: const[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled, size: 35),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, size: 35),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_box_outlined, size: 35),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.video_library_sharp, size: 35),
          label: 'Reels',
        ),
        BottomNavigationBarItem(
          
          icon: Icon(Icons.account_circle_outlined, size: 35),
          label: 'Profile',
        ),
      ],
      
        ),
    
    );
  }

  Widget _buildPost() {
    return Column(
      children: [
        _buildPostItem(),

      ],
    );
  }

  Widget _buildPostItem(){
    return Column( 
       crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage('https://images.pexels.com/photos/30238700/pexels-photo-30238700/free-photo-of-woman-enjoying-a-latte-in-a-cozy-cafe.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
          ),
          title: Row(
            children: [
              Text(
                'ery_blp',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          subtitle: Text(_lang.address),
          trailing: Icon(Icons.more_vert),
        ),
        // Post image
        Container(
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.post.postImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Post actions
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.comment_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon:const Icon(Icons.send_outlined),
              onPressed: () {},
            ),
            const Spacer(),
            IconButton(
              icon: Icon(Icons.bookmark_border),
              onPressed: () {},
            ),
          ],
        ),
        // Likes
         Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '24 ${_lang.like}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        // Caption
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: RichText(
            text: TextSpan(
              style: TextStyle(),
              children: [
                TextSpan(
                  text: 'ery_blp ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'Celebrating 65th Anniversary of Cambodia and Indonesia diplomatic...',
                ),
                TextSpan(
                  text: ' ${_lang.more}',
                ),
              ],
            ),
          ),
        ),
        // Time
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '4 days ago',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
