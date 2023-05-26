import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_record/Controller/Hospital_controller.dart';
import 'package:service_record/Model/Hospital_Model.dart';
import 'package:service_record/Service/hospital_service.dart';

class List_Hospital extends StatefulWidget {
  @override
  State<List_Hospital> createState() => _List_HospitalState();
}

class _List_HospitalState extends State<List_Hospital> {
  bool isLoading = false;
  List<Hospital> hospital = List.empty();
  HospitalController controller = HospitalController(HospitalService());
  void initState() {
    super.initState();
    controller.onSync.listen((bool syncState) => setState(() {
          isLoading = syncState;
        }));
    _getHospitalInfo();
  }

  void _getHospitalInfo() async {
    var newhospital = await controller.fetchhospitalInfo();
    setState(() => hospital = newhospital);
  }

  void add_hospital(
    String acronym,
    name,
  ) async {
    controller.add_hospital(
      acronym,
      name,
    );
  }

  Widget get body => isLoading
      ? CircularProgressIndicator()
      : Scrollbar(
          thumbVisibility: true,
        thickness: 8,
        child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) => const Divider(
                  color: Color.fromARGB(255, 125, 125, 125),
                  thickness: 2,
                ),
            itemCount: !hospital.isEmpty ? hospital.length : 1,
            itemBuilder: (context, index) {
              if (!hospital.isEmpty) {
                return InkWell(
                  onTap: () {
                    context.read<HospitalModel>().hospitalName =
                        '${hospital[index].name}';
                    // context.read<DrawModel>().drawId= '${hospital[index].drawId}';
                    Navigator.pop(context, '${hospital[index].name}');
                    print('${hospital[index].name}');
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    height: 50,
                    child: Center(child: Text('${hospital[index].name}')),
                  ),
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text('Not Found Hospital',
                      style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                );
              }
            }),
      );

  Future<void> _adddevicemodel(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    String _name = '';
    String _acronym = '';
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Form(
          key: _formkey,
          child: AlertDialog(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Add device name'),
            ),
            content: SizedBox(
              height: 250,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Hospital name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Hospital name';
                      }
                      return null;
                    },
                    onSaved: ((newValue) {
                      _name = newValue!;
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Please fill Acronym'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Acronym',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter Acronym';
                      }
                      return null;
                    },
                    onSaved: ((newValue) {
                      _acronym = newValue!;
                    }),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(),
                child: const Text(
                  'Cancel',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                style: TextButton.styleFrom(),
                child: const Text(
                  'Add',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
                    add_hospital(
                     _acronym,
                     _name
                    );
                  _getHospitalInfo();
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
                child: IconButton(
              onPressed: () {
                _adddevicemodel(context);
              },
              icon: Icon(Icons.add),
              iconSize: 30,
            )),
          ],
          title: Text('Choose Hospital'),
        ),
        body: Center(child: body));
  }
}

class HospitalModel extends ChangeNotifier {
  String _hospitalName = '';
  String get hospitalName => this._hospitalName;

  set hospitalName(String value) {
    this._hospitalName = value;
    notifyListeners();
  }
}
