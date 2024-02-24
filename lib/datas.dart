import 'question.dart';

class DatasFacile {

  List<Question> listeQuestions = [
    Question(question: "Il faut manger 5 fruits + 5 légumes par jour ?", reponse: true, explication: 'C’est la quantité recommandée qui est de 5 fruits et légumes par jour.'),
    Question(question: "Le sucre fait partie de la famille des glucides ?", reponse: true, explication: "Les sucres rentrent dans la grande famille des glucides"),
    Question(question: "Certains sucres peuvent être dangereux pour ma santé, si j’en consomme trop ?", reponse: true, explication: "Les sucres présents dans les bonbons, les viennoiseries, les glaces, les gâteaux entrainent une forte augmentation du sucre dans le sang"),
    Question(question: "Une pizza industrielle peut contenir jusqu’à l’équivalent de 20 morceaux de sucre ?", reponse: true, explication: "Il se cache surtout dans les plats industriels et les plats préparés commeles pizzas, les hamburgers, mais également dans la charcuterie et les chips."),
    Question(question: "Deux barres chocolatées contiennent l’équivalent de 5 morceaux de sucre ?", reponse: false, explication: "10 morceaux de sucre !"),
    Question(question: "Une portion de fruits et de légumes correspond à un poing ?", reponse: true, explication: ""),
    Question(question: "Un jus de fruit en brique peut remplacer une portion de fruit ?", reponse: false, explication: "Seuls les jus de fruits frais, pressés ou mixés (smoothies) peuvent compter comme une portion de fruits."),
    Question(question: "La compote peut remplacer une portion de fruits ?", reponse: true, explication: "A condition que celle-ci soit « sans sucres ajoutés » ou faite maison."),
    Question(question: "Il est conseillé de manger des produits laitiers 2 à 3 fois par jour ?", reponse: true, explication: "Une portion de lait équivaut environ à une grand tasse (à petit déjeuner), une portion de yaourt à la grosseur d’un poing et une portion de fromage à deux doigts (l’index et le majeur)"),
    Question(question: "Une collation le matin entre le petit déjeuner et le déjeuner est importante ?", reponse: false, explication: "La prise d’une collation en cours de matinée sous forme de lait a été instaurée dans les écoles maternelles au lendemain de la seconde guerre mondiale afin de pallier aux déficits d’apports en calcium."),
    Question(question: "Les protéines sont indispensables dans le développement des muscles ?", reponse: true, explication: "Les protéines sont les « briques » de l’organisme. Elles permettent de fabriquer les muscles, les os, les cheveux, les ongles, la peau… tous les organes mais aussi les hormones, les enzymes et les anticorps…"),
    Question(question: "Les protéines sont présentes en grande quantité dans la viande.", reponse: true, explication: ""),
    Question(question: "Les protéines sont présentes en grande quantité dans les haricots.", reponse: true, explication: ""),
    Question(question: "Les protéines sont présentes en grande quantité dans les amandes.", reponse: true, explication: ""),
    Question(question: "Les protéines sont présentes en grande quantité dans les kiwis.", reponse: false, explication: "C’est surtout la Vitamine C qui est présente dans le kiwi !"),
    Question(question: "Manger des bonbons, c’est interdit ?", reponse: false, explication: "Il faut juste en manger occasionnellement, car ils contiennent beaucoup de sucre."),
    Question(question: "'PC' signifie: 'Personal Computer'.", reponse: true, explication: ""),
    Question(question: "Le 'CPU' est le synonyme de carte graphique.", reponse: false, explication: "CPU signifie Central Processing Unit"),
    Question(question: "Un 'pourriel' est l'appellation française d'un spam.", reponse: true, explication: ""),
    Question(question: "Le câble reliant généralement l'écran à l'Unité Centrale est appelé: 'câble VGA'.", reponse: true, explication: ""),
    Question(question: "Lady Gaga est née en 2002.", reponse: false, explication: "elle est née le 28 mars 1986."),
    Question(question: "Un orchestre symphonique est un ensemble musical formé de trois instruments.", reponse: true, explication: ""),
    Question(question: "Il y a plusieurs styles de musiques (musique classique, rap, pop,...).", reponse: true, explication: ""),
    Question(question: "Lady Gaga s'appelle en réalité Stefani Joanne Angelina Germanotta.", reponse: true, explication: "Son vrai nom est Stefani Joanne Angelina Germanotta"),
    Question(question: "Le chanteur 'The Weeknd' a eu 31 ans en 2021.", reponse: true, explication: ""),


  ];

}


