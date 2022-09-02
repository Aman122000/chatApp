import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());    

}  
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return new MaterialApp(
        title: " myApp",
        home: new HomePage(),
      );
    
  }
}
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Frenzy App'),
        backgroundColor: Colors.black,
      ),
      body: new ChatScreen(),
    );
  }
}
class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
     final TextEditingController _textEditingController = new TextEditingController();
     final List<chatmessage> _messages = <chatmessage>[];
     void _handSubmitted(String text){
        _textEditingController.clear();
        chatmessage message = new chatmessage(text: text,);
        setState(() {
          _messages.insert(0, message);
        });
        
        


     }
     
 
   Widget _TextComposerWidget(){
    return IconTheme(
         data: IconThemeData(
           color: Colors.blue,
         ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
       
         child: new Row(
           children: [
            new Flexible(
              child: new TextField(
           decoration: new InputDecoration.collapsed(hintText: "send a message"),
         controller: _textEditingController,
         onSubmitted: _handSubmitted,
        ),
        
            ),
            new Container(
               margin: EdgeInsets.symmetric(horizontal: 4.0),
               child:  new IconButton (
                 icon: new Icon(
                  Icons.send,
                 ),
                 onPressed: () => {_handSubmitted(_textEditingController.text)},
               ),
       
            )
           ],
    
         ),
    
      ),
    );
   }

  @override
  Widget build(BuildContext context) {
    return  new Column(
        children: [
          new Flexible(
            child: ListView.builder(
                //  new Padding( 
                //   padding: const EdgeInsets.all(8.0),
                //   ) ,
                 reverse: true,
                 itemBuilder: (_,int index ) => _messages[index],
                 itemCount: _messages.length,
                  )
             ),
             new Divider(height: 1.0,),
             new Container(
              decoration: new BoxDecoration(
                color: Theme.of(context).cardColor,
              ),
              child: _TextComposerWidget(),
             )
             
        ],
      );
    
  }
}
const String _name = "pawan kumar";
class chatmessage extends StatelessWidget {
    final String text  ;
  
     chatmessage({this.text = }){}
      
    
      
   

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: new CircleAvatar(
              child: new Text(_name[0]),
            ),
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Text(_name, 
               style :new TextStyle(
              color: Colors.cyan,
              )
              ),
              new Container(
                margin: const EdgeInsets.only(top:5.0),
                child: new Text(text),
              )
            ],

          )
        ],
      ),
    );
    
  }
}





