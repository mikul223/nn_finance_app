import '../models/story_model.dart';

final List<Story> stories = [
  Story(
    id: 'alex_bugrov',
    title: 'Тайна Кармана',
    coverImage: 'assets/images/background_story1_main_menu.png',
    lines: [
      StoryLine(
      text: 'Приветствуем Вас в нашем приложении! Эта история о том, как развивалась финансовая жизнь Нижнего Новгорода. Вы сможете прочитать данную историю как в удобном Вам месте, так и прогуляться по финансовому маршруту Нижнего Новгорода.',
      isNarration: true,
      backgroundImage: 'assets/images/story_theme.png',
    ),
    StoryLine(
      text: 'Предлагаем Вам познакомиться с главным героем, в роли которого вы проживете эту историю. Приятного прочтения!',
      isNarration: true,
      backgroundImage: 'assets/images/story_theme.png',
    ),
    StoryLine(
      text: 'Меня зовут Александр Бугров, мне 24 года.',
      character: 'Александр Бугров',
      image: 'assets/images/alex.png',
      isMainHero: true,
      backgroundImage: 'assets/images/story_theme.png',
    ),
    StoryLine(
      text: 'Работаю стажером-аналитиком в Волго-Вятском главном управлении Центрального Банка.',
      character: 'Александр Бугров',
      image: 'assets/images/alex.png',
      isMainHero: true,
      backgroundImage: 'assets/images/story_theme.png',
    ),
    StoryLine(
      text: 'Родился и вырос здесь, в Нижнем Новгороде — отец инженер, мама учительница истории.',
      character: 'Александр Бугров',
      image: 'assets/images/alex.png',
      isMainHero: true,
      backgroundImage: 'assets/images/story_theme.png',
    ),
    StoryLine(
      text: 'Бабушка всегда рассказывала, что мы потомки тех самых Бугровых, знаменитых купцов, через младшую ветвь семьи, которая обеднела после революции.',
      character: 'Александр Бугров',
      image: 'assets/images/alex.png',
      isMainHero: true,
      backgroundImage: 'assets/images/story_theme.png',
    ),
    StoryLine(
      text: 'Я никогда особо не верил — ну Бугровых в России тысячи, какие мы родственники миллионеров?',
      character: 'Александр Бугров',
      image: 'assets/images/alex.png',
      isMainHero: true,
      backgroundImage: 'assets/images/story_theme.png',
    ),
    StoryLine(
      text: 'Но дома до сих пор хранится потёртая фотография 1908 года, на обороте надпись:',
      character: 'Александр Бугров',
      image: 'assets/images/alex.png',
      isMainHero: true,
      backgroundImage: 'assets/images/story_theme.png',
    ),
    StoryLine(
      text: '"Николай Александрович с племянником Сашей". Странное совпадение, не более.',
      character: 'Александр Бугров',
      image: 'assets/images/alex.png',
      isMainHero: true,
      backgroundImage: 'assets/images/story_theme.png',
    ),
    StoryLine(
      text: 'Окончил Вышку, защитил диплом о банковской системе Российской империи — всегда нравилось копаться в истории финансов.',
      character: 'Александр Бугров',
      image: 'assets/images/alex.png',
      isMainHero: true,
      backgroundImage: 'assets/images/story_theme.png',
    ),
    StoryLine(
      text: 'После магистратуры решил вернуться в родной город, не хотел оставаться в Москве.',
      character: 'Александр Бугров',
      image: 'assets/images/alex.png',
      isMainHero: true,
      backgroundImage: 'assets/images/story_theme.png',
    ),
    StoryLine(
      text: 'Четыре месяца назад устроился в ЦБ стажером, снимаю квартиру в центре, в старом купеческом квартале.',
      character: 'Александр Бугров',
      image: 'assets/images/alex.png',
      isMainHero: true,
      backgroundImage: 'assets/images/story_theme.png',
    ),
    StoryLine(
      text: 'Коллеги говорят, что я перфекционист и слишком принципиальный — может, и так. Верю, что финансы должны служить людям, а не наоборот.',
      character: 'Александр Бугров',
      image: 'assets/images/alex.png',
      isMainHero: true,
      backgroundImage: 'assets/images/story_theme.png',
    ),
    StoryLine(
      text: 'По утрам бегаю вдоль Волги, коллекционирую старинные монеты, веду небольшой блог об истории денег в России.',
      character: 'Александр Бугров',
      image: 'assets/images/alex.png',
      isMainHero: true,
      backgroundImage: 'assets/images/story_theme.png',
    ),
    StoryLine(
      text: 'Иногда волонтерю в городском приюте — сам не понимаю, откуда эта потребность помогать чужим людям, просто чувствую, что должен.',
      character: 'Александр Бугров',
      image: 'assets/images/alex.png',
      isMainHero: true,
      backgroundImage: 'assets/images/story_theme.png',
    ),
    StoryLine(
      text: 'Странная вещь: когда прохожу мимо зданий, которые построил Николай Бугров — ночлежка на Рождественской, здание Думы — всегда накрывает какое-то дежавю.',
      character: 'Александр Бугров',
      image: 'assets/images/alex.png',
      isMainHero: true,
      backgroundImage: 'assets/images/story_theme.png',
    ),
    StoryLine(
      text: 'Будто эти стены меня помнят. Бред, конечно.',
      character: 'Александр Бугров',
      image: 'assets/images/alex.png',
      isMainHero: true,
      backgroundImage: 'assets/images/story_theme.png',
    ),

    //ПРОЛОГ: МОНЕТА ВРЕМЕНИ
    //СЦЕНА 1: СОН (затемнение, голоса)
    StoryLine(
      text: '[Темнота. Звуки ярмарки XIX века: гул голосов, конские копыта, скрип телег. Постепенно проступает силуэт мужчины в купеческом кафтане]',
      isNarration: true,
      backgroundImage: 'assets/images/bedroom_alex.png',
    ),
    StoryLine(
      text: '''(эхом, встревоженно)
Александр...Племянник.... Слышишь меня?''',
      character: 'Голос Бугрова',
      backgroundImage: 'assets/images/bedroom_alex.png',
    ),
    StoryLine(
      text: '''(сонно, неразборчиво)
Кто... кто вы?''',
      character: 'Александр Бугров',
      image: 'assets/images/alex.png',
      isMainHero: true,
      backgroundImage: 'assets/images/bedroom_alex.png',
    ),
    StoryLine(
      text: '''(настойчивее)
Времени мало. Заговор... мука... к вечеру все потеряет. Только ты можешь помочь. Ищи монету. Она приведет тебя.''',
      character: 'Голос Бугрова',
      backgroundImage: 'assets/images/bedroom_alex.png',
    ),
    StoryLine(
      text: 'Какую монету? Я вас не понимаю!',
      character: 'Александр Бугров',
      image: 'assets/images/alex.png',
      isMainHero: true,
      backgroundImage: 'assets/images/bedroom_alex.png',
    ),
    StoryLine(
      text: '''(затихая)
Монета 1885 года... Главный дом... Помни — ты Бугров. Кровь помнит...''',
      character: 'Голос Громова',
      backgroundImage: 'assets/images/bedroom_alex.png',
    ),
    StoryLine(
      text: '[Резкий звук — Саша просыпается]',
      isNarration: true,
      backgroundImage: 'assets/images/bedroom_alex.png',
    ),

    //СЦЕНА 2: УТРО В КВАРТИРЕ
    StoryLine(
      text: '[Саша сидит на кровати, тяжело дышит]',
      isNarration: true,
      backgroundImage: 'assets/images/bedroom_alex_morning.png',
    ),
    StoryLine(
      text: '''(сам себе, устало)
Опять этот сон... Уже третью ночь подряд.''',
      character: 'Александр Бугров',
      image: 'assets/images/alex.png',
      isMainHero: true,
      backgroundImage: 'assets/images/bedroom_alex_morning.png',
    ),
    StoryLine(
      text: '[Смотрит на часы — 8:47]',
      isNarration: true,
      backgroundImage: 'assets/images/bedroom_alex_morning.png',
    ),
    StoryLine(
      text: 'Черт, опять проспал пробежку.',
      character: 'Александр Бугров',
      image: 'assets/images/alex.png',
      isMainHero: true,
      backgroundImage: 'assets/images/bedroom_alex_morning.png',
    ),
    StoryLine(
      text: '[Выходит на площадь, где разворачивается современная Нижегородская ярмарка. Палатки, торговцы, туристы]',
      isNarration: true,
      backgroundImage: 'assets/images/nn_fair.png',
    ),

    //СЦЕНА 3: НА СОВРЕМЕННОЙ ЯРМАРКЕ
    StoryLine(
      text: '[Александр подходит к киоску с мороженым. Продавщица — пожилая женщина, с проницательным взглядом]',
      isNarration: true,
      backgroundImage: 'assets/images/nn_fair.png',
    ),
    StoryLine(
      text: 'Здравствуйте! Пломбир, пожалуйста.',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex.png',
      backgroundImage: 'assets/images/nn_fair.png',
    ),
    StoryLine(
      text: '''(протягивает мороженое, внимательно смотрит на него)
Семьдесят рублей, молодой человек.''',
      character: 'Продавщица',
      image: 'assets/images/saleswoman.png',
      backgroundImage: 'assets/images/nn_fair.png',
    ),
    StoryLine(
      text: '[Саша дает сто рублей. Продавщица долго роется в кассе, достает старую монету]',
      isNarration: true,
      backgroundImage: 'assets/images/nn_fair.png',
    ),
    StoryLine(
      text: 'Вот ваша сдача. Тридцать рублей... ',
      character: 'Продавщица',
      image: 'assets/images/saleswoman.png',
      backgroundImage: 'assets/images/nn_fair.png',
    ),

    //тут можно добавить кадр с монеткой в руке
    StoryLine(
      text: '[Протягивает горсть монет, среди которых находиться одна старая, потемневшая. Саша берет ее, вертит в руках]',
      isNarration: true,
      backgroundImage: 'assets/images/nn_fair.png',
    ),
    StoryLine(
      text: '''(удивленно)
Это... это же имперская монета. Откуда у вас?''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex.png',
      backgroundImage: 'assets/images/nn_fair.png',
    ),
    StoryLine(
      text: '''(загадочно улыбается)
А вам зачем? Коллекционер, что ли?''',
      character: 'Продавщица',
      image: 'assets/images/saleswoman.png',
      backgroundImage: 'assets/images/nn_fair.png',
    ),
    StoryLine(
      text: 'Да, немного. Но вы понимаете, что это антиквариат? Стоит больше, чем...',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex.png',
      backgroundImage: 'assets/images/nn_fair.png',
    ),
    StoryLine(
      text: '''(перебивает, строго)
Не все измеряется деньгами, Александр Николаевич. Некоторые вещи приходят к тем, кому должны прийти.''',
      character: 'Продавщица',
      image: 'assets/images/saleswoman.png',
      backgroundImage: 'assets/images/nn_fair.png',
    ),
    StoryLine(
      text: '[Саша замирает]',
      isNarration: true,
      backgroundImage: 'assets/images/nn_fair.png',
    ),
    StoryLine(
      text: '''(не слушает, смотрит в сторону Главного ярмарочного дома)
 Идите туда. К главному дому. Там вас ждут. И помните — кровь помнит, даже когда разум забыл.''',
      character: 'Продавщица',
      image: 'assets/images/saleswoman.png',
      backgroundImage: 'assets/images/nn_fair.png',
    ),
    StoryLine(
      text: '''(растерянно)
 Подождите, что вы...''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex.png',
      backgroundImage: 'assets/images/nn_fair.png',
    ),
    StoryLine(
      text: '[Продавщица отворачивается к другому покупателю, словно разговора не было]',
      isNarration: true,
      backgroundImage: 'assets/images/nn_fair.png',
    ),
    
     //СЦЕНА 4: У ГЛАВНОГО ЯРМАРОЧНОГО ДОМА
     StoryLine(
      text: '[Саша стоит перед величественным классическим зданием Главного ярмарочного дома. Сжимает в руке монету. Смотрит на нее]',
      isNarration: true,
      backgroundImage: 'assets/images/nn_fair.png',
    ),
    StoryLine(
      text: '''(сам себе)
Сон. Монета. Это какое-то безумие.''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex.png',
      backgroundImage: 'assets/images/nn_fair.png',
    ),
    StoryLine(
      text: '[Закрывает глаза, массирует виски]',
      isNarration: true,
      backgroundImage: 'assets/images/nn_fair.png',
    ),
    StoryLine(
      text: 'Мне нужно выспаться. Или к врачу сходить.',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex.png',
      backgroundImage: 'assets/images/nn_fair.png',
    ),
    StoryLine(
      text: '[Открывает глаза — и вдруг монета в его руке начинает слабо светиться теплым золотистым светом]',
      isNarration: true,
      backgroundImage: 'assets/images/nn_fair.png',
    ),
    StoryLine(
      text: '''(отшатывается)
Что за...''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex.png',
      backgroundImage: 'assets/images/nn_fair.png',
    ),
    StoryLine(
      text: '[Свет усиливается. Вокруг начинает искажаться воздух, как в летний зной. Звуки современной ярмарки искажаются, замедляются]',
      isNarration: true,
      backgroundImage: 'assets/images/nn_fair.png',
    ),
    StoryLine(
      text: '''(в панике)
Нет, нет, нет! Что происходит?!''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex.png',
      backgroundImage: 'assets/images/nn_fair.png',
    ),
    StoryLine(
      text: '[Пытается отбросить монету, но она словно приросла к ладони. Свет становится ослепительным]',
      isNarration: true,
      backgroundImage: 'assets/images/nn_fair.png',
    ),
    StoryLine(
      text: '''(издалека)
Не бойся, племянник. Мы тебя ждем.''',
      character: 'Голос Бугрова',
      backgroundImage: 'assets/images/nn_fair.png',
    ),
    StoryLine(
      text: '[Вспышка белого света]',
      isNarration: true,
      backgroundImage: 'assets/images/nn_fair.png',
    ),

    //СЦЕНА 6: ПЕРЕХОД / ВСПЫШКА
    StoryLine(
      text: '[Головокружительное ощущение падения. Звуки современности исчезают. Возникают новые: конские копыта, скрип телег, крики торговцев на старорусском наречии]',
      isNarration: true,
      backgroundImage: 'assets/images/white_flash.png',
    ),
    
        //СЦЕНА 7: ЯРМАРКА 1885 ГОДА
    StoryLine(
      text: '[Саша падает на колени. Монета в руке гаснет, превращаясь в обычный потемневший пятак. Медленно поднимает голову]',
      isNarration: true,
      backgroundImage: 'assets/images/fair_cards.png',
    ),
    StoryLine(
      text: '[Вокруг — та же площадь, но совершенно другая. Вместо современных палаток — деревянные лавки и каменные корпуса. Мужчины в длиннополых кафтанах, женщины в платках и длинных платьях. Лошади, повозки. Запах навоза, свежего хлеба и дегтя]',
      isNarration: true,
      backgroundImage: 'assets/images/fair_cards.png',
    ),
    StoryLine(
      text: '''(шепотом, в шоке)
Господи... Я сошел с ума. Или...''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/fair_cards.png',
    ),
    StoryLine(
      text: '[Встает, оглядывается. Замечает свою одежду — она изменилась. Вместо джинсов и куртки — простой, но добротный купеческий костюм XIX века]',
      isNarration: true,
      backgroundImage: 'assets/images/fair_cards.png',
    ),
    StoryLine(
      text: '''(трогает одежду)
Это невозможно. Такого не бывает!''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/fair_cards.png',
    ),
    StoryLine(
      text: '''(сзади, реальный, громкий)
Александр Николаевич! Наконец-то!''',
      character: 'Голос Громова',
      backgroundImage: 'assets/images/fair_cards.png',
    ),
    StoryLine(
      text: '[Саша резко оборачивается. Перед ним стоит мужчина лет сорока в приказчичьем кафтане — строгое лицо, проницательные глаза, аккуратная борода. Это МИХАИЛ ГРОМОВ]',
      isNarration: true,
      backgroundImage: 'assets/images/fair_cards.png',
    ),
    StoryLine(
      text: '''(облегченно)
Слава Богу, вы услышали! Я уж думал, не успею достучаться. Идемте скорее, Николай Александрович велел вас сразу к себе вести, как только появитесь.''',
      character: 'Громов',
      // image: пока нет картинки
      backgroundImage: 'assets/images/fair_cards.png',
    ),
    StoryLine(
      text: '''(отступает)
Я... вы... кто вы? Где я?!''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/fair_cards.png',
    ),
    StoryLine(
      text: '''(озадаченно)
Михаил Громов, приказчик ваш. Неужто не узнаете? Александр Николаевич, вы себя хорошо чувствуете? Не ушиблись по дороге?''',
      character: 'Громов',
      // image: пока нет картинки
      backgroundImage: 'assets/images/fair_cards.png',
    ),
    StoryLine(
      text: '''Приказчик? Мой? Нет, вы не понимаете, я не...''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/fair_cards.png',
    ),
    StoryLine(
      text: '''(перебивает, встревоженно)
Времени нет на шутки! Беда большая у дядюшки вашего, у Николая Александровича. К вечеру — собрание купечества, а тут заговор против него. Вы же обещали помочь разобраться! Неужто забыли?''',
      character: 'Громов',
      // image: пока нет картинки
      backgroundImage: 'assets/images/fair_cards.png',
    ),

    //ист  справка про бугрова старшего
    StoryLine(
      text: '''(медленно)
Николай Александрович... Бугров?''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/fair_cards.png',
    ),
    StoryLine(
      text: '''Ну разумеется! Кто же еще? Дядюшка ваш, благодетель, хлебный король всего Поволжья! Идемте же, он вас ждет.''',
      character: 'Громов',
      // image: пока нет картинки
      backgroundImage: 'assets/images/fair_cards.png',
    ),
    StoryLine(
      text: '[Берет Сашу за локоть, ведет к Главному ярмарочному дому]',
      isNarration: true,
      backgroundImage: 'assets/images/fair_cards.png',
    ),
    StoryLine(
      text: '''(сам себе, оглушенно)
Я попал в прошлое? Николай Бугров. Я его племянник. Это... это реально происходит.''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/fair_cards.png',
    ),
    StoryLine(
      text: '''(через плечо)
Что говорите?''',
      character: 'Громов',
      // image: пока нет картинки
      backgroundImage: 'assets/images/fair_cards.png',
    ),
    StoryLine(
      text: '''(собирается с мыслями)
Ничего. Я... расскажите, что случилось?''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/fair_cards.png',
    ),
    StoryLine(
      text: '''(мрачнея)
Кто-то пустил слух, что мука дядюшки заражена спорыньей. Три крупных заказчика уже отказались от контрактов. А сегодня вечером решается судьба главного — с армией. Если и этот сорвется — конец. Разорение. А Николай Александрович столько добра людям сделал...''',
      character: 'Громов',
      // image: пока нет картинки
      backgroundImage: 'assets/images/fair_cards.png',
    ),
    StoryLine(
      text: '[Они поднимаются по ступеням Главного дома]',
      isNarration: true,
      backgroundImage: 'assets/images/fair_cards.png',
    ),
    StoryLine(
      text: '''(останавливается у входа, серьезно смотрит на Сашу)
Вы — единственная надежда, Александр Николаевич. У вас голова светлая, образование столичное. Дядюшка говорит — вы видите то, что другие не замечают. Найдите, кто за этим стоит. До вечерней службы в Спасском соборе. Иначе...''',
      character: 'Громов',
      // image: пока нет картинки
      backgroundImage: 'assets/images/fair_cards.png',
    ),
    StoryLine(
      text: '''(выпрямляется, кивает)
Я... я попробую.''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/fair_cards.png',
    ),
    ],
  ),

  Story(
    id: 'another_story',
    title: 'Соляная афера',
    coverImage: 'assets/images/background_story2_main_menu.png',
    lines: [
      StoryLine(
        text: 'Это начало второй истории',
        isNarration: true,
      ),
      StoryLine(
        text: 'что-то',
        character: 'Герой',
        //image: 'assets/images/hero.png',
        isMainHero: true,
      ),
    ],
  ),
];