import 'package:flutter/material.dart';

import '../utility/size_config.dart';
import '../app_constants.dart';
import '../models/question_model.dart';

SnackBar messageSnackBar(String message, {timeUp = 750}) {
  return SnackBar(
    shape: RoundedRectangleBorder(
      borderRadius: AppConstants.circleRadius,
    ),
    duration: Duration(milliseconds: timeUp),
    content: Text(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: SizeConfig.scaledHeight(2.5),
      ),
    ),
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(
      left: SizeConfig.scaledWidth(20),
      right: SizeConfig.scaledWidth(20),
      bottom: SizeConfig.scaledHeight(5),
    ),
  );
}

String counterDisplay(queueIdx, itemNumber) {
  var counter = itemNumber > 9 && queueIdx + 1 < 10
      ? "0${queueIdx + 1}/$itemNumber"
      : "${queueIdx + 1}/$itemNumber";
  return counter;
}

List<QuestionModel> getQuizQuestions() {
  return [
    QuestionModel(
      qusTxt: "Which disease devastated livestock across the UK during 2001?",
      ansList: [
        AnswerModel(ansTxt: "Hand-and-foot", accuracy: 0),
        AnswerModel(ansTxt: "Foot-in-mouth", accuracy: 1),
        AnswerModel(ansTxt: "Hand-to-mouth", accuracy: 0),
        AnswerModel(ansTxt: "Foot-and-mouth", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "Which of these kills its victims by constriction?",
      ansList: [
        AnswerModel(ansTxt: "Andalucia", accuracy: 0),
        AnswerModel(ansTxt: "Anaconda", accuracy: 1),
        AnswerModel(ansTxt: "Andypandy", accuracy: 0),
        AnswerModel(ansTxt: "Annerobinson", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "Which of these might be used in underwater naval operations?",
      ansList: [
        AnswerModel(ansTxt: "Frogmen", accuracy: 1),
        AnswerModel(ansTxt: "Newtmen", accuracy: 0),
        AnswerModel(ansTxt: "Protos", accuracy: 0),
        AnswerModel(ansTxt: "Lamborghini", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "A 'cuppa' is an informal term for what?",
      ansList: [
        AnswerModel(ansTxt: "Policeman", accuracy: 0),
        AnswerModel(ansTxt: "Cup of tea", accuracy: 1),
        AnswerModel(ansTxt: "2p coin", accuracy: 0),
        AnswerModel(ansTxt: "Smoked herring", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "What is the meaning of the colloquial expression 'in the bag'?",
      ansList: [
        AnswerModel(ansTxt: "Almost certain", accuracy: 1),
        AnswerModel(ansTxt: "Newly bought", accuracy: 0),
        AnswerModel(ansTxt: "Freshly cooked", accuracy: 0),
        AnswerModel(ansTxt: "Recently stolen", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "Which activity would you most associate with a mole?",
      ansList: [
        AnswerModel(ansTxt: "Burrowing", accuracy: 1),
        AnswerModel(ansTxt: "Climbing", accuracy: 0),
        AnswerModel(ansTxt: "Swimming", accuracy: 0),
        AnswerModel(ansTxt: "Flying", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "What is the name of the instrument panel in a car?",
      ansList: [
        AnswerModel(ansTxt: "Chargeboard", accuracy: 0),
        AnswerModel(ansTxt: "Sprintboard", accuracy: 0),
        AnswerModel(ansTxt: "Dashboard", accuracy: 1),
        AnswerModel(ansTxt: "Jogboard", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "What type of protective headgear do motorcyclists wear?",
      ansList: [
        AnswerModel(ansTxt: "Bash helmet", accuracy: 0),
        AnswerModel(ansTxt: "Crash helmet", accuracy: 1),
        AnswerModel(ansTxt: "Mash helmet", accuracy: 0),
        AnswerModel(ansTxt: "Flash helmet", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "Which of these refers to an alcoholic drink served with ice?",
      ansList: [
        AnswerModel(ansTxt: "Shingled", accuracy: 0),
        AnswerModel(ansTxt: "On the rocks", accuracy: 1),
        AnswerModel(ansTxt: "Pebbledashed", accuracy: 0),
        AnswerModel(ansTxt: "Stoned", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "Which of these is an obstruction built across a river?",
      ansList: [
        AnswerModel(ansTxt: "Seer", accuracy: 0),
        AnswerModel(ansTxt: "Rear", accuracy: 0),
        AnswerModel(ansTxt: "Fear", accuracy: 0),
        AnswerModel(ansTxt: "Weir", accuracy: 1),
      ],
    ),
    QuestionModel(
      qusTxt: "Which of these is an adolescent romantic attachment?",
      ansList: [
        AnswerModel(ansTxt: "Puppy love", accuracy: 1),
        AnswerModel(ansTxt: "Kitten love", accuracy: 0),
        AnswerModel(ansTxt: "Bunny love", accuracy: 0),
        AnswerModel(ansTxt: "Piggy love", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "Which of these is a slang term for 'excellent'?",
      ansList: [
        AnswerModel(ansTxt: "Joker", accuracy: 0),
        AnswerModel(ansTxt: "Queen", accuracy: 0),
        AnswerModel(ansTxt: "Jack", accuracy: 0),
        AnswerModel(ansTxt: "Ace", accuracy: 1),
      ],
    ),
    QuestionModel(
      qusTxt:
          "What are you said to break, when you make friends with a stranger?",
      ansList: [
        AnswerModel(ansTxt: "The ice", accuracy: 1),
        AnswerModel(ansTxt: "The snow", accuracy: 0),
        AnswerModel(ansTxt: "The hail", accuracy: 0),
        AnswerModel(ansTxt: "The frost", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "Two very different things are said to be like 'chalk and ...'?",
      ansList: [
        AnswerModel(ansTxt: "Chipmunks", accuracy: 0),
        AnswerModel(ansTxt: "Cheese", accuracy: 1),
        AnswerModel(ansTxt: "Chestnuts", accuracy: 0),
        AnswerModel(ansTxt: "Chopsticks", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "Which of these is a type of puzzle often found in newspapers?",
      ansList: [
        AnswerModel(ansTxt: "Crossword", accuracy: 1),
        AnswerModel(ansTxt: "Madword", accuracy: 0),
        AnswerModel(ansTxt: "Angryword", accuracy: 0),
        AnswerModel(ansTxt: "Snappyword", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "What is Double Gloucester?",
      ansList: [
        AnswerModel(ansTxt: "Card game", accuracy: 0),
        AnswerModel(ansTxt: "Cheese", accuracy: 1),
        AnswerModel(ansTxt: "Very thick hedge", accuracy: 0),
        AnswerModel(ansTxt: "Thatched roof", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "Which of these first came on the market in 1937?",
      ansList: [
        AnswerModel(ansTxt: "Posh Spice", accuracy: 0),
        AnswerModel(ansTxt: "Scary Spice", accuracy: 0),
        AnswerModel(ansTxt: "Baby Spice", accuracy: 0),
        AnswerModel(ansTxt: "Old Spice", accuracy: 1),
      ],
    ),
    QuestionModel(
      qusTxt:
          "A person who slavishly buys the latest clothes is a 'fashion ...'?",
      ansList: [
        AnswerModel(ansTxt: "Witness", accuracy: 0),
        AnswerModel(ansTxt: "Culprit", accuracy: 0),
        AnswerModel(ansTxt: "Suspect", accuracy: 0),
        AnswerModel(ansTxt: "Victim", accuracy: 1),
      ],
    ),
    QuestionModel(
      qusTxt:
          "Which of these is TV personality Jamie Oliver most likely to use?",
      ansList: [
        AnswerModel(ansTxt: "Magic wand", accuracy: 0),
        AnswerModel(ansTxt: "Food blender", accuracy: 1),
        AnswerModel(ansTxt: "Garden spade", accuracy: 0),
        AnswerModel(ansTxt: "Paint roller", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "Which word describes a film that is a financial success?",
      ansList: [
        AnswerModel(ansTxt: "Gangbuster", accuracy: 0),
        AnswerModel(ansTxt: "Filibuster", accuracy: 0),
        AnswerModel(ansTxt: "Blockbuster", accuracy: 1),
        AnswerModel(ansTxt: "Dambuster", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "What name is given to the projecting part of the face of a dog?",
      ansList: [
        AnswerModel(ansTxt: "Muddle", accuracy: 0),
        AnswerModel(ansTxt: "Muggle", accuracy: 0),
        AnswerModel(ansTxt: "Muzzle", accuracy: 1),
        AnswerModel(ansTxt: "Muffle", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt:
          "If you live in seclusion, what sort of 'tower' are you said to be in?",
      ansList: [
        AnswerModel(ansTxt: "Diamond", accuracy: 0),
        AnswerModel(ansTxt: "Gold", accuracy: 0),
        AnswerModel(ansTxt: "Silver", accuracy: 0),
        AnswerModel(ansTxt: "Ivory", accuracy: 1),
      ],
    ),
    QuestionModel(
      qusTxt: "According to the proverb, what does a watched pot never do?",
      ansList: [
        AnswerModel(ansTxt: "Fill", accuracy: 0),
        AnswerModel(ansTxt: "Spill", accuracy: 0),
        AnswerModel(ansTxt: "Boil", accuracy: 1),
        AnswerModel(ansTxt: "Empty", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt:
          "Who does not receive wool from the black sheep in the nursery rhyme?",
      ansList: [
        AnswerModel(ansTxt: "Monk", accuracy: 1),
        AnswerModel(ansTxt: "Dame", accuracy: 0),
        AnswerModel(ansTxt: "Little boy", accuracy: 0),
        AnswerModel(ansTxt: "Master", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "Which of these is a 2003 Disney computer-animated film?",
      ansList: [
        AnswerModel(ansTxt: "Locating Remo", accuracy: 0),
        AnswerModel(ansTxt: "Discovering Lemo", accuracy: 0),
        AnswerModel(ansTxt: "Unearthing Zemo", accuracy: 0),
        AnswerModel(ansTxt: "Finding Nemo", accuracy: 1),
      ],
    ),
    QuestionModel(
      qusTxt: "Which popular soul singer died aged 58, in July 2003?",
      ansList: [
        AnswerModel(ansTxt: "Barry Blue", accuracy: 0),
        AnswerModel(ansTxt: "Barry Black", accuracy: 0),
        AnswerModel(ansTxt: "Barry White", accuracy: 1),
        AnswerModel(ansTxt: "Barry Green", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "Who released an album called 'Justified' in 2003?",
      ansList: [
        AnswerModel(ansTxt: "Britney Spears", accuracy: 0),
        AnswerModel(ansTxt: "Justin Timberlake", accuracy: 1),
        AnswerModel(ansTxt: "Gareth Gates", accuracy: 0),
        AnswerModel(ansTxt: "Victoria Beckham", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "The name of which group is Gaelic for 'family'?",
      ansList: [
        AnswerModel(ansTxt: "Aswad", accuracy: 0),
        AnswerModel(ansTxt: "The Pogues", accuracy: 0),
        AnswerModel(ansTxt: "Clannad", accuracy: 1),
        AnswerModel(ansTxt: "Scritti Politti", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "In music, which symbols indicate relative loudness?",
      ansList: [
        AnswerModel(ansTxt: "Pneumonics", accuracy: 0),
        AnswerModel(ansTxt: "Histrionics", accuracy: 0),
        AnswerModel(ansTxt: "Dynamics", accuracy: 1),
        AnswerModel(ansTxt: "Ceramics", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "Complete the name of the band, the Travelling ...?",
      ansList: [
        AnswerModel(ansTxt: "Bilberrys", accuracy: 0),
        AnswerModel(ansTxt: "Blackberrys", accuracy: 0),
        AnswerModel(ansTxt: "Wilburys", accuracy: 1),
        AnswerModel(ansTxt: "Strawberries", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "Which is a seabird with a deeply forked tail?",
      ansList: [
        AnswerModel(ansTxt: "Destroyer bird", accuracy: 0),
        AnswerModel(ansTxt: "Cruiser bird", accuracy: 0),
        AnswerModel(ansTxt: "Frigate bird", accuracy: 1),
        AnswerModel(ansTxt: "Corvette bird", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "In which 2003 film is Jim Carrey granted divine powers by God?",
      ansList: [
        AnswerModel(ansTxt: "Harry the Holy", accuracy: 0),
        AnswerModel(ansTxt: "Al Omnipotent", accuracy: 0),
        AnswerModel(ansTxt: "Gordon Plays God", accuracy: 0),
        AnswerModel(ansTxt: "Bruce Almighty", accuracy: 1),
      ],
    ),
    QuestionModel(
      qusTxt: "Who asked 'Are You Ready for Love?' in the title of a 2003 hit?",
      ansList: [
        AnswerModel(ansTxt: "Elton John", accuracy: 1),
        AnswerModel(ansTxt: "Billy Bob Thornton", accuracy: 0),
        AnswerModel(ansTxt: "Cher", accuracy: 0),
        AnswerModel(ansTxt: "Zsa Zsa Gabor", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "Which was a battle in the American War of Independence?",
      ansList: [
        AnswerModel(ansTxt: "Fairway Hill", accuracy: 0),
        AnswerModel(ansTxt: "Green Hill", accuracy: 0),
        AnswerModel(ansTxt: "Bunker Hill", accuracy: 1),
        AnswerModel(ansTxt: "Rough Hill", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt:
          "In which town are the administrative headquarters of the Vale of Glamorgan?",
      ansList: [
        AnswerModel(ansTxt: "Thomas", accuracy: 0),
        AnswerModel(ansTxt: "Barry", accuracy: 1),
        AnswerModel(ansTxt: "Gareth", accuracy: 0),
        AnswerModel(ansTxt: "Alun", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "In which English county is the town of St Austell?",
      ansList: [
        AnswerModel(ansTxt: "Devon", accuracy: 0),
        AnswerModel(ansTxt: "Cornwall", accuracy: 1),
        AnswerModel(ansTxt: "Somerset", accuracy: 0),
        AnswerModel(ansTxt: "Dorset", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "What would you normally do with a mai tai?",
      ansList: [
        AnswerModel(ansTxt: "Eat it", accuracy: 0),
        AnswerModel(ansTxt: "Wear it", accuracy: 0),
        AnswerModel(ansTxt: "Drink it", accuracy: 1),
        AnswerModel(ansTxt: "Sing it", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "In which sport does red weigh 25 kg and yellow weigh 15 kg?",
      ansList: [
        AnswerModel(ansTxt: "Horse racing", accuracy: 0),
        AnswerModel(ansTxt: "Judo", accuracy: 0),
        AnswerModel(ansTxt: "Weightlifting", accuracy: 1),
        AnswerModel(ansTxt: "Croquet", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "How was James VII of Scotland known in England?",
      ansList: [
        AnswerModel(ansTxt: "James I", accuracy: 0),
        AnswerModel(ansTxt: "Lord Protector", accuracy: 0),
        AnswerModel(ansTxt: "James II", accuracy: 1),
        AnswerModel(ansTxt: "Young Pretender", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "Which of these deserts is in the USA?",
      ansList: [
        AnswerModel(ansTxt: "Atacama Desert", accuracy: 0),
        AnswerModel(ansTxt: "Gobi Desert", accuracy: 0),
        AnswerModel(ansTxt: "Sahara Desert", accuracy: 0),
        AnswerModel(ansTxt: "Mojave Desert", accuracy: 1),
      ],
    ),
    QuestionModel(
      qusTxt: "Of which US state is Des Moines the capital?",
      ansList: [
        AnswerModel(ansTxt: "Nebraska", accuracy: 0),
        AnswerModel(ansTxt: "Iowa", accuracy: 1),
        AnswerModel(ansTxt: "Montana", accuracy: 0),
        AnswerModel(ansTxt: "Idaho", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "In which US state is the city of Tucson?",
      ansList: [
        AnswerModel(ansTxt: "Arizona", accuracy: 1),
        AnswerModel(ansTxt: "Kansas", accuracy: 0),
        AnswerModel(ansTxt: "Texas", accuracy: 0),
        AnswerModel(ansTxt: "Colorado", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "Which sport was originally called 'mintonette'?",
      ansList: [
        AnswerModel(ansTxt: "Basketball", accuracy: 0),
        AnswerModel(ansTxt: "Badminton", accuracy: 0),
        AnswerModel(ansTxt: "Volleyball", accuracy: 1),
        AnswerModel(ansTxt: "Curling", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "In sumo wrestling, what is the dohyo?",
      ansList: [
        AnswerModel(ansTxt: "Referee", accuracy: 0),
        AnswerModel(ansTxt: "Code of practice", accuracy: 0),
        AnswerModel(ansTxt: "Champion", accuracy: 0),
        AnswerModel(ansTxt: "Ring", accuracy: 1),
      ],
    ),
    QuestionModel(
      qusTxt: "In which sport is the Sam Maguire Cup annually contested?",
      ansList: [
        AnswerModel(ansTxt: "Ice hockey", accuracy: 0),
        AnswerModel(ansTxt: "Gaelic football", accuracy: 1),
        AnswerModel(ansTxt: "Curling", accuracy: 0),
        AnswerModel(ansTxt: "Bowls", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "To which group of Greek islands does Kalymnos belong?",
      ansList: [
        AnswerModel(ansTxt: "Cyclades", accuracy: 0),
        AnswerModel(ansTxt: "Dodecanese", accuracy: 1),
        AnswerModel(ansTxt: "Ionian", accuracy: 0),
        AnswerModel(ansTxt: "Sporades", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "Which film festival celebrated its 60th anniversary in 2003?",
      ansList: [
        AnswerModel(ansTxt: "Venice", accuracy: 1),
        AnswerModel(ansTxt: "London", accuracy: 0),
        AnswerModel(ansTxt: "Berlin", accuracy: 0),
        AnswerModel(ansTxt: "Cannes", accuracy: 0),
      ],
    ),
    QuestionModel(
      qusTxt: "Alnwick Castle is the stately home of the Dukes of where?",
      ansList: [
        AnswerModel(ansTxt: "Sutherland", accuracy: 0),
        AnswerModel(ansTxt: "Somerset", accuracy: 0),
        AnswerModel(ansTxt: "Northumberland", accuracy: 1),
        AnswerModel(ansTxt: "Norfolk", accuracy: 0),
      ],
    ),
  ];
}
