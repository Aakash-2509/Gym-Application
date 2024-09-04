import 'package:flutter/material.dart';

class WorkoutProgramScreen extends StatelessWidget {
  final Map<String, List<dynamic>> programs;

  const WorkoutProgramScreen({super.key, required this.programs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Program'),
      ),
      body: ListView.builder(
        itemCount: programs.length,
        itemBuilder: (context, index) {
          final program = programs.values.elementAt(index);
          final String days = programs.keys.elementAt(index);

          return ExpansionTile(
            title: Text('Workout Program for $days'),
            children: program.map<Widget>((workoutDay) {
              final String workoutType = workoutDay['workout_type'];
              final List<dynamic> exercises = workoutDay['exercices'];

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        workoutType,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: exercises.length,
                      itemBuilder: (context, idx) {
                        final Map<String, dynamic> exercise = exercises[idx];
                        return ListTile(
                          title: Text(exercise['name']),
                          subtitle: Text(
                              '${exercise['sets']} sets, ${exercise['reps']} reps'),
                        );
                      },
                    ),
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
