import 'dart:math';
import 'package:flutter/material.dart';
import 'package:food_delivery_ecommerce/utilities/colors.dart';
import 'package:food_delivery_ecommerce/utilities/dimension.dart';
import 'package:food_delivery_ecommerce/widgets/big_text.dart';
import 'package:food_delivery_ecommerce/widgets/small_text.dart';


class PersonPage extends StatefulWidget {
  const PersonPage({super.key});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  
  final List<String> _generatedNumbers = [];
  final Random _random = Random();

  
  void _addRandomNumber() {
  
    String firstDigit = ( _random.nextInt(9)).toString();

    
    String remainingDigits = '';
    for (int i = 0; i < 9; i++) {
      remainingDigits += _random.nextInt(10).toString();
    }

  
    final String randomNumber = firstDigit + remainingDigits;

    setState(() {
      _generatedNumbers.add(randomNumber);
    });
  }

  
  void _removeLastNumber() {
   
    if (_generatedNumbers.isNotEmpty) {
      setState(() {
        
        _generatedNumbers.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: Dimension.height45 * 1.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                GestureDetector(
                  onTap: _addRandomNumber,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimension.width15,
                        vertical: Dimension.height15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimension.radius15),
                        color: AppColors.mainColor),
                    child: BigText(
                      text: 'Add',
                      size: Dimension.font20,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: Dimension.width20,
                ),
                
                GestureDetector(
                  
                  onTap: _removeLastNumber,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimension.width15,
                        vertical: Dimension.height15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimension.radius15),
                        color: Colors.redAccent),
                    child: BigText(
                      
                      text: 'Delete',
                      size: Dimension.font20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: Dimension.height20),
          
          Expanded(
            child: ListView.builder(
             padding: EdgeInsets.zero, 
              itemCount: _generatedNumbers.length,
              itemBuilder: (context, index) {
                return Padding(
                  
                  padding: EdgeInsets.symmetric(
                      vertical: Dimension.height10 / 2,
                      horizontal: Dimension.width20),
                  child: Center(
                    child: SmallText(
                      text: '${index + 1}.   ${_generatedNumbers[index]}',
                      size: Dimension.font20,
                      color: Colors.black87,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
