import 'dart:developer';
import 'dart:io';

void main() {
  // مسار المشروع الحالي
  final projectPath = "${Directory.current.path}/lib";

  String nameFile = 'create_post';

  // قائمة المجلدات التي سيتم إنشاؤها
  final directories = [
    '$projectPath/features/$nameFile/models',
    '$projectPath/features/$nameFile/presentation/view',
    '$projectPath/features/$nameFile/presentation/widgets',
    '$projectPath/features/$nameFile/presentation/manager',
  ];

  // حلقة لإنشاء كل المجلدات
  for (var dir in directories) {
    final directory = Directory(dir);

    // التحقق من وجود المجلد، وإن لم يكن موجودًا يتم إنشاؤه
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
      log('Created: $dir ✔');
    } else {
      log('Directory already exists: $dir ');
    }
  }
  log('تم إنشاء المجلدات بنجاح ✔');
}
