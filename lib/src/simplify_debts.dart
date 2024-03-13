class DebtSimplification {
  static List simplify(List initialDebts) {
    List<Map<String, dynamic>> debts = [];

    for (var obj in initialDebts) {
      var keys = obj.keys.toList();
      var values = obj[keys[0]];

      if (values == null) continue;

      var valueKeys = values.keys.toList();

      for (var valueKey in valueKeys) {
        var convertedObj = {
          "Person": valueKey,
          "Amount Owed": values[valueKey],
          "Amount Owed To": keys[0],
        };
        debts.add(convertedObj);
      }
    }

    Map<String, int> balance = {};

    for (var debt in debts) {
      var debtor = debt["Person"]!;
      var creditor = debt["Amount Owed To"];
      var amount = debt["Amount Owed"] as int;

      if (debtor == creditor) {
        continue;
      }

      balance[debtor] = (balance[debtor] ?? 0) - amount;
      balance[creditor] = (balance[creditor] ?? 0) + amount;
    }

    List<String> results = [];

    for (var person in balance.keys) {
      if (balance[person]! > 0) {
        for (var otherPerson in balance.keys) {
          if (balance[otherPerson]! < 0) {
            var amountOwed = -balance[otherPerson]!;
            var amountPaid = balance[person]!;

            if (amountPaid >= amountOwed) {
              results.add("$otherPerson owes $person \$$amountOwed");
              balance[person] = balance[person]! - amountOwed;
              balance[otherPerson] = 0;
            } else {
              results.add("$otherPerson owes $person \$$amountPaid");
              balance[person] = 0;
              balance[otherPerson] = balance[otherPerson]! + amountPaid;
              break;
            }
          }
        }
      }
    }

    return results;
  }
}
