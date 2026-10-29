import 'package:flutter/material.dart';

void main() {
  runApp(const EnrollmentApp());
}

class EnrollmentApp extends StatelessWidget {
  const EnrollmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Enrollment Requirement Validator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF174A8B),
        ),
        useMaterial3: true,
      ),
      home: const EnrollmentHomePage(),
    );
  }
}

class EnrollmentHomePage extends StatefulWidget {
  const EnrollmentHomePage({super.key});

  @override
  State<EnrollmentHomePage> createState() => _EnrollmentHomePageState();
}

class _EnrollmentHomePageState extends State<EnrollmentHomePage> {
  final studentIdController = TextEditingController();
  final studentNameController = TextEditingController();

 final List<String> requirements = [
  'Birth Certificate',
  'Report Card / Transcript',
  'Certificate of Good Moral Character',
];

late List<bool> submitted;
late List<bool> verified;
bool checked = false;

@override
void initState() {
  super.initState();
  submitted = List<bool>.filled(requirements.length, false);
  verified = List<bool>.filled(requirements.length, false);
}

  @override
  void dispose() {
    studentIdController.dispose();
    studentNameController.dispose();
    super.dispose();
  }

  void checkRequirements() {
    if (studentIdController.text.trim().isEmpty ||
        studentNameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter the Student ID and Student Name.'),
        ),
      );
      return;
    }

    setState(() {
      checked = true;
    });

    final missing = requirements
        .asMap()
        .entries
        .where((entry) => !submitted[entry.key])
        .map((entry) => entry.value)
        .toList();

    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(missing.isEmpty ? 'Requirements Complete' : 'Missing Requirements'),
        content: Text(
          missing.isEmpty
              ? 'All listed requirements have been marked as submitted. '
                  'Your documents still need staff verification.'
              : 'Please submit the following missing requirements:\n\n'
                  '${missing.map((item) => '• $item').join('\n')}',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final completedCount = submitted.where((item) => item).length;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FB),
      appBar: AppBar(
        backgroundColor: const Color(0xFF174A8B),
        foregroundColor: Colors.white,
        title: const Text('Enrollment Requirement Validator'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Student Enrollment Portal',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Review your enrollment requirements and identify missing documents.',
                  style: TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 24),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Student Information',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: studentIdController,
                          decoration: const InputDecoration(
                            labelText: 'Student ID',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.badge_outlined),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: studentNameController,
                          decoration: const InputDecoration(
                            labelText: 'Student Name',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person_outline),
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          'Enrollment Requirements',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Sample requirements only. Confirm the official list with your instructor.',
                          style: TextStyle(color: Colors.black54),
                        ),
                        const SizedBox(height: 12),
                        ...requirements.asMap().entries.map((entry) {
                          final index = entry.key;
                          final requirement = entry.value;

                          return CheckboxListTile(
                            value: submitted[index],
                            onChanged: (value) {
                              setState(() {
                                submitted[index] = value ?? false;
                                checked = false;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                            contentPadding: EdgeInsets.zero,
                            title: Text(requirement),
                            subtitle: Text(
                              submitted[index]
                                  ? 'Marked as submitted'
                                  : 'Not yet submitted',
                            ),
                          );
                        }),
                        const SizedBox(height: 12),
                        LinearProgressIndicator(
                          value: completedCount / requirements.length,
                          minHeight: 8,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '$completedCount of ${requirements.length} requirements marked as submitted',
                        ),
                        if (checked) ...[
                          const SizedBox(height: 12),
                          Text(
                            completedCount == requirements.length
                                ? 'Checklist complete — pending staff verification.'
                                : 'Incomplete — some requirements are missing.',
                            style: TextStyle(
                              color: completedCount == requirements.length
                                  ? Colors.green.shade700
                                  : Colors.red.shade700,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton.icon(
                            onPressed: checkRequirements,
                            icon: const Icon(Icons.fact_check_outlined),
                            label: const Text('Check Requirements'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
