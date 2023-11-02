import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class FumigationModel {
  String location;
  String type;
  DateTime date;
  bool isCompleted;

  FumigationModel({
    required this.location,
    required this.type,
    required this.date,
    required this.isCompleted,
  });

  FumigationModel.copy(FumigationModel from)
      : this(
          location: from.location,
          type: from.type,
          date: from.date,
          isCompleted: from.isCompleted,
        );
}

class FumigationController {
  // Add your implementation here
  Future<List<FumigationModel>> getFumigations() async {
    // Your implementation
    return [];
  }

  Future<void> deleteFumigation(int index) async {
    // Your implementation
  }

  Future<void> editFumigation(int index, FumigationModel newFumigation) async {
    // Your implementation
  }

  Future<void> addFumigation(FumigationModel newFumigation) async {
    // Your implementation
  }
}

class NoteCard extends StatelessWidget {
  final VoidCallback onEditPressed;
  final VoidCallback onDeletePressed;
  final String location;
  final String type;
  final String date;
  final bool isCompleted;
  final Function(dynamic) onRightslide;
  final Function(dynamic) onLeftslide;

  NoteCard({
    required this.onEditPressed,
    required this.onDeletePressed,
    required this.location,
    required this.type,
    required this.date,
    required this.isCompleted,
    required this.onRightslide,
    required this.onLeftslide,
  });

  @override
  Widget build(BuildContext context) {
    // Your implementation
    return Container();
  }
}

class AddFumigation extends StatefulWidget {
  @override
  State<AddFumigation> createState() => _AddFumigationState();
}

class _AddFumigationState extends State<AddFumigation> {
  final FumigationController _fumigationController = FumigationController();

  late List<FumigationModel> _fumigations = [];
  int existingFumigationsIndex = -1;
  TextEditingController _locationController = TextEditingController();
  TextEditingController _typeController = TextEditingController();
  TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadFumigations();
  }

  Future<void> _loadFumigations() async {
    final fumigations = await _fumigationController.getFumigations();
    setState(() {
      _fumigations = fumigations;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.edit_outlined,
          color: Colors.black,
        ),
        elevation: 2,
        centerTitle: true,
        title: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "My",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: " Fumigations",
              style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 24,
                  fontWeight: FontWeight.w400))
        ])),
        backgroundColor: Colors.white,
      ),
      body: _fumigations.isEmpty
          ? Center(
              child: Text('No fumigations yet. Add one!',
                  style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.w400)),
            )
          : ListView.builder(
              itemCount: _fumigations.length,
              itemBuilder: (context, index) {
                final dateFormatter = DateFormat('dd-MM-yyyy');
                final fumigation = _fumigations[index];
                final date = dateFormatter.format(fumigation.date.toLocal());
                return NoteCard(
                  onEditPressed: () {
                    existingFumigationsIndex = index;
                    _addOrEditFumigation(context,
                        existingFumigation: fumigation);
                  },
                  onDeletePressed: () async {
                    await _fumigationController.deleteFumigation(index);
                    _loadFumigations();
                  },
                  location: fumigation.location,
                  type: fumigation.type,
                  date: date,
                  isCompleted: fumigation.isCompleted,
                  onRightslide: (p0) async {
                    await _fumigationController.deleteFumigation(index);
                    _loadFumigations();
                  },
                  onLeftslide: (p0) {
                    existingFumigationsIndex = index;
                    _addOrEditFumigation(context,
                        existingFumigation: fumigation);
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          existingFumigationsIndex = -1;
          _addOrEditFumigation(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _addOrEditFumigation(BuildContext ctx,
      {FumigationModel? existingFumigation}) async {
    final isEditing = existingFumigation != null;
    final newFumigation = isEditing
        ? FumigationModel.copy(existingFumigation)
        : FumigationModel(
            location: '',
            type: '',
            date: DateTime.now(),
            isCompleted: false,
          );

    _locationController.text = newFumigation.location;
    _typeController.text = newFumigation.type;
    final dateFormatter = DateFormat('dd-MM-yyyy');
    _dateController.text =
        isEditing ? dateFormatter.format(newFumigation.date.toLocal()) : '';

    await showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      isEditing ? 'Edit Fumigation' : 'Add a New Fumigation',
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Location'),
                    controller: _locationController,
                    onChanged: (value) {
                      newFumigation.location = value;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Type'),
                    controller: _typeController,
                    onChanged: (value) {
                      newFumigation.type = value;
                    },
                  ),
                  SizedBox(height: 16.0),
                  GestureDetector(
                    onTap: () async {
                      final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: newFumigation.date,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (selectedDate != null) {
                        setState(() {
                          newFumigation.date = selectedDate.toUtc();
                          _dateController.text = dateFormatter
                              .format(newFumigation.date.toLocal());
                        });
                      }
                    },
                    child: AbsorbPointer(
                      child: TextField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Date (dd-MM-yyyy)'),
                        controller: _dateController,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black)),
                        onPressed: () async {
                          if (_locationController.text.isNotEmpty &&
                              _typeController.text.isNotEmpty) {
                            if (isEditing) {
                              await _fumigationController.editFumigation(
                                  existingFumigationsIndex, newFumigation);
                            } else {
                              await _fumigationController
                                  .addFumigation(newFumigation);
                            }
                            _loadFumigations();
                            Navigator.of(context).pop();
                          } else {
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30),
                                            topRight: Radius.circular(30))),
                                    padding: EdgeInsets.all(20),
                                    backgroundColor: Colors.grey,
                                    content: Center(
                                        child: Text(
                                      "Please add full details",
                                      style: TextStyle(fontSize: 18),
                                    ))));
                          }
                        },
                        child: Text(isEditing ? 'Save' : 'Add'),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black)),
                        onPressed: () async {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancel'),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
