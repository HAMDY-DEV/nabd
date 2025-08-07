import 'dart:io';

void main() {
  // مسار المشروع الحالي
  final projectPath = "${Directory.current.path}/lib";

  String nameFile = 'chat_details_view';

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
      print('Created: $dir ✔');
    } else {
      print('Directory already exists: $dir ');
    }
  }
  // ignore: avoid_print
  print('تم إنشاء المجلدات بنجاح ✔');
}
