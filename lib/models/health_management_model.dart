class HealthManagementModel {
  static List<List<String>> conditions = [
    [
      '痛い',
      '苦しい',
      'かゆい',
    ],
    [
      'めまい',
      '不安',
      '吐き気',
    ],
  ];

  static List<List<String>> speakConditions = [
    [
      '痛いです',
      '苦しいです',
      'かゆいです',
    ],
    [
      'めまいがします',
      '不安です',
      '吐き気がします',
    ],
  ];

  static List<List<String>> sites = [
    [
      '頭が',
      '目が',
      '耳が',
      '歯が',
    ],
    [
      '肺が',
      '腹が',
      '腰が',
      '足が',
    ],
  ];

  static List<List<String>> wants = [
    [
      '病院に行きたい',
      '薬を飲みたい',
    ],
    [
      '今すぐ',
      '様子を見て',
      '明日',
    ],
  ];

  static List<List<String>> speakWants = [
    [
      '病院に行きたいです',
      '薬を飲みたいです',
    ],
    [
      '今すぐ',
      '様子を見て',
      'あした',
    ],
  ];
}