class DatasNormale {

  List<Question> listeQuestions = [
    Question(question: "La Carte Graphique est une mémoire de masse magnétique.", reponse: false, explication: "la carte graphique n'est pas une forme de mémoire de masse magnétique, mais plutôt un composant matériel spécialisé conçu pour traiter et afficher des graphismes sur un écran d'ordinateur."),
    Question(question: "1Ko est égal à 2024 octects.", reponse: false, explication: "C'est 1024 octets"),
    Question(question: "La mémoire morte est non nécessaire dans un pc.", reponse: false, explication: "La mémoire morte (ROM) est nécessaire dans un PC pour stocker les instructions de démarrage (BIOS/UEFI) et d'autres données essentielles en lecture seule."),
    Question(question: "Un clavier 'AZERTY' est un clavier alphanumérique.", reponse: true, explication: ""),
    Question(question: "Dans un 'fichier PDF' le 'PDF' signifie: Portable document format.", reponse: true, explication: ""),
    Question(question: "Un bit est égal à 16 couleurs.", reponse: false, explication: "Un bit ne peut représenter que 2 valeurs distinctes, donc pour représenter 16 couleurs différentes, il faut au moins 4 bits (2^4 = 16)."),
    Question(question: "Au moins, avec l’alcool il n’y a pas d’overdose?", reponse: false, explication: "L’overdose d’alcool existe. L’absorption d’une forte dose d’alcool peut provoquer des comas éthyliques, qui nécessitent une hospitalisation immédiate. La personne risque la mort par arrêt respiratoire"),
    Question(question: "L’alcool fait grossir ?", reponse: true, explication: "L’alcool apporte 7 Kcal par gramme d’alcool, soit environ 70 Kcal par verre de vin. De plus, l’alcool favorise le stockage des graisses"),
    Question(question: "L’alcool réchauffe et stimule ?", reponse: false, explication: "La sensation de chaleur provient de la dilatation des vaisseaux sanguins et l’afflux de sang à la périphérie du corps. La chaleur produite ici s’échappe par les pores de la peau (cause une déperdition de chaleur)"),
    Question(question: "L’alcool hydrate…Ex : une bière en été va m’hydrater….?", reponse: false, explication: "l’alcool fait uriner davantage et provoque une déshydratation qui est à l’origine de l’effet « gueule de bois »."),
    Question(question: "Les hommes supportent mieux l’alcool que les femmes ?", reponse: true, explication: "Les femmes sont en général plus petites et moins corpulentes que les hommes. De plus, l’organisme des femmes contient proportionnellement plus de graisses que celui d’un homme. L’alcool ne se diluant pas dans les graisses, le volume dans lequel l’alcool se répartit est donc plus faible chez les femmes."),
    Question(question: "L’alcool augmente la libido ?", reponse: false, explication: "L’alcool perturbe l’érection chez l’homme et atténue le plaisir chez la femme."),
    Question(question: "Dilué dans du coca ou avec du glaçons, l’alcool est moins fort ? ", reponse: false, explication: "Que l’on ajoute un glaçon ou non, la dose d’alcool reste la même (environ 10 g d’alcool pur pour un verre standard)"),
    Question(question: "Le café ou la douche dessaoule…?", reponse: false, explication: "Cela procure la sensation d’être réveillé(e) mais ce n’est qu’une illusion."),
    Question(question: "Seul le temps permet d’éliminer l’alcool.", reponse: true, explication: "L’alcoolémie commence à baisser 1h après le dernier verre et il faut compter 1h30 environ pour éliminer chaque verre d’alcool"),
    Question(question: "Est-il préférable de boire de l’alcool avec des boissons énergisantes ?", reponse: false, explication: "Les boissons énergisantes diminuent la perception des effets de l’alcool, ce qui peut entraîner une consommation excessive."),
    Question(question: "Le cannabis est une drogue douce…?", reponse: false, explication: "Il n’y a pas de drogue dure ou douce…"),
    Question(question: "En consommant du cannabis on peut contracter le sida?", reponse: false, explication: "Le cannabis n’existe pas sous forme injectable et donc n’a pas de risque Infectieux majeur."),
    Question(question: "En choisissant bien son charbon la fumée de chicha est moins toxique.", reponse: false, explication: "La fumée de la chicha est liée essentiellement à la combustion du tabac, la part de la fumée du charbon est infime"),
    Question(question: "La fumée de chicha est moins dangereuse que celle de la cigarette", reponse: false, explication: "La combustion est plus douce mais moins complète, ce qui génère un dégagement en plus grande quantité de certains toxiques comme le monoxyde de carbone, que la cigarette."),
    Question(question: "Il y a un risque de dépendance lorsqu’on fume la chicha.", reponse: true, explication: "La fumée du tabac à chicha comme celle des cigarettes, crée et entretient une dépendance à cause de la nicotine qu’il contient, même si une partie de la nicotine est retenue dans l’eau."),
    Question(question: "l n’y a aucun danger à fréquenter les lieux où l’on fume de la chicha sans consommer", reponse: false, explication: "La consommation de chicha entraîne l’augmentation de CO (monoxyde de carbone, gaz toxique) dans l’air ambiant. Une exposition d’1 heure équivaut pour un non-fumeur à une consommation 6 à 8 cigarettes."),
    Question(question: "La baleine bleue est le plus grand animal marin retrouvé dans l'eau .", reponse: false, explication: "La baleine bleue est le plus grand animal marin actuel, mais pas le plus grand de tous les temps, car certains reptiles marins préhistoriques, comme les plésiosaures et les ichtyosaures, étaient plus grands."),
    Question(question: "Les crocodiles préhistoriques pouvaient mesurer plus de 14 mètres .", reponse: true, explication: ""),
    Question(question: "Certaines personnes auraient retrouvé des singes aux Pôle Sud avec beaucoup de poils .", reponse: false, explication: "Les singes n'habitent pas naturellement les régions polaires en raison de leurs adaptations biologiques et de leur évolution dans des environnements plus chauds."),
    Question(question: "Une reine d'Égypte s'est fait tuer par un hippopotame .", reponse: true, explication: ""),
    Question(question: "Le plus grand serpent est le python royal .", reponse: false, explication: "Le python royal n'est pas le plus grand serpent en termes de longueur, car le python réticulé détient ce titre, étant capable d'atteindre des tailles plus importantes"),
    Question(question: "L'Amérique du Sud est l'une des régions les plus touchées par les serpents .", reponse: false, explication: "L'Amérique du Sud, bien qu'abritant une grande diversité de serpents, n'est pas parmi les régions les plus touchées par les serpents en raison de sa faible densité de population humaine par rapport à d'autres régions du monde et de l'habitat diversifié qui permet une coexistence plus facile avec ces animaux"),
    Question(question: "Le taïpan est le serpent le plus dangereux au monde .", reponse: true, explication: ""),
    Question(question: "La veuve noire est l'araignée la plus dangereuse au monde .", reponse: true, explication: ""),
    Question(question: "Maluma est un chanteur japonais.", reponse: false, explication: "Il est colombien"),
    Question(question: "Britney Spears est une actrice américaine.", reponse: true, explication: "Elle est actrive américaine"),
    Question(question: "Jean Dujardin a déjà eu le César du meilleur acteur :", reponse: false, explication: "Il ne l'a jamais eu"),
    Question(question: "Steven Speilberg a réalisé le film ''Avatar'' :", reponse: false, explication: "C'est James Cameron"),
    Question(question: "Le cinéma a été inventé par des français :", reponse: true, explication: "Par les Frères Lumières"),

  ];

}


