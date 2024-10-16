import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/custom_input.dart';
import 'package:flutter_application_2/services/firestore_service.dart';
import 'package:intl/intl.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {

  @override
  TextEditingController messageController = TextEditingController();

  var feedbacks;

  @override
  void initState(){
    super.initState();
    feedbacks = FirestoreService().getFeedback();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedbacks'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState((){
            feedbacks = FirestoreService().getFeedback();
          });

        },
        child: FutureBuilder(future: feedbacks, builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.separated(
          separatorBuilder: (context, index) => Divider(),
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
        
            Timestamp date = snapshot.data[index]['created_at'];
            var formatDate = DateFormat('dd/MM').format(date.toDate());
        
          return ListTile(
            leading: CircleAvatar(),
            title: Text(snapshot.data[index]['user'].toString()),
            subtitle: Text(snapshot.data[index]['message'].toString()),
            trailing: Text(formatDate),
        
          );
          });
          }
        
        },
        ),
      ),
      bottomNavigationBar: Row(
        children: [

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: messageController,
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder()
                ),
              ),
            ),
          ),
          
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            height: 50,
            child: ElevatedButton(
              onPressed: () async{

                await FirestoreService().postFeedback(messageController.text);
                
              }, 
              child: Icon(Icons.send)
              ),
          ),
            Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            height: 50,
            child: ElevatedButton(
              onPressed: (){}, 
              child: Icon(Icons.mic),
              ),
          ),
        ],
      ),
    );
  }
}


/*/ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: 24,
        itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(),
          title: Text('Lucas'),
          subtitle: Text('Lorem,Lorem,Lorem,Lorem,Lorem,Lorem,Lorem,Lorem,'),
          trailing: Text('10/10'),

        );
      },),*/