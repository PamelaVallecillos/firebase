import 'package:flutter/material.dart';
import 'package:flutter_application_1/servises/firebase_servises.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase"),
      ),
      body: FutureBuilder(
        future: listar(),
        builder: (context,snapshot){
          return (snapshot.hasData)
            ? ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context,index){
                return ListTile(
                  title: Text(snapshot.data?[index]['name']),
                  leading: const Icon(Icons.people_alt),
                  trailing: PopupMenuButton(
                    icon: const Icon(Icons.more_vert),
                    itemBuilder: (context){
                      return [
                        const PopupMenuItem(
                          value: 'edit',
                          child: Text('Editar')
                          ),
                        const PopupMenuItem(
                          value: 'delete',
                          child: Text('Eliminar')
                          )
                      ];
                    },
                  ),
                );
              })
          : const Center(child: CircularProgressIndicator()); 
        }),
    floatingActionButton: FloatingActionButton(
      onPressed: () async {
        await Navigator.pushNamed(context, '/add');
        setState(() {});
      },
      child: const Icon(Icons.add),
    ),
    );
  }
}
















