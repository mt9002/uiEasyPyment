# uiEasyPyment
flutter test --coverage
coverage/lcov.info

genhtml coverage/lcov.info -o coverage/html
coverage/html/index.html
start coverage/html/index.html


dart pub global activate lcov_report
dart pub global run lcov_report:report


// alternativa 3