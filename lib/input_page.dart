import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';

enum Gender{
  female,
  male,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColour = kInactiveCardColour;
  Color femaleCardColour = kInactiveCardColour;

  Gender selectedGender;
  int height = 180;
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
                    child: ReusableCard(
                      onPress: (){
                        setState(() {
                            selectedGender = Gender.male;
                        });
                      },
                        colour:  selectedGender == Gender.male ? kActiveCardColour : kInactiveCardColour,
                        cardChild: IconContent(
                        icon:FontAwesomeIcons.mars,
                        label: 'MALE',
                        ),
                        ),
                        ),
                  Expanded(
                        child: ReusableCard(
                        onPress: (){
                        setState(() {
                          selectedGender = Gender.female;
                        });
                          },
                          colour:  selectedGender == Gender.female ? kActiveCardColour : kInactiveCardColour,
                          cardChild: IconContent(
                              icon:FontAwesomeIcons.venus,
                              label: 'FEMALE',
                          ),
                        ),
                        ),
                ],
              ),
            ),
            Expanded(
                  child: ReusableCard(
                  colour:  kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT'                        ,
                        style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                            style: kBoldTextStyle,
                            ),
                            Text('cm',
                            style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTickMarkColor: Color(0xFF8D8E98),
                            thumbColor: kBottomCardColour,
                            overlayColor: Color(0x29EB1555),
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                          ),
                          child: Slider(value: height.toDouble(),
                              min: 120.0,
                              max: 220.0,
                              onChanged: (double newValue){
                            setState(() {
                              height = newValue.round();
                            });
                              }
                          ),
                        ),
                      ],
                    ),
                  ),
                  ),

            Expanded(
              child: Row(
              children: <Widget>[
                  Expanded(child: ReusableCard(
                    colour:  kActiveCardColour,
                  ),
                  ),
                  Expanded(child: ReusableCard(
                    colour:  kActiveCardColour,
                  ),
                  ),
                  ],
              ),

            ),
          Container(
            color: kBottomCardColour,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          ),
          ],
        ),
    );
  }
}

