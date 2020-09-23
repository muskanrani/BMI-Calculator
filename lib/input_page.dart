import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const bottomCardColour = Color(0xFFEB1555);
const activeCardColour = Color(0xFF1D1E33);
const inActiveCardColour = Color(0xFF111328);

enum Gender{
  female,
  male,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColour = inActiveCardColour;
  Color femaleCardColour = inActiveCardColour;

  void updateColor(Gender selectedGender){
    if(selectedGender == Gender.male){
      if(maleCardColour == inActiveCardColour){
        maleCardColour = activeCardColour;
        femaleCardColour = inActiveCardColour;
      }
      else{
        maleCardColour = inActiveCardColour;
      }
    }
    if(selectedGender == Gender.female){
      if(femaleCardColour == inActiveCardColour){
        femaleCardColour = activeCardColour;
        maleCardColour = inActiveCardColour;
      }
      else{
        femaleCardColour = inActiveCardColour;
      }
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                    onTap:(){
                      setState(() {
                        updateColor(Gender.male);
                      });
                    },
                      child: ReusableCard(
                        colour:  inActiveCardColour,
                        cardChild: IconContent(
                          icon:FontAwesomeIcons.mars,
                          label: 'MALE',
                        ),
                      ),
                  ),
               ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          updateColor(Gender.female);
                        });
                      },

                      child: ReusableCard(
                        colour:  inActiveCardColour,
                        cardChild: IconContent(
                          icon:FontAwesomeIcons.venus,
                          label: 'FEMALE',
                        ),
                      ),
                  ),
               ),
                ],
              ),
            ),
            Expanded(
                child: ReusableCard(
                  colour:  activeCardColour,
              ),
            ),
            Expanded(
              child: Row(
              children: <Widget>[
                  Expanded(child: ReusableCard(
                    colour:  activeCardColour,
                  ),
                  ),
                  Expanded(child: ReusableCard(
                    colour:  activeCardColour,
                  ),
                  ),
                  ],
              ),

            ),
          Container(
            color: bottomCardColour,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          ),
          ],
        ),
    );
  }
}

