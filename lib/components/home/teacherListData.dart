class TeacherListData {
  TeacherListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    this.moto,
    this.title = '',
    this.desk = '',
    this.spesialis = '',
  });

  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;
  List<String>? moto;
  String title;
  String desk;
  String spesialis;

  static List<TeacherListData> tabIconsList = <TeacherListData>[
    TeacherListData(
      imagePath: 'assets/guruBK/ricky.png',
      titleTxt: 'Ricky',
      title: 'Pria',
      moto: <String>['Semangat,', 'pantang menyerah,', 'berani'],
      startColor: '#A1C2F1',
      endColor: '#417ecc',
      spesialis: 'Kepala BK',
      desk: 'Mr. Ricky Sudrajad, S.Pd., is a counselor with an organized and no-nonsense style. He educates students in setting objectives, overcoming challenges, and developing important life abilities. He is renowned for his strict direction. Students value his direct attitude and think that his advice has a positive effect on their personal development.'
    ),
    TeacherListData(
      imagePath: 'assets/guruBK/caca.png',
      titleTxt: 'Kasandra',
      title: 'wanita',
      moto: <String>['Mandiri,', 'Disiplin,', 'Berani'],
      startColor: '#A1C2F1',
      endColor: '#417ecc',
      spesialis: 'Kepala BK',
      desk: 'Mrs. Kasandra Fitriyani, S.Pd., a dynamic and diligent guidance counselor, treats educational support with a fresh perspective. She motivates students to achieve their greatest potential by involving them in their educational journey and setting clear expectations. Her severeness enforces accountability and motivates kids to achieve academic excellence.'
    ),
    TeacherListData(
      imagePath: 'assets/guruBK/heni.png',
      titleTxt: 'Heni',
      title: 'Wanita',
      moto: <String>['Hemat,', 'Cermat', 'Ceria'],
      startColor: '#A1C2F1',
      endColor: '#417ecc',
      spesialis: 'Kepala BK',
      desk: 'A college-focused counselor with a concentration on helping students succeed in higher education is Mrs. Heni Siswanti, S.Psi. She helps students make wise choices for their future educational plans by offering helpful advice on college selection, admissions methods, and career preparation.'
    ),
    TeacherListData(
      imagePath: 'assets/guruBK/ika.png',
      titleTxt: 'Fika',
      title: 'Wanita',
      moto: <String>['Bersahaja,', 'Cerdas', 'Lemah Lembut'],
      startColor: '#A1C2F1',
      endColor: '#417ecc',
      spesialis: 'Kepala BK',
      desk: 'Counselor Mrs. Ika Rafika, S.Pd., is a warm and approachable professional with ability in giving therapy sessions. She is the most suitable individual to approach for counseling needs since she makes it easy for students to open up and ask for help because of her kind personality traits.'
    ),
    TeacherListData(
      imagePath: 'assets/guruBK/nadia.png',
      titleTxt: 'Nadia',
      title: 'Wanita',
      moto: <String>['Hebat,', 'Baik Hati'],
      startColor: '#A1C2F1',
      endColor: '#417ecc',
      spesialis: 'Kepala BK',
      desk: 'Counselor Mrs. Nadya Afriliani, S.Pd is renowned for her excellent observing abilities and kind disposition. She is welcoming and offers a nonjudgmental environment for students to talk about their worries and feelings during counseling sessions.'
    ),
    TeacherListData(
      imagePath: 'assets/guruBK/sheila.png',
      titleTxt: 'Sheila',
      title: 'Wanita',
      moto: <String>['Kece,', 'Rendah Hati'],
      startColor: '#A1C2F1',
      endColor: '#417ecc',
      spesialis: 'Kepala BK',
      desk: 'Counselor Sheila Riani Putri, S.Psi, believes that it`s possible to use personal tales and experiences to engage students further. She creates a comfortable yet supportive environment for students to express their worries and ask for advice thanks to her charming way'
    ),
  ];
}
