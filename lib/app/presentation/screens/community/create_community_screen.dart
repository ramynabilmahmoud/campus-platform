import 'package:flutter/material.dart';
import 'package:main_platform/app/presentation/widgets/custom_textfield.dart';

class CommunityAdd extends StatefulWidget {
  const CommunityAdd({super.key});
  @override
  State<CommunityAdd> createState() => _CommunityAdd();
}

class _CommunityAdd extends State<CommunityAdd> {
  bool isSwitchedPrivate = false;
  bool isSwitchedClosed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            forceMaterialTransparency: true,
            shape: const Border(
                bottom: BorderSide(
              color: Colors.black,
              width: 2,
            )),
            title: const Text(
              "Add Community",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )),
        body: SafeArea(
            child: Column(
          children: [
            Builder(builder: (context) {
              return Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Builder(builder: (context) {
                            return SingleChildScrollView(
                                child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(children: [
                                      const CustomTextField(
                                        label: "Community Name",
                                        hint: "ICT Community",
                                        maxChar: 64,
                                      ),
                                      const CustomTextField(
                                        label: "Description",
                                        hint:
                                            "This Community Talking About Lastest News Of NCTU",
                                        maxChar: 256,
                                        maxLines: 10,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(children: [
                                        const Text("Private",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                        const Spacer(),
                                        Switch(
                                          value: isSwitchedPrivate,
                                          onChanged: (value) {
                                            setState(() {
                                              isSwitchedPrivate = value;
                                            });
                                          },
                                        )
                                      ]),
                                      const Text(
                                          "Marking the community as private means that nobody will see the community but those who are already participated to the community."),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(children: [
                                        const Text("Closed",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                        const Spacer(),
                                        Switch(
                                          value: isSwitchedClosed,
                                          onChanged: (value) {
                                            setState(() {
                                              isSwitchedClosed = value;
                                            });
                                          },
                                        ),
                                      ]),
                                      const Text(
                                          "Marking the community as closed means that nobody can join the community or see community activities, people can still see the community and participants and request to join unless it's marked as private"),
                                      const SizedBox(height: 22),
                                      Stack(children: [
                                        Image.network(
                                            "https://galooli.com/wp-content/uploads/2022/06/glossary_1122x777_What-is-ICT.png"),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 22, left: 300),
                                          child: Container(
                                            width: 40,
                                            height: 38,
                                            decoration: BoxDecoration(
                                              color: Colors.blue[700],
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            child: IconButton(
                                              icon: const Icon(Icons.edit),
                                              color: Colors.white,
                                              onPressed: () {},
                                            ),
                                          ),
                                        ),
                                      ]),
                                      const SizedBox(height: 22),
                                    ])));
                          }),
                          Builder(builder: (context) {
                            return GestureDetector(
                              onTap: () {
                                print("Done");
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(7.0)),
                                    color: Colors.blue[600],
                                  ),
                                  height: 30,
                                  width: 400,
                                  child: const Center(
                                    child: Text(
                                      "Continue",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                            );
                          })
                        ],
                      )),
                ),
              );
            }),
          ],
        )));
  }
}
