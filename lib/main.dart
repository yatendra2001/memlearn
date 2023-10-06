import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'src/app.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
      url: dotenv.env['supabaseUrl']!, anonKey: dotenv.env['supabaseKey']!);

  runApp(const Memcode());
}
