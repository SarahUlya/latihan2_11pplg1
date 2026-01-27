import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan2_11pplg1/Controller/contact_controller.dart';
import 'package:latihan2_11pplg1/Widgets/widget_button.dart';
import 'package:latihan2_11pplg1/Widgets/widget_textfield.dart';

class ContactPage extends StatelessWidget {
  ContactPage({super.key});

  final controller = Get.find<ContactController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 217, 255),
        title: const Text("Contact List"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: customTextField(
                    textEditingController: controller.nameController,
                    labelText: "Enter Name",
                  ),
                ),
                const SizedBox(width: 10),
                CustomButton(
                  text: "Save",
                  textColor: Colors.white,
                  onPressed: () => controller.addName(),
                ),
              ],
            ),
            const SizedBox(height: 20),

            TextField(
              controller: controller.searchController,
              decoration: InputDecoration(
                hintText: "Search name...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: (value) {
                controller.searchName(value);
              },
            ),
            const SizedBox(height: 20),

            // inside your ContactPage build, replace Expanded(...) with this:
            Expanded(
              child: Obx(() {
                final contacts =
                    controller.filteredNames; // <-- use this everywhere
                if (contacts.isEmpty) {
                  return const Center(
                    child: Text(
                      "Belum ada kontak tersimpan",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    final contact = contacts[index];
                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 4,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: const Color.fromARGB(
                            255,
                            107,
                            169,
                            255,
                          ),
                          child: Text(
                            contact['name'][0].toUpperCase(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text(
                          contact['name'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.orange,
                              ),
                              onPressed: () => controller.editNameDialog(
                                context,
                                contact['id'],
                                contact['name'],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () =>
                                  controller.Delete(contact['id'], contact['name'],),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
