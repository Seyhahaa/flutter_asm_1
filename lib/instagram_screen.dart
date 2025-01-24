// instagram_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_pro_1/language_data.dart';
import 'package:flutter_pro_1/language_logic.dart';
import 'package:provider/provider.dart';

class InstagramPage extends StatefulWidget {
  const InstagramPage({super.key});

  @override
  State<InstagramPage> createState() => _InstagramPageState();
}

class _InstagramPageState extends State<InstagramPage> {

  Language _lang = Language();
  bool language = true;
  @override
  Widget build(BuildContext context) {
    _lang = context.watch<LanguageLogic>().language;
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
  AppBar _buildAppBar(){
    return AppBar(
        title: Row(
          children: [
            Text(_lang.appName, style: TextStyle(fontFamily: 'Instagram',fontSize: 28,)),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
        actions: [
          IconButton(
            icon: Stack( 
              children: [
                const Icon(Icons.favorite_border, size: 28),
                Positioned(right: 1,top: 4,
                  child: Container(height: 6,width: 6,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
          IconButton(
            icon:const Icon(Icons.language, size: 28),
            onPressed: () {
              if(language) { 
              context.read<LanguageLogic>().changeToKh();
              language = false;
              }
              else {
                context.read<LanguageLogic>().changeLanguage();
              }
            },
          ),
        ],
      );
  }


 Widget _buildBody(){
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          // Stories
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                buildStoryItem('ninaslstrh', 'https://images.pexels.com/photos/19546262/pexels-photo-19546262/free-photo-of-smiling-young-woman-using-laptop-sitting-on-sofa.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                buildStoryItem('ch_._sreynudt', 'https://images.pexels.com/photos/9040296/pexels-photo-9040296.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                buildStoryItem('hornsokunthea', 'https://images.pexels.com/photos/4467687/pexels-photo-4467687.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                buildStoryItem('yogiwidiawati', 'https://images.pexels.com/photos/26692093/pexels-photo-26692093/free-photo-of-woman-in-white-suit-jacket-sitting-in-office.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),


              ],
            ),
          ),
          // Post
          _buildPost(),
        ],
      ),
    );
  }


  Widget buildStoryItem(String username, String imagePath) {
    return Container(
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.orange],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              shape: BoxShape.circle,
            ),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(imagePath),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            username,
            overflow: TextOverflow.ellipsis,
            style:const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildPost() {
    return Column(
      children: [
        _buildPostItem(),
        _buildPostItem(),
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
            backgroundImage: NetworkImage('https://images.pexels.com/photos/11381964/pexels-photo-11381964.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
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
          decoration:const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://images.pexels.com/photos/30286786/pexels-photo-30286786/free-photo-of-colorful-kite-in-bali-s-clear-summer-sky.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
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