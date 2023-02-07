import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreen();
  }

class _HomeScreen  extends State<HomeView>{
  final GlobalKey formKey = GlobalKey<FormState>();

  TextEditingController nomTEC = TextEditingController();
  TextEditingController domaineTEC = TextEditingController();
  TextEditingController desctiptionTEC = TextEditingController();

  validationForm() async {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nom'] = nomTEC.text;
    data['domaine'] = domaineTEC.text;
    data['description'] = desctiptionTEC.text;

    Uri url = Uri.parse("http://localhost/API/polling/newPolling.php");
    var reponse = await http.post(url, body: data);
    print(reponse.statusCode);
    print(reponse.body);
  }

  @override
  Widget build(BuildContext context) {
    return  Form( key: formKey,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                  alignLabelWithHint: false,
                  label: Text('nom de l\'éléction'),
                  hintText: "saisissez le nom de l'éléction",
                  icon: Icon(Icons.info_rounded, color: Colors.blue, size: 32,)),
              keyboardType: TextInputType.text,
              controller: nomTEC,
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,

            ),
            TextField(
              textAlign: TextAlign.center,
              controller: domaineTEC,
              decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  label: Text('domaine de l\'éléction'),
                  icon: Icon(Icons.dashboard, color: Colors.blue, size: 32,),
                  hintText: "saisissez le domaine de l'éléction" ),
              keyboardType: TextInputType.text,

            ),
            TextField(
              textAlign: TextAlign.center,
              controller: desctiptionTEC,
              decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  label: Text('description de l\'éléction'),
                  icon: Icon(Icons.description, color: Colors.blue, size: 32,),
                  hintText: "saisissez le decription de l'éléction" ),
              keyboardType: TextInputType.text,

            ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(50, 15, 50, 15),
                elevation: 5,
              ),
              onPressed: validationForm,
              child: const Text("créer l'éléction"),
            )
          ],
        ),
      ),
    );
  }
}

