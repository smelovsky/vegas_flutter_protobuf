import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vegas_flutter_protobuf/person.dart';

import 'model/model.pb.dart';

class PersonPage extends StatefulWidget {
  PersonPage({super.key});

  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {

  String _name_before = "Tom";
  String _name_after = "";

  List<String> _hobbies_before = ["Kotlin", "Dart"];
  List<String> _hobbies_after = [];

  int _age_before = 25;
  int _age_after = 0;

  Gender _gender_before = Gender.male;
  Gender _gender_after = Gender.male;

  int _gender = 0;

  String _byteArr = "";

  void convert() {

    Person obj = Person(
      name: _name_before,
      age: _age_before,
      hobbies: _hobbies_before,
      gender: _gender_before,
    );

    // Convert UI class to protoModel
    final protoModel = obj.toProto();

    // Generating Byte Array from protoModel
    var byteArr = protoModel.writeToBuffer();

    // Generating protoModel from Byte Array
    var newProtoModel = GPerson.fromBuffer(byteArr);

    // Converting protoModel to UI class
    var newObj = newProtoModel.toPerson();

    _byteArr = byteArr.toString();

    _name_after = newObj.name;
    _age_after = newObj.age;
    _hobbies_after = newObj.hobbies;
    _gender_after = newObj.gender;

  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('Protobuf demo'),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              TextButton(
                child: const Text('Convert'),
                onPressed: (  )  {

                  setState(() {
                    convert();
                  });

                },
              ),

            ],
          ),
        ),
        body: Column(
            children: <Widget>[

              const Text('Before'),

              Row(
                children: [

                  Text(
                    "Name: ",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: TextFormField(
                    initialValue: _name_before,
                    onChanged: (value) {
                      setState(() {
                        _name_before = value;
                      });
                    },
                  )
                  ),

                ],
              ),

              Row(
                children: [

                  Text(
                    "Age: ",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: TextFormField(
                    initialValue: _age_before.toString(),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        _age_before = int.parse(value.toString());
                      });
                    },
                  )
                  ),

                ],
              ),

              Row(
                children: [
                  Text('Hobbies: '),
                  Text(_hobbies_before.toString()),
                ],
              ),

              Row(
                  children: <Widget>[
                    Expanded( child:
                    RadioListTile(
                      title: const Text('Male'),
                      value: 0,
                      groupValue: _gender,
                      onChanged: (int? value) {
                        setState(() {
                          _gender = value!;
                        });
                        _gender_before = (_gender == 0) ? Gender.male : Gender.female;
                      },
                    ),
                    ),

                    Expanded( child:
                    RadioListTile(
                      title: const Text('Female'),
                      value: 1,
                      groupValue: _gender,
                      onChanged: (int? value) {
                        setState(() {
                          _gender = value!;
                        });
                        _gender_before = (_gender == 0) ? Gender.male : Gender.female;
                      },
                    ),
                    ),
                    ]
              ),


              const Divider(),
              Text('Byte array'),
              Flexible (
                child: Text(_byteArr),
              ),
              const Divider(),

              const Text('After'),

              Row(
                children: [
                  Text('Name: '),
                  Text(_name_after),
                ],
              ),
              Row(
                children: [
                  Text('Age: '),
                  Text(_age_after.toString()),
                ],
              ),
              Row(
                children: [
                  Text('Hobbies: '),
                  Text(_hobbies_after.toString()),
                ],
              ),

              Row(
                children: [
                  Text('Gender: '),
                  Text((_gender_after == Gender.male) ? "male" : "female"),
                ],
              ),

          ]
        ));


  }

}
