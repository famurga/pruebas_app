import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pruebas_app/models/data_response.dart';
import 'package:pruebas_app/providers/datos_provider.dart';

class CupertinoPickerWidget extends StatefulWidget {
  CupertinoPickerWidget({Key? key}) : super(key: key);

  @override
  State<CupertinoPickerWidget> createState() => _CupertinoPickerWidgetState();
}

class _CupertinoPickerWidgetState extends State<CupertinoPickerWidget> {

   List<CryptosSdc>? cryptoss;
   bool isSelected=false;
   int indexTemp=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    final datosProvider = Provider.of<DatosProvider>(context);
    cryptoss=datosProvider.cript2;
    print('datosProvider ${cryptoss}');

    
    return Container(
     
      child: CupertinoPicker(
        itemExtent: 60,
        onSelectedItemChanged: (int value) {
          setState(() {
            indexTemp=value;
          });
          },
          children: List.generate(cryptoss!.length, (index){
            final item = cryptoss![index];
            isSelected = index==indexTemp;
            final color = isSelected ? Colors.amberAccent : Colors.black;
            return Center(
              child: Row(
                children: [
                  Text(item.alias, style: TextStyle(color: color),),
                  SizedBox(width:20),
                  isSelected ? Column(
                    children: [
                      Text('Saldo:'),
                      Text(item.descripcion),
                    ],
                  ) : Text(''),
                ],
              ),
            );
          })
        /* children: [
           
          
         
          for(var i =0 ; i< cryptoss!.length ; i++ ) 
           Center(
             child: Text('${cryptoss![i].descripcion}'),
           ),
        /*    for( var key in cryptoss!)...{
              Center(
             child: Row(children:[ 
               Text('${key.alias}',style: TextStyle(color: Colors.amber),),
               SizedBox(width: 30,),
               Column(
                 children: [
                    Text('SALDO:'),
               SizedBox(width: 10,),
               Text('${key.descripcion}'),
                 ],
               ),
              
               ],),
           ),

           } */
            
          
          //Text('${datosProvider.cript2[0].descripcion}'),
           /* FutureBuilder(
        future: datosProvider.get(),
        builder: (_ ,AsyncSnapshot<List<CryptosSdc>> snapshot){
          if(snapshot.connectionState == ConnectionState.waiting)
            return CupertinoActivityIndicator();
          else if(snapshot.hasData){
            final a= snapshot.data;
            return Text('${a![1].descripcion}');
          }
            

          return Text("No data data");

        }
        
        ), */
          
        
        ], */
        
        
        )
    );
  }
}