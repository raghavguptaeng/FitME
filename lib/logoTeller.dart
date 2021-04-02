String LogoTeller(String exercise){
  List data = [
    [
      "Treadmill",
      'treadmill.png'
    ],
    [
      'Cross Trainer',
      'eleptical.png'
    ],
    [
      'Skipping',
      'skipping.png'
    ],
    [
      'Jumping Jacks',
      'man-jumping-with-arms-raised.png'
    ],
    [
      'Crunches',
      'sit-up.png'
    ],
    [
      'Leg Raise',
      'stick-man-lying-down-and-raising-one-leg.png'
    ],
    [
      'Crunches cum situps',
      'sit-up.png'
    ]
  ];
  for(int i=0 ; i<data.length;++i){
    if(data[i][0]==exercise){
      return data[i][1];
    }
  }
  return 'treadmill.png';
}