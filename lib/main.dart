import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pruebas_app/providers/datos_provider.dart';
import 'package:pruebas_app/widgets/cupertino_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>DatosProvider(),lazy: false,),
      ],
      child: MaterialApp(
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Material App Bar'),
          ),
          body: CupertinoPickerWidget(),
        ),
      ),
    );
  }
}