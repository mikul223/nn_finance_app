import '../models/story_model.dart';

final List<Story> stories = [
  Story(
    id: 'alex_bugrov',
    title: 'Тайна Кармана',
    coverImage: 'assets/images/background_story1_main_menu.png',
    description: 'Стажёр Центробанка Александр Бугров получает от загадочной продавщицы старинную монету и переносится в 1885 год. Его дальний родственник, купец Николай Бугров, обвинён в продаже отравленной муки. У Саши есть всего несколько часов, чтобы разоблачить заговорщика и спасти честь семьи.',
    routePoints: 8,
    routeTime: 70,
    status: 'ready',
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
      image: 'assets/images/gromov.png',
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
      image: 'assets/images/gromov.png',
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
      image: 'assets/images/gromov.png',
      backgroundImage: 'assets/images/fair_cards.png',
    ),

    StoryLine(
      text: '''(медленно)
Николай Александрович... Бугров?''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/fair_cards.png',
    ),

    StoryLine(
      text: '', 
      isNarration: true,
      isInfoCard: true,
      infoTitle: 'Николай Александрович Бугров',
      infoDescription: 'Фигура в нижегородской истории легендарная и парадоксальная, а для вас, главного героя, ещё и родной дядя. Одни звали его «хлебным королём России», другие — «миллионером-босяком», и оба прозвища были правдой. Из старообрядческой семьи, вышедшей из удельных крестьян, он поднял мукомольное дело на такую высоту, что кормил хлебом всю армию империи, а на Всероссийской выставке получил право ставить на своих мешках государственный герб. Управлял огромным флотом и мельницами всего с двумя помощниками — приказчиком да бухгалтером, а рабочим установил восьмичасовой день и платил больше московского.',
      infoImage: 'assets/images/bugrov_real.png', 
      backgroundImage: 'assets/images/fair_cards.png',
    ),



    StoryLine(
      text: '''Ну разумеется! Кто же еще? Дядюшка ваш, благодетель, хлебный король всего Поволжья! Идемте же, он вас ждет.''',
      character: 'Громов',
      image: 'assets/images/gromov.png',
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
      image: 'assets/images/gromov.png',
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
      image: 'assets/images/gromov.png',
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
      image: 'assets/images/gromov.png',
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

    // ПЕРЕХОД К ТОЧКЕ 1
    StoryLine(
      text: '',
      isNarration: true,
      isInfoCard: true,
      infoTitle: 'Нижегородская ярмарка',
      infoDescription: 'Крупнейшая ярмарка Российской империи, которую называли «карманом России». Возникнув ещё в XVI веке у стен Макарьевского монастыря, после пожара 1816 года была перенесена в Нижний Новгород. Здесь вырос целый «город в городе» — 60 торговых корпусов, 2500 лавок, театры, цирк, гостиницы. Ежегодный оборот достигал 200 миллионов рублей — больше, чем на знаменитой Лейпцигской ярмарке. Сюда везли товары со всего света: английское сукно, немецкие станки, китайский чай, среднеазиатский хлопок. Именно здесь купцы заключали сделки, определявшие экономику всей страны, а ярмарочные банки задавали курс рубля.',
      infoImage: 'assets/images/first_article.png',
      backgroundImage: 'assets/images/fair_cards.png',
    ),

    StoryLine(
      text: '''Пройдемте. Дядюшка приготовил все документы — письма от заказчиков, образцы товаров, отчеты. Начнем с них.''',
      character: 'Громов',
      image: 'assets/images/gromov.png',
      backgroundImage: 'assets/images/fair_cards.png',
    ),
    
    // ТОЧКА 1: ГЛАВНЫЙ ЯРМАРОЧНЫЙ ДОМ — ГЕРБОВЫЙ ЗАЛ
    // СЦЕНА 8: ВСТРЕЧА С НИКОЛАЕМ БУГРОВЫМ

    StoryLine(
      text: '''Николай Александрович, привел племянника.''',
      character: 'Громов',
      image: 'assets/images/gromov.png',
      backgroundImage: 'assets/images/herald_hall.png', // Гербовый зал
    ),
    StoryLine(
      text: '[Бугров поднимает голову, внимательно смотрит на Сашу. Встает, подходит, берет за плечи]',
      isNarration: true,
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''(тихо, с напряжением)
Саша... Ты пришел. Спасибо.''',
      character: 'Николай Бугров',
      image: 'assets/images/bugrov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '[Обнимает его по-отечески. Саша застывает, не зная, как реагировать]',
      isNarration: true,
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''(кивает, возвращается к столу)
Времени мало, поэтому сразу к делу.''',
      character: 'Николай Бугров',
      image: 'assets/images/bugrov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''(тяжело вздыхает)
Двадцать лет строил я это дело. От трех мельниц до крупнейшего поставщика муки в Поволжье. Кормлю армию, монастыри, заводы. Тысячи людей на меня работают, тысячи — мой хлеб едят.
И вот — за три дня все рушится! Как карточный домик!''',
      character: 'Николай Бугров',
      image: 'assets/images/bugrov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''Громов рассказал про слухи... про спорынью.''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''(мрачно)
Не просто слухи. Три отказа. Три крупнейших заказчика. Смотри сам.''',
      character: 'Николай Бугров',
      image: 'assets/images/bugrov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '[Достает три письма, раскладывает перед Сашей]',
      isNarration: true,
      image: 'assets/images/bugrov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: 'Рукавишников, Блинов, Башкиров. Столпы купечества. Мои партнеры годами.',
      character: 'Николай Бугров',
      image: 'assets/images/bugrov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),

    StoryLine(
      text: '[Саша берет первое письмо — на плотной бумаге с тисненым гербом]',
      isNarration: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),

    // ПИСЬМО №1
    
    StoryLine(
      text: '',
      isNarration: true,
      backgroundImage: 'assets/images/letter_rukavishnikov.png',
    ),
    StoryLine(
      text: 'Господину Н.А. Бугрову. 15 июля 1880 года.',
      backgroundImage: 'assets/images/letter_rukavishnikov.png',
      character: 'Александр Бугров',

    ),
    StoryLine(
      text: 'Милостивый государь Николай Александрович! С прискорбием вынужден уведомить Вас о приостановке нашего договора на поставку 500 пудов пшеничной муки первого сорта для кондитерских заведений Торгового дома «М.Г. Рукавишников с сыновьями».',
      backgroundImage: 'assets/images/letter_rukavishnikov.png',
      character: 'Александр Бугров',

    ),
    StoryLine(
      text: 'До меня дошли весьма тревожные сведения о возможном заражении партии Вашей муки спорыньей. Как Вы понимаете, репутация моих заведений не позволяет мне рисковать здоровьем клиентов, даже если слухи окажутся беспочвенными.',
      backgroundImage: 'assets/images/letter_rukavishnikov.png',
      character: 'Александр Бугров',

    ),

    StoryLine(
      text: 'Контракт считаю расторгнутым до выяснения обстоятельств. С уважением, М.Г. Рукавишников',
      backgroundImage: 'assets/images/letter_rukavishnikov.png',
      character: 'Александр Бугров',
    ),

    StoryLine(
      text: '''(горько)
Михаил Григорьевич. Двенадцать лет с ним работаю. Ни одной претензии не было. И вдруг — «до меня дошли сведения». Откуда дошли? От кого?
И еще 2 письма с таким же содержанием.''',
      character: 'Николай Бугров',
      image: 'assets/images/bugrov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),

// ПИСЬМО №2
    StoryLine(
      text: '[Саша берет второе письмо — почерк более резкий, бумага попроще]',
      isNarration: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),

    StoryLine(
      text: '',
      isNarration: true,
      backgroundImage: 'assets/images/letter_blinov.png',
    ),
    StoryLine(
      text: 'Н.А. Бугрову. 16 июля 1880 года.',
      backgroundImage: 'assets/images/letter_blinov.png',
      character: 'Александр Бугров',
    ),
    StoryLine(
      text: 'Николай Александрович! Вынужден отказаться от закупки 800 пудов ржаной муки для пекарен Блиновского товарищества.',
      backgroundImage: 'assets/images/letter_blinov.png',
      character: 'Александр Бугров',
    ),
    StoryLine(
      text: 'На вчерашнем заседании Биржевого комитета господин Терентьев доложил о случаях отравления мукой с признаками спорыньи. Хотя Ваше имя напрямую не называлось, по срокам и объемам поставок несложно установить, о ком речь.',
      backgroundImage: 'assets/images/letter_blinov.png',
      character: 'Александр Бугров',
    ),
    StoryLine(
      text: 'Понимаю, что для Вас это удар, но я не могу рисковать здоровьем рабочих моих заводов. Честь дороже прибыли — это я усвоил раз и навсегда.',
      backgroundImage: 'assets/images/letter_blinov.png',
      character: 'Александр Бугров',
    ),
    StoryLine(
      text: 'Надеюсь на скорое разрешение ситуации. Ф.А. Блинов. ',
      backgroundImage: 'assets/images/letter_blinov.png',
      character: 'Александр Бугров',
    ),

    StoryLine(
      text: '''(настораживается)
Биржевой комитет? Господин Терентьев?''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''Иван Федорович Терентьев, секретарь комитета. Чиновник. Всегда был корректен. Но в этом письме... заметил?''',
      character: 'Николай Бугров',
      image: 'assets/images/bugrov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''«Ваше имя напрямую не называлось, но по срокам несложно установить». То есть кто-то специально подал информацию так, чтобы указать именно на вас, но формально не обвинять.''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''(одобрительно кивает)
Вот-вот. Тонко. Кто-то играет умно.''',
      character: 'Николай Бугров',
      image: 'assets/images/bugrov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),

    // ПИСЬМО №3
    StoryLine(
      text: '[Саша берет третье письмо — самое короткое, почерк нервный]',
      isNarration: true,
      backgroundImage: 'assets/images/herald_hall.png',
    ),

    StoryLine(
      text: '',
      isNarration: true,
      backgroundImage: 'assets/images/letter_bashkirov.png',
    ),
    StoryLine(
      text: 'Бугрову. 17 июля 1880 года.',
      backgroundImage: 'assets/images/letter_bashkirov.png',
      character: 'Александр Бугров',
    ),
    StoryLine(
      text: 'Расторгаю договор на 300 пудов муки. Получил официальное предупреждение от санитарного надзора о необходимости проверки поставщиков. Ваше имя было названо первым.',
      backgroundImage: 'assets/images/letter_bashkirov.png',
      character: 'Александр Бугров',
    ),
    StoryLine(
      text: 'Разбирайтесь сами. Башкиров.',
      backgroundImage: 'assets/images/letter_bashkirov.png',
      character: 'Александр Бугров',
    ),


    StoryLine(
      text: '''(мрачно)
Дмитрий Башкиров... От него можно было такое ожидать. Это письмо — самое важное.''',
      character: 'Николай Бугров',
      image: 'assets/images/bugrov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''Почему?''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''«Официальное предупреждение от санитарного комитета». Это уже не слухи. Это документ. Значит, кто-то пробрался в официальные структуры.''',
      character: 'Николай Бугров',
      image: 'assets/images/bugrov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''(от двери)
Или подкупил чиновника.''',
      character: 'Громов',
      image: 'assets/images/gromov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''(задумчиво складывает письма)
Смотрите на даты. 15-е, 16-е, 17-е июля. Три дня подряд. Три письма. Но...
Если слухи о заражении появились недавно, то образцы муки они должны были брать раньше. Значит, отказы пришли слишком быстро. Слишком синхронно.''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''(восхищенно)
Точно! Я об этом думал, но не мог сформулировать. Это организованная атака.''',
      character: 'Николай Бугров',
      image: 'assets/images/bugrov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''А контракт с армией?''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''(тяжело)
Сегодня вечером. Собрание купечества. Представитель военного ведомства будет. Если до того времени не докажу, что мука чиста — потеряю контракт на 50 тысяч рублей. Это... это конец, Саша.''',
      character: 'Николай Бугров',
      image: 'assets/images/bugrov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''(тяжело)
Мне уже сорок восемь. Три жены в могиле, трое детей. Одно дело осталось — помогать людям. Ночлежки, столовые, больницы... Все на эти деньги. Если разорюсь — тысячи останутся без помощи.''',
      character: 'Николай Бугров',
      image: 'assets/images/bugrov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''(твердо)
Не разоритесь. Я найду, кто за этим стоит.''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''(поднимает глаза, в них надежда)
Ты всегда был умнее других, племянник. Поможешь старику?''',
      character: 'Николай Бугров',
      image: 'assets/images/bugrov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''Помогу. Что нужно сделать?''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''(встает, деловито)
Первое — проверь склады, где хранится моя мука. Поговори с контролерами, смотрителем. Убедись, что с товаром все в порядке.''',
      character: 'Николай Бугров',
      image: 'assets/images/bugrov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''Там Семен Палыч заведует, Семен Кротов. Нервный он стал последнее время, но работящий.''',
      character: 'Громов',
      image: 'assets/images/gromov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''Второе — пообщайся с заказчиками. Рукавишникова найдешь в его усадьбе на Верхне-Волжской набережной. Блинова — в его пассаже. Башкирова... ну, этого трогать не стоит.''',
      character: 'Николай Бугров',
      image: 'assets/images/bugrov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''А что со свидетелями? Кто мог распространять слухи?''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''Громов говорит, последняя проверка муки была в Спасском соборе. Церковный староста освящал товар перед отправкой. Может, он что-то видел.''',
      character: 'Николай Бугров',
      image: 'assets/images/bugrov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''Отец Серафим. Честный человек, не подкупишь.''',
      character: 'Громов',
      image: 'assets/images/gromov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''(подходит к Саше, кладет руку на плечо)
У тебя до вечерней службы. Часов восемь. Найди источник слухов, докажи, что мука чиста, и приведи мне имя злодея. Сможешь?''',
      character: 'Николай Бугров',
      image: 'assets/images/bugrov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''(кивает)
Постараюсь.''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''Громов, дай племяннику образцы муки, копии писем, пропуск на склады.''',
      character: 'Николай Бугров',
      image: 'assets/images/bugrov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''Будет исполнено, Николай Александрович.''',
      character: 'Громов',
      image: 'assets/images/gromov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''(Саше)
Иди. И помни — время не ждет. К шести вечера все решится.''',
      character: 'Николай Бугров',
      image: 'assets/images/bugrov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''(вслед, тихо)
Саша... Спасибо, что вернулся. Кровь не обманешь. Ты — настоящий Бугров.''',
      character: 'Николай Бугров',
      image: 'assets/images/bugrov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    // СЦЕНА 9: ПОЛУЧЕНИЕ КВЕСТА
    StoryLine(
      text: '[ Громов передает Саше кожаную папку с документами]',
      isNarration: true,
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''Здесь все: копии писем, пропуск на склады, описание партий муки. Куда пойдете сначала?''',
      character: 'Громов',
      image: 'assets/images/gromov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''Нужно подумать. Анализ данных...''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''(не понимает)
Какой анализ?''',
      character: 'Громов',
      image: 'assets/images/gromov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''Я хочу сказать — нужно внимательно изучить письма, найти закономерности. Понять, кто мог координировать атаку.''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''Вот это по-нашему! Идемте, покажу вам карту ярмарки и расскажу, где кого искать.''',
      character: 'Громов',
      image: 'assets/images/gromov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),

    //кадр с картой, какой картой? старой, новой, нашего маршрута?
    StoryLine(
      text: '[Они проходят в небольшую контору, где на стене висит план города]',
      isNarration: true,
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''Понял. Начну с проверки данных в письмах.''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''Помогу, чем смогу…''',
      character: 'Громов',
      image: 'assets/images/gromov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),

        // СЦЕНА 8: ВЫБОР СТРАТЕГИИ РАССЛЕДОВАНИЯ
    StoryLine(
      text: '[Коридор Главного ярмарочного дома. Громов передает Саше кожаную папку с документами]',
      isNarration: true,
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''Здесь все: копии писем, пропуск на склады, описание партий муки. С чего начнем, Александр Николаевич?''',
      character: 'Громов',
      image: 'assets/images/gromov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''(изучает документы)
Нужно понять логику. Если мука действительно заражена — это выяснится на складах. Если нет — значит, кто-то подменил образцы между хранением и проверкой.''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''Верно рассуждаете. Я бы предложил сразу на пакгаузы — там смотритель Семен Палыч все образцы хранит. Проверим товар, поговорим с ним.''',
      character: 'Громов',
      image: 'assets/images/gromov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''Разумно. Но...''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''Уж недавно мы муку ведь освещали в Спасском соборе..''',
      character: 'Громов',
      image: 'assets/images/gromov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''Точно! Церковный староста мог что-то видеть.''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''(кивает)
Отец Серафим. Честный человек, глаз острый. Если что неладное было — он заметил бы.''',
      character: 'Громов',
      image: 'assets/images/gromov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''Сколько времени займет дойти до собора?''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''Да минут десять пешком. Он на главной оси ярмарки стоит, не заблудитесь. А до пакгаузов — столько же, только в другую сторону, к Сибирской пристани.''',
      character: 'Громов',
      image: 'assets/images/gromov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''Так как, Александр Николаевич? Куда направимся?''',
      character: 'Громов',
      image: 'assets/images/gromov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    
    // ВАРИАНТ А: ИДТИ В СПАССКИЙ СОБОР
    StoryLine(
      text: '''Пойду сначала к старосте. Если он что-то видел при освящении — это может дать зацепку, кто стоит за заговором.''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    StoryLine(
      text: '''Разумно. Отец Серафим всегда на месте, после утренней службы в алтаре прибирается. Пойдемте, провожу.''',
      character: 'Громов',
      image: 'assets/images/gromov.png',
      backgroundImage: 'assets/images/herald_hall.png',
    ),
    
    // ТОЧКА 2: СПАССКИЙ СТАРОЯРМАРОЧНЫЙ СОБОР
    // СЦЕНА 9: ПУТЬ К СОБОРУ

// ПРОСТО ТЕКСТ, ВЫБОРА ПОКА НЕТ!!!

    StoryLine(
      text: '[Саша и Громов идут по главной аллее ярмарки. Вокруг — каменные торговые корпуса, купцы зазывают покупателей, грузчики таскают тюки]',
      isNarration: true,
      backgroundImage: 'assets/images/fair_cards.png',
    ),
    StoryLine(
      text: '''(показывает вперед)
Вон он, Спасский собор. Видите купола?''',
      character: 'Громов',
      image: 'assets/images/gromov.png',
      backgroundImage: 'assets/images/fair_cards.png',
    ),
    StoryLine(
      text: '[Впереди возвышается величественный белокаменный храм с пятью золотыми куполами. Классические колонны, строгие пропорции]',
      isNarration: true,
      backgroundImage: 'assets/images/old_fair_spassky_cathedral.jpg',
    ),
    StoryLine(
      text: '''(восхищенно)
Красиво... Монументально.''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/old_fair_spassky_cathedral.jpg',
    ),
    StoryLine(
      text: '''Огюст Монферран проектировал, француз. Тот самый, что Исаакиевский собор в Петербурге строил. Здесь, правда, попроще, но тоже с размахом.''',
      character: 'Громов',
      image: 'assets/images/gromov.png',
      backgroundImage: 'assets/images/old_fair_spassky_cathedral.jpg',
    ),
    StoryLine(
      text: '''Монферран... Когда построен?''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/old_fair_spassky_cathedral.jpg',
    ),
    StoryLine(
      text: '''Лет шестьдесят назад, как ярмарку из Макарьева сюда перенесли. Августин Бетанкур, испанец, весь ярмарочный комплекс спроектировал, а Монферрана для собора пригласил.''',
      character: 'Громов',
      image: 'assets/images/gromov.png',
      backgroundImage: 'assets/images/old_fair_spassky_cathedral.jpg',
    ),
    StoryLine(
      text: '[Подходят ближе. Саша рассматривает архитектуру]',
      isNarration: true,
      backgroundImage: 'assets/images/old_fair_spassky_cathedral.jpg',
    ),
    StoryLine(
      text: '''А почему «Староярмарочный»?''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/old_fair_spassky_cathedral.jpg',
    ),
    StoryLine(
      text: '''Так ведь прежде ярмарка в Макарьевском монастыре была, у стен Макарьевского Желтоводского монастыря. Там тоже Спасский собор стоял. Когда ярмарку сюда перенесли, новый храм в честь старого назвали. Память, значит.''',
      character: 'Громов',
      image: 'assets/images/gromov.png',
      backgroundImage: 'assets/images/old_fair_spassky_cathedral.jpg',
    ),
    StoryLine(
      text: '''Понятно. А купцы часто сюда приходят?''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/old_fair_spassky_cathedral.jpg',
    ),
    StoryLine(
      text: '''(усмехается)
Как же без этого! Перед началом торгов все съезжаются — товар освящать. Без божьего благословения торговать — дело неправедное, грех. Старообрядцы особенно строги в этом.''',
      character: 'Громов',
      image: 'assets/images/gromov.png',
      backgroundImage: 'assets/images/old_fair_spassky_cathedral.jpg',
    ),
    StoryLine(
      text: '''Дядюшка — старообрядец?''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/old_fair_spassky_cathedral.jpg',
    ),
    StoryLine(
      text: '''Беглопоповец. Вся семья Бугровых такая. И Блиновы, и Рукавишниковы — все старой веры.''',
      character: 'Громов',
      image: 'assets/images/gromov.png',
      backgroundImage: 'assets/images/old_fair_spassky_cathedral.jpg',
    ),
    StoryLine(
      text: '[Подходят к входу. У дверей — отец СЕРАФИМ, церковный староста. Мужчина лет шестидесяти, седая борода до груди, добрые морщинистые глаза, длинный темный кафтан]',
      isNarration: true,
      backgroundImage: 'assets/images/old_fair_spassky_cathedral.jpg',
    ),
    StoryLine(
      text: '''Отец Серафим, здравия желаем!''',
      character: 'Громов',
      image: 'assets/images/gromov.png',
      backgroundImage: 'assets/images/old_fair_spassky_cathedral.jpg',
    ),
    StoryLine(
      text: '''(поворачивается, кланяется)
Господь с вами, Петр Иванович. Что за гости в неурочный час?''',
      character: 'Отец Серафим',
      image: 'assets/images/seraphin.png',
      backgroundImage: 'assets/images/old_fair_spassky_cathedral.jpg',
    ),
    StoryLine(
      text: '''Это Александр Николаевич Бугров, племянник Николая Александровича. Дело у него к вам есть.''',
      character: 'Громов',
      image: 'assets/images/gromov.png',
      backgroundImage: 'assets/images/old_fair_spassky_cathedral.jpg',
    ),
    StoryLine(
      text: '''(внимательно смотрит на Сашу, прищуривается)
Бугров-младший... Слышал о вас. Образование столичное получили, говорят. В Москве учились?''',
      character: 'Отец Серафим',
      image: 'assets/images/seraphin.png',
      backgroundImage: 'assets/images/old_fair_spassky_cathedral.jpg',
    ),
    StoryLine(
      text: '''(осторожно)
Да, учился... в Москве.''',
      character: 'Александр Бугров',
      isMainHero: true,
      image: 'assets/images/alex2.png',
      backgroundImage: 'assets/images/old_fair_spassky_cathedral.jpg',
    ),
    StoryLine(
      text: '''(кивает)
Видно по вам. Глаза умные, речь правильная. Не то что наши купчики — те больше по лавкам да счетам. Проходите в храм, поговорим.''',
      character: 'Отец Серафим',
      image: 'assets/images/seraphin.png',
      backgroundImage: 'assets/images/old_fair_spassky_cathedral.jpg',
    ),


    ],
  ),

  Story(
    id: 'another_story',
    title: 'Соляная афера',
    coverImage: 'assets/images/background_story2_main_menu.png',
    description: '',
    routePoints: 0,
    routeTime: 0,
    status: 'development',
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