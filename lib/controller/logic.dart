import '../helpers/db-helper.dart';
import '../model/calculation-history.dart';

class CalculatorLogic {
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";
  String preOutput = "0";
  String postOutput = "0";
  List<String> equationStack = []; // New stack to hold equation inputs

  buttonPressed(String buttonText) async {
    if(buttonText == "CLEAR"){
      preOutput = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
      equationStack.clear(); // Clear equation stack on clear button press
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "X"){
      operand = buttonText;
      num1 = double.parse(preOutput);
      equationStack.add(preOutput); // Add first operand to equation stack
      equationStack.add(operand); // Add operand to equation stack
      preOutput = "0";
    } else if(buttonText == "."){
      if(preOutput.contains(".")){
        print("Already contains a decimal");
        return;
      } else {
        preOutput = preOutput + buttonText;
      }
    } else if (buttonText == "="){
      num2 = double.parse(preOutput);
      equationStack.add(preOutput); // Add second operand to equation stack
      preOutput = computeResult().toString();
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
      equationStack.clear(); // Clear equation stack after computing result
    } else {
      preOutput = preOutput + buttonText;
    }

    postOutput = preOutput;

    final calculation = "${equationStack.join()} = $preOutput";
    final time = DateTime.now();
    final history = CalculationHistory(
      id: null,
      calculation: calculation,
      title: '', time: '',
    );
    await DBHelper.insert(history);

  }

  double computeResult() {
    double result = double.parse(equationStack[0]);
    for (String input in equationStack.sublist(1)) {
      if (input == "+" || input == "-" || input == "X" || input == "/") {
        operand = input;
        continue;
      }
      double num = double.parse(input);
      switch(operand) {
        case "+":
          result += num;
          break;
        case "-":
          result -= num;
          break;
        case "X":
          result *= num;
          break;
        case "/":
          result /= num;
          break;
      }
    }
    return result;
  }
}