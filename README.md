# debt_simplification

[![pub package](https://img.shields.io/pub/v/debt_simplification.svg)](https://pub.dev/packages/debt_simplification)
[![style: lint](https://img.shields.io/badge/style-lint-4BC0F5.svg)](https://pub.dev/packages/lint)

A Dart function that simplifies debt settlements among a group, similar to 'Quick Split' app. Takes a list of debts and returns a simplified list.

## Features Supported

See the example app for detailed implementation information.

| Features               | Android            | iOS                | macOS                | Web | Windows |
|------------------------|--------------------|--------------------|----------------------|-----|---------|
| Show toast             | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark:   | :heavy_check_mark: | :heavy_check_mark: |


## Platform Support

| Android | iOS | macOS | Web | Linux | Windows |
|---------|-----|-------|-----|-------|---------|
| ✔       | ✔   | ✔     | ✔   | ✔   | ✔     |


## Usage

Import the package with:
```
import 'package:debt_simplification/debt_simplification.dart';
```

Then, use the following code to simplify the debts:

```
List<Map<String, Map<String, int>>> initialDebts = [
    {
        "Alice": {
        "Bob": 10,
        "Charlie": 5,
        } // Bob owes Alice 10, Charlie owes Alice 5
    },
    {
        "Bob": {
        "Alice": 2,
        "Charlie": 3,
        } // Alice owes Bob 2, Charlie owes Bob 3
    },
    {
        "Charlie": {
        "Alice": 7,
        } // Alice owes Charlie 7
    }
];

List simplifiedDebts = DebtSimplification.simplify(initialDebts);
```


