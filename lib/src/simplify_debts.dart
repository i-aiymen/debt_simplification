/// [DebtSimplification] is a class that provides a static method `simplify`
/// to simplify a list of debts between people.
library;

class DebtSimplification {
  /// The [simplify] method takes a list of initial debts and simplifies it.
  ///
  /// It first converts the initial debts into a more manageable format,
  /// where each debt is represented as a map with keys "Person", "Amount Owed",
  /// and "Amount Owed To".
  ///
  /// Then, it calculates the balance for each person by subtracting the amount
  /// they owe from the amount they are owed.
  ///
  /// Finally, it generates a list of simplified debts, where each debt is a
  /// string in the format "Person A owes Person B $X". The debts are simplified
  /// in such a way that each person only owes money to at most one other person.
  ///
  /// @param [initialDebts] A list of initial debts, where each debt is represented
  /// as a map with keys being the names of the people and values being another
  /// map with keys being the names of the people they owe money to and values
  /// being the amount of money owed.
  ///
  /// @return A list of simplified debts, where each debt is a string in the
  /// format "Person A owes Person B $X".
  static List simplify(List initialDebts) {
    List<Map<String, dynamic>> debts = [];

    for (var obj in initialDebts) {
      var keys = obj.keys.toList();
      var values = obj[keys[0]];

      if (values == null) continue;

      var valueKeys = values.keys.toList();

      for (var valueKey in valueKeys) {
        var convertedObj = {
          'Person': valueKey,
          'Amount Owed': values[valueKey],
          'Amount Owed To': keys[0],
        };
        debts.add(convertedObj);
      }
    }

    Map<String, int> balance = {};

    for (var debt in debts) {
      var debtor = debt['Person']!;
      var creditor = debt['Amount Owed To'];
      var amount = debt['Amount Owed'] as int;

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
              results.add('$otherPerson owes $person \$$amountOwed');
              balance[person] = balance[person]! - amountOwed;
              balance[otherPerson] = 0;
            } else {
              results.add('$otherPerson owes $person \$$amountPaid');
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