class DatasAvancer {

  List<Question> listeQuestions = [
    Question(question: "Le mille pattes a mille pattes ?", reponse: false, explication: "Le nom 'mille-pattes' est une hyperbole, car bien que ces arthropodes possèdent de nombreuses pattes, ils n'en ont généralement pas mille."),
    Question(question: "L'aigle est l'oiseau ayant la plus grande envergure .", reponse: false, explication: "L'albatros royal possède la plus grande envergure parmi tous les oiseaux, dépassant celle de l'aigle."),
    Question(question: "Le papillon a une trompe .", reponse: true, explication: "Le papillon possède une trompe, appelée proboscis, qui lui permet de se nourrir en aspirant le nectar des fleurs, une source importante de nutriments pour lui."),
    Question(question: "Le singe est un animal doux et pas féroce .", reponse: false, explication: "Les singes ont des comportements variés selon l'espèce et les circonstances, pouvant être à la fois territoriaux et sociables, mais ne sont généralement pas considérés comme naturellement doux ou féroces."),
    Question(question: "La giraffe est un animal doux et pas féroce .", reponse: true, explication: ""),
    Question(question: "La giraffe est un animal doux et pas féroce .", reponse: true, explication: ""),
    Question(question: "On peut charmer les serpents .", reponse: false, explication: "Les serpents ne peuvent être charmes par une mélodie ou une flûte car ils sont dépourvus d'oreilles externes et n'entendent pas les sons de la même manière que les humains."),
    Question(question: "Des gens sur la Terre ont depuis leur naissance vécu avec des animaux pendant plusieurs années.", reponse: true, explication: ""),
    Question(question: "La tarentule est la plus grande araignée .", reponse: false, explication: "La tarentule n'est pas la plus grande araignée, bien que souvent perçue comme telle, car certaines espèces, telles que la mygale Goliath, sont plus grandes en taille corporelle."),
    Question(question: "Les dinosaures sont les premiers animaux sur Terre .", reponse: false, explication: "Les dinosaures ne sont pas les premiers animaux sur Terre, car ils sont apparus relativement tard dans l'histoire de la vie sur Terre, bien après l'apparition des premiers animaux comme les invertébrés marins."),
    Question(question: "Le perroquet est l'animal le plus intelligent du monde .", reponse: false, explication: "Les perroquets ne sont pas considérés comme les animaux les plus intelligents du monde, bien qu'ils aient des capacités cognitives impressionnantes, d'autres espèces comme les grands singes, les dauphins et les éléphants démontrent également une grande intelligence."),
    Question(question: "La tortue peut vivre jusqu'à 200 ans .", reponse: true, explication: ""),
    Question(question: "Les animaux marins sont l'espèce la plus nombreuse .", reponse: false, explication: "Les animaux marins ne sont pas l'espèce la plus nombreuse sur Terre, car les insectes terrestres représentent la majorité des espèces et des individus sur notre planète."),
    Question(question: "Un loup est capable de tuer un homme d'un coup de patte .", reponse: false, explication: "Les loups ne sont généralement pas capables de tuer un homme d'un coup de patte, car ils n'ont pas la force physique ou les comportements de chasse nécessaires pour s'attaquer à des proies de cette taille."),
    Question(question: "La hyène est l'animal ayant la plus puissante machoire .", reponse: true, explication: ""),
    Question(question: "Certains chiens de course peuvent courrir à plus de 120km/h. Ce qui est plus rapide qu'un guépard .", reponse: false, explication: "Cette vitesse est bien au-delà de la capacité physique de tous les chiens et dépasse même celle du guépard, considéré comme l'animal terrestre le plus rapide, capable de courir jusqu'à environ 100 km/h sur de courtes distances."),
    Question(question: "On a fait un croisement entre un lion et un loup ?", reponse: false, explication: "Il n'existe aucun croisement documenté entre un lion et un loup dans la nature en raison de leur éloignement géographique, de leurs comportements sociaux différents et de leurs cycles de reproduction distincts."),
    Question(question: "Sur une montagne, on aurait découvert des anacondas de plus de 20 mètres .", reponse: true, explication: ""),
    Question(question: "Le basilic est un serpent habitant au Brésil .", reponse: false, explication: "Il s'agit d'un animal légendaire issu du folklore européen, représenté comme un reptile monstrueux avec une tête de coq et un corps de serpent."),
    Question(question: "On entend dire qu'il y a des poissons qu'on ne peut pas voir car ils sont au fond de l'océan. Certains sont plus gros qu'une baleine .", reponse: true, explication: ""),
    Question(question: "Il y a eu des combats entre lion et tigre .", reponse: true, explication: ""),
    Question(question: "Le loup est un canidé ?", reponse: true, explication: "Canidé: Mammifère carnivore digitigrade, au museau allongé, aux pattes hautes, ayant quatre doigts derrière, et cinq devant (famille des Canidés ; ex. le loup, le renard, le chacal)."),
    Question(question: "Dans le cocktail Cosmopolitan, trouve-t-on de la vodka ?", reponse: true, explication: ""),
    Question(question: "Le numéro 54 correspond-il au département de la Moselle ?", reponse: false, explication: "C'est la Meurthe-et-Moselle."),
    Question(question: "La chanteuse Jennifer Lopez est-elle née au Brésil ?", reponse: false, explication: "Elle est née à New York en 1969."),
    Question(question: "La Coupe du monde de rugby à XV a-t-elle été gagnée par la Nouvelle-Zélande en 2022 ?", reponse: false, explication: "C'est l'Afrique du Sud qui a remporté cette Coupe du monde pour la 5e fois dans son histoire."),
    Question(question: "Le massif montagneux des Dolomites se situe-t-il en Italie ?", reponse: true, explication: "Nord de l'Italie, il abrite de nombreux lacs."),
    Question(question: "Dans une année, trouve-t-on deux mois commençant par la lettre 'F' ?", reponse: false, explication: "Il y a juste le mois de Février."),
    Question(question: "Le roman 'La mare au diable' a-t-il été écrit par George Sand ?", reponse: true, explication: "Il fut publié en 1846."),
    Question(question: "En 1999, Britney Spears a-t-elle chanté '(You Drive Me) Crazy' ?", reponse: true, explication: ""),
    Question(question: "'Je t'aime' est un des derniers titres de Katy Perry :", reponse: false, explication: "C'est 'Bon Appétit', qui d'ailleurs est un très bon titre !"),
    Question(question: "L'octobasse peut avoir une taille de 4 mètres :", reponse: true, explication: "L'octobasse est l'instrument à corde fournissant le son le plus grave. D'une hauteur de près de 4 mètres, il ne contient que 3 cordes contrairement à la contrebasse qui en possède 4 ou 5. Le son produit est d'autant plus puissant que la caisse de résonance de l'octobasse est d'une taille impressionnante."),
    Question(question: "L'Orgue de la mer est une sculpture sonore localisée en Croatie :", reponse: true, explication: "Sous de larges marches de marbre au bord de la mer sont creusés des tubes dans lesquels l'engouffrement des vagues provoque des sons résonnants. "),
    Question(question: "Le festival Iceland Airwaves se passe dans l'océan :", reponse: false, explication: "Il se passe dans la célèbre station thermale Blue Lagoon. L'eau de l'océan est bien trop froide !"),
    Question(question: "Il existe un festival de musique sous l'eau", reponse: true, explication: " En réalité, de la musique est bel et bien diffusée, mais depuis la terre, et elle est ensuite retransmise sous l'eau à l'aide d'enceintes spéciales qui propagent les ondes et les vagues de son sous l'eau."),
    Question(question: "'Waka Waka' de Shakira est sorti à l'occasion de la coupe du Monde de football de 2014 :", reponse: false, explication: "C'était pour la coupe du Monde en Afrique du sud, d'ailleurs le nom entier de la musique est Waka Waka (This time for Africa)"),
    Question(question: "Les premières traces de musiques remontent à plus de 150 000 ans :", reponse: false, explication: " La musique fait partie intégrante de notre Histoire. En effet, des traces d'instruments de musique remontent à plus de 37 000 ans."),
    Question(question: "En 1919 a été créé un instrument permettant de jouer sans les mains :", reponse: false, explication: "En 1919 a été créé un instrument qui fait de la musique grâce à 2 antennes, il se nomme le thérémine."),
    Question(question: "Le putatara est un instrument maori :", reponse: true, explication: "C'est une conque fixée à un embout en bois et dans laquelle on souffle. Cet instrument peut imiter le chant des baleines."),
    Question(question: "Justin Bieber était connu à partir de l'âge de 12 ans.", reponse: true, explication: "C'est à l'âge de 12 ans"),
  ];

}

