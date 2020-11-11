import 'package:flutter/material.dart';
import 'quote.dart';
import 'package:quotes/quotes.dart';
import 'package:google_fonts/google_fonts.dart';

class QuotesGen extends StatefulWidget {
  @override
  _QuotesGenState createState() => _QuotesGenState();
}

class _QuotesGenState extends State<QuotesGen> {
  List quotes = [];
  void getQuotes(){
    for (var i = 0; i < 10; i++) {
      String quote = Quotes.getRandom().getContent();
      String author = Quotes.getRandom().getAuthor();
      Quote q = Quote(author: author,quote: quote);
      quotes.add(q);
    }
  }
  
  void updateQuotes(){
    setState(() {
       getQuotes();
      print(quotes);
    });   
  }

  @override
  void initState() {
    updateQuotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quotes Generator",
          style:GoogleFonts.lato() ,
          ),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: Container(
        color: Colors.black87,
        child: ListView.builder(        
          itemCount: quotes.length+1,
          itemBuilder: (context,item){
            // if(item>=quotes.length){
            //   print('Loading more');
            //   updateQuotes();            
            // }
            return (item==quotes.length)? 
              FlatButton.icon(
                onPressed: (){updateQuotes();}, 
                color: Colors.greenAccent[700],
                icon: Icon(Icons.repeat), 
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),          
                label: Text('Load More')
              )  
              : 
              Card(
                margin: EdgeInsets.fromLTRB(16, 16, 16, 0),                
                elevation: 1, 
                color: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),          
                child:
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2,vertical: 5),
                    child: Column(
                    children: <Widget>[
                      ListTile(
                        title:Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                          child: Text(quotes[item].quote,style: GoogleFonts.lato(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold)),
                        ),
                        subtitle:Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("- ${quotes[item].author}",style: GoogleFonts.lato(color:Colors.grey[200]),),
                          ],
                        ),
                        )                                              
                    ],
                  ),
                ),
              );
          },
        ),
      ),
    );
  }
}


      