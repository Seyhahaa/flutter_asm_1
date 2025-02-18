import 'package:flutter/material.dart';
import 'package:flutter_pro_1/detail_screen.dart';
import 'package:flutter_pro_1/post_model.dart';
import 'package:flutter_pro_1/reels_data.dart';
import 'package:flutter_pro_1/reels_detail.dart';
import 'package:video_player/video_player.dart';

enum changeWidget {
  grid,
  reels,
  tagged,
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.videoUrl});
  final String videoUrl;
  
  

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('official.issue_xo', style: TextStyle(fontSize: 28)),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add_box_outlined, size: 28),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.menu, size: 33),
            onPressed: () {},
          ),
        ],
      ),
      body: _buildBody(),
    );
  }
changeWidget selectedWidget = changeWidget.grid;
bool isSelected = true;
  Widget _buildBody() {
    return Container(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.orange],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                shape: BoxShape.circle,
              ),
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/30238700/pexels-photo-30238700/free-photo-of-woman-enjoying-a-latte-in-a-cozy-cafe.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                ),
              ),
            ),
            Column(
              children: [
                Text('15', style: TextStyle(fontSize: 18)),
                Text('Posts', style: TextStyle(fontSize: 18)),
              ],
            ),
            Column(
              children: [
                Text('123', style: TextStyle(fontSize: 18)),
                Text('Followers', style: TextStyle(fontSize: 18)),
              ],
            ),
            Column(
              children: [
                Text('176', style: TextStyle(fontSize: 18)),
                Text('Following', style: TextStyle(fontSize: 18)),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        Container(
          
            padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Official Issue_xo', style: TextStyle(fontSize: 18)),
            Text('Fashion Designer', style: TextStyle(fontSize: 18)),
            Text('www.officialissue_xo.com', style: TextStyle(fontSize: 18)),
          ],
          ),
          
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 180,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text('Edit Profile', style: TextStyle(fontSize: 16)),
                ),
              ),
              Container(
                width: 180,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text('Share profile', style: TextStyle(fontSize: 16)),
                ),
              ),
              Container(
                width: 50,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Icon(Icons.person_add_outlined, size: 24),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              
              IconButton(onPressed: (){
                setState(() {
                  selectedWidget = changeWidget.grid;
                });
              }, 
                icon: Icon(Icons.grid_on, size: 30),
              
                
              ),
              IconButton(onPressed: (){
                setState(() {
                  selectedWidget = changeWidget.reels;
                });
              },
                icon: Icon(Icons.view_sidebar_outlined, size: 30)
              ),
              IconButton(onPressed: (){
                setState(() {
                  selectedWidget = changeWidget.tagged;
                });
              },
                icon:Icon(Icons.person_pin_outlined, size: 30)
              ),
            ],
          ),
        ),
        Container(
          child: _buildChangeBodyProfile()
        ),
      
      ]
      ),
    );
  }

  Widget _buildChangeBodyProfile(){
    switch (selectedWidget) {
      case changeWidget.grid:
        return _buildGridItem();
      case changeWidget.reels:
        return _buildReelsItem();
      case changeWidget.tagged:
        return _buildTaggedItem();
    }
  }
  Widget _buildReelsItem(){
    return GridView.builder(
      shrinkWrap: true,
      itemCount: reels.length,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemBuilder: (context, index) {
        return _buildReelsItems(reels[index]);
      },
    );
  }

  
  Widget _buildReelsItems(String url){
    return _navigateToDetailReel(AutofillHints.url);
    
  }
  Widget _navigateToDetailReel(String url,{Widget? child}){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ReelsDetailScreen()));
      },
      child: child,
    );
  }
  Widget _buildTaggedItem(){
    return Center(
      child: Column(
        children: [
          Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Icon(Icons.person_pin_outlined,size: 100, weight: 16,),
          ),
          
        ),
        SizedBox(height: 20),
        Container( 
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text('Photos and Videos of you', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              Text('When you are tagged in photos, they will appear here.', style: TextStyle(fontSize: 20), textAlign: TextAlign.center,),
            ],
          )
        )
        ],
      ),
    );
  }

  Widget _buildGridItem(){
    return GridView.builder(
      shrinkWrap: true,
      itemCount: imageList.length,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemBuilder: (context, index) {
        return _buildPostItem(imageList[index]);
      },
    );
  }

  Widget _buildPostItem(PostModel post) {
    return _navigateToDetailScreen(
      post,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(post.postImage),
            fit: BoxFit.cover,
          ),
        ),
        
      ),
    );
  }
  Widget _navigateToDetailScreen(PostModel url,{Widget? child}){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(url)));
      },
      child: child,
    );
  }
}


class ReelItem extends StatefulWidget {
  final  imageUrl;
  final  videoUrl;

  ReelItem({
    required this.imageUrl,
    required this.videoUrl,
  });

  @override
  _ReelItemState createState() => _ReelItemState();
}

class _ReelItemState extends State<ReelItem> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.networkUrl(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _videoController.value.isInitialized
            ? AspectRatio(
                aspectRatio: _videoController.value.aspectRatio,
                child: VideoPlayer(_videoController),
              )
            : Image.network(widget.imageUrl),
        // Add interactive elements like buttons, profile info, etc.
      ],
    );
  }
}