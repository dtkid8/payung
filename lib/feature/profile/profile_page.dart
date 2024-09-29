import 'package:flutter/material.dart';
import 'package:payung/core/widget/input_container.dart';
import 'package:payung/core/widget/input_dropdown.dart';
import 'package:payung/core/widget/input_field_section.dart';
import 'package:payung/core/widget/payung_text_form_field.dart';
import 'package:payung/feature/profile/profile_horizontal_stepper.dart';
import 'package:payung/feature/profile/profile_input.dart';

import '../../core/widget/payung_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfileView();
  }
}

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final _formBiographyKey = GlobalKey<FormState>();
  int _currentStep = 1;
  final TextEditingController _genderController = TextEditingController();
  final List<ProfileInput> _biodataInput = [
    ProfileInput(
      key: "name",
      label: "NAMA LENGKAP",
      controller: TextEditingController(),
    ),
    ProfileInput(
      key: "email",
      label: "ALAMAT EMAIL",
      controller: TextEditingController(),
    ),
    ProfileInput(
      key: "phone",
      label: "NO. HP",
      controller: TextEditingController(),
    ),
  ];

  DateTime? _selectedDate;
  String? _selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Informasi Pribadi",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.black,
              ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: ProfileHorizontalStepper(
                step: _currentStep,
                onTap: (value) {
                  setState(
                    () {
                      _currentStep = value;
                      _selectedDate = null;
                      _selectedGender = null;
                    },
                  );
                },
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: _buildContent(_currentStep),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildContent(int index) {
    Widget content = const SizedBox.shrink();
    switch (index) {
      case 1:
        content = _buildBiography();
      case 2:
        content = _buildAddress();
      case 3:
        content = _buildCompany();
    }
    return content;
  }

  Widget _buildBiography() {
    return Form(
      key: _formBiographyKey,
      child: Column(
        children: [
          InputFieldSection(
            text: _biodataInput[0].label,
            child: PayungTextFormField(
              controller: _biodataInput[0].controller,
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return "Masukkan ${_biodataInput[0].label}";
                }
                return null;
              },
            ),
          ),
          InputFieldSection(
            text: "TANGGAL LAHIR",
            child: InputContainer(
              value: _selectedDate != null && _selectedDate?.year != 0
                  ? _selectedDate?.toLocal().toString()
                  : "",
              errorText: _selectedDate != null && _selectedDate?.year == 0
                  ? "Masukkan TANGGAL LAHIR"
                  : null,
              icon: Icons.calendar_month,
              onTap: () {
                _selectDate(context);
              },
            ),
          ),
          InputFieldSection(
            text: "JENIS KELAMIN",
            child: InputDropdown(
              controller: _genderController,
              errorText: _selectedGender != null && _selectedGender!.isEmpty
                  ? "Masukkan JENIS KELAMIN"
                  : null,
              items: const [
                "Laki-Laki",
                "Perempuan",
              ],
            ),
          ),
          InputFieldSection(
            text: _biodataInput[1].label,
            child: PayungTextFormField(
              controller: _biodataInput[1].controller,
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return "Masukkan ${_biodataInput[1].label}";
                }
                return null;
              },
            ),
          ),
          InputFieldSection(
            text: _biodataInput[2].label,
            child: PayungTextFormField(
              controller: _biodataInput[2].controller,
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return "Masukkan ${_biodataInput[2].label}";
                }
                return null;
              },
            ),
          ),
          const InputFieldSection(
            text: "PENDIDIKAN",
            isRequired: false,
            child: InputDropdown(
              items: [
                "SD",
                "SMP",
                "SMA",
              ],
            ),
          ),
          const InputFieldSection(
            text: "STATUS PERNIKAHAN",
            isRequired: false,
            child: InputDropdown(
              items: [
                "Belum Kawin",
                "Kawin",
                "Janda",
                "Duda",
              ],
            ),
          ),
          PayungButton(
            text: 'Selanjutnya',
            onTap: () {
              setState(() {
                _selectedGender ??= "";
                _selectedDate ??= DateTime(0);
              });
              if (_formBiographyKey.currentState!.validate() &&
                  _selectedDate != null &&
                  _selectedDate?.year != 00 &&
                  _selectedGender != null &&
                  _selectedGender != "") {}
            },
          )
        ],
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(0),
      lastDate: DateTime(2101),
    );

    if (picked != null) {}
  }

  Widget _buildAddress() {
    return Column(
      children: [
        InputFieldSection(
          text: _biodataInput[0].label,
          child: PayungTextFormField(
            controller: _biodataInput[0].controller,
          ),
        ),
      ],
    );
  }

  Widget _buildCompany() {
    return Column(
      children: [
        InputFieldSection(
          text: _biodataInput[0].label,
          child: PayungTextFormField(
            controller: _biodataInput[0].controller,
          ),
        ),
        InputFieldSection(
          text: _biodataInput[1].label,
          child: PayungTextFormField(
            controller: _biodataInput[1].controller,
          ),
        ),
      ],
    );
  }
}
