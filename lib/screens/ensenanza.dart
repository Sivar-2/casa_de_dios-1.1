import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class EnsenanzaScreen extends StatefulWidget {
  const EnsenanzaScreen({super.key});

  @override
  State<EnsenanzaScreen> createState() => _EnsenanzaScreenState();
}

class _EnsenanzaScreenState extends State<EnsenanzaScreen> {
  // ===========================================================================
  // LISTA DE 10 PRÉDICAS MANUALES
  // ===========================================================================
  final List<Map<String, dynamic>> _predicasManuales = [
    {
      "id": "1",
      "titulo": "¿Cómo te quedó el ojo? ",
      "descripcion": "En el saber popular, tener un buen ojo es poseer un cojunto de habilidades cognitivas y estandares, que se manifiestan en diversas tareas y contextos.",
      "autor": "Pastor Juan Diego Luna",
      "bio": "Predicador y líder de jóvenes. Hijo de los pastores Cash y Sonia Luna de Casa de Dios, Guatemala. Sígueme en Twitter: http://x.com/juandiegoluna.",
      "videoUrl": "https://youtu.be/rZs_b8F4Anc",
      "progreso": 0.5,
      "thumbnail": "assets/images/ojo.jpg",
      "escrito": """Jesús enseña cómo el ojo tiene una función importante para que haya luz o tinieblas en nuestra vida y explica la relevancia de tener luz habitando nuestro cuerpo. Pero lo hace desde un contexto de comparación con el tesoro que puede dar la riqueza.  Al profundizar, deja claro que el tema principal es la relación de tu corazón con las riquezas.[1]

Entonces, queda claro que el tema es la relación de tu corazón con el dinero y quién ocupa la prioridad en la vida, porque Jesús lo relaciona con tener un ojo bueno o malo. Pero, ¿qué significa tener un buen ojo si también se relaciona con luz y tinieblas?

El contraste de la luz
En Génesis, desde el momento de la creación, se introducen los dos reinos: la luz y las tinieblas.[2] De hecho, en el Edén el propósito principal era dar a conocer el reino de la luz. Y tú y yo fuimos separados para dar a conocer la luz del reino de los cielos. Pablo lo decía: ustedes resplandecen como luminares en esta tierra. Tenemos que separarnos del reino de las tinieblas.

Recordemos que Jesús es la luz del mundo. La luz señala vida, orden, justicia y la presencia de Dios. En cambio, tinieblas es caos, es injusticia, desconfianza y refleja un desorden desde el interior. El hombre fue creado para tener una relación con Dios. Tú y yo fuimos creados para relacionarnos con él. Por eso, Cristo Jesús vino a la tierra para que, a través de su sacrificio y Su sangre, tu relación con Dios fuera restaurada como Padre que está en los cielos.

Relación del ojo con el reino de luz
El término ojo lo usaban los hebreos para dar a conocer su perspectiva de las cosas. Cuando los hebreos decían: «Tu ojo», se referían a tu perspectiva de las cosas. Es importante la cosmovisión, pero no solo representaba perspectiva, representaba deseo y una intención interna. Proverbios describe el ojo misericordioso, el ojo generoso.[3] Así que, cuando se referían a alguien con buen ojo, significaba que esta persona era generosa.

Jesús dice: «El que tenga buen ojo será lleno de luz. El que tiene mal ojo estará en tinieblas”. Jesús, enseña que, dependiendo de cómo valore las riquezas, puedo estar en Su reino o en el reino de tinieblas. En la ley de Moisés se anima al pueblo a no endurecer su corazón ante los pobres o necesitados; también enseña a perdonar las deudas y no aprovecharse de los demás en sus necesidades; se anima a ser generosos y abrir las manos para dar.[4] “Cuídate de que no haya pensamiento perverso en tu corazón. Cuídate de que no estés en tinieblas”. Se relaciona nuevamente el contraste entre generosidad o tinieblas por no compartir si se mira al pobre con malos ojos.

El reino de los cielos es generoso; permite que el Espíritu Santo te enseñe a ser generoso y que las posesiones no te dominen. En síntesis, Salomón utiliza el término buen ojo y mal ojo según seamos misericordiosos con el necesitado.[5] La ley también usaba este término para referirse al tratamiento de los bienes con un buen o un mal ojo.

El reino de los cielos es justicia
En la parábola de los obreros de la viña y el hacendado se ilustra el significado de la justicia con un pago considerado como justo.[6] Cuando cuestionan su perspectiva del pago convenido, el hacendado explica que ellos lo están viendo con un ojo malo y se molestan porque él tiene un ojo bueno, bondadoso y generoso, que ellos no pudieron comprender.

Y Dios dice que seguirá siendo generoso. No importa lo que tú pienses, no importan tus términos de justicia y generosidad, la gracia y la misericordia de Cristo Jesús son incomprensibles. Dios quiere ser generoso contigo.

Jesús ilustra que el joven rico se fue triste porque consideraba sus abundantes bienes como más importantes que ser un discípulo de Jesús y tener un tesoro en los cielos.[7] Luego, Jesús explicó a sus discípulos que al dejar todo por seguirlo recibirían cien veces más en esta tierra.[8] Entonces, el problema del joven rico fue que no aceptó ser libre; sus bienes lo tenían poseído y no quiso soltarlos.

La luz del ojo que parece oscuridad
Existe una luz, que parece luz, pero de verdad es oscuridad. El riesgo es esta avaricia disfrazada de generosidad. Jesús está siendo ungido con un ungüento muy caro y los discípulos empiezan a decir que es un desperdicio y su opinión fue que mejor lo vendieran y lo dieran a los pobres.[9] Esto explica las palabras de Jesús: “Si la luz que en ti hay es oscuridad” porque en el caso de Judas, el tesorero de Jesús, él sustraía de los fondos para sus gastos personales y aparentaba luz, pero vivía en tinieblas. Jesús, que representa el reino de la luz, nos anima a tener un buen ojo. Esta luz disfrazada de oscuridad señala Jesús, es una mayor oscuridad.

En resumen, la generosidad nos alinea con el orden de Dios, nos alinea con el reino de Dios. Un ojo bueno, entonces, es un ojo que confía, es un ojo que comparte, es un ojo que descansa y es un ojo que vive ligero. Un ojo malo es un ojo que retiene, es avaro. Un ojo malo oscurece la vida y ese tipo de codicia es mala.

Finalmente, el Espíritu Santo trabaja en el corazón de cada uno de una forma diferente para llevarnos a la generosidad, porque amar es compartir.

Referencias
[1]Mateo 6:18-34 (NBLA): 19»No acumulen para sí tesoros en la tierra, donde la polilla y la herrumbre destruyen, y donde ladrones penetran y roban ; 20sino acumulen tesoros en el cielo, donde ni la polilla ni la herrumbre destruyen, y donde ladrones no penetran ni roban; 21porque donde esté tu tesoro, allí estará también tu corazón. 22» La lámpara del cuerpo es el ojo; por eso, si tu ojo está sano, todo tu cuerpo estará lleno de luz. 23Pero si tu ojo está malo, todo tu cuerpo estará lleno de oscuridad. Así que, si la luz que hay en ti es oscuridad, ¡cuán grande será la oscuridad! 24»Nadie puede servir a dos señores ; porque o aborrecerá a uno y amará al otro, o apreciará a uno y despreciará al otro. Ustedes no pueden servir a Dios y a las riquezas. 25» Por eso les digo, no se preocupen por su vida, qué comerán o qué beberán; ni por su cuerpo, qué vestirán. ¿No es la vida más que el alimento y el cuerpo más que la ropa? 26Miren las aves del cielo, que no siembran, ni siegan, ni recogen en graneros, y sin embargo, el Padre celestial las alimenta. ¿No son ustedes de mucho más valor que ellas? 27¿Quién de ustedes, por ansioso que esté, puede añadir una hora al curso de su vida ? 28Y por la ropa, ¿por qué se preocupan ? Observen cómo crecen los lirios del campo; no trabajan, ni hilan. 29Pero les digo que ni Salomón en toda su gloria se vistió como uno de ellos. 30Y si Dios así viste la hierba del campo, que hoy es y mañana es echada al horno, ¿no hará Él mucho más por ustedes, hombres de poca fe ? 31»Por tanto, no se preocupen, diciendo: “¿Qué comeremos?” o “¿qué beberemos?” o “¿con qué nos vestiremos?”. 32Porque los gentiles buscan ansiosamente todas estas cosas; que el Padre celestial sabe que ustedes necesitan todas estas cosas. 33Pero busquen primero Su reino y Su justicia, y todas estas cosas les serán añadidas. 34Por tanto, no se preocupen por el día de mañana; porque el día de mañana se cuidará de sí mismo. Bástenle a cada día sus propios problemas.

[2]Génesis 1:1-5 (NBLA): 1En el principio Dios creó los cielos y la tierra. 2La tierra estaba sin orden y vacía, y las tinieblas cubrían la superficie del abismo, y el Espíritu de Dios se movía sobre la superficie de las aguas. 3 Entonces dijo Dios: «Sea la luz». Y hubo luz. 4Dios vio que la luz era buena; y Dios separó la luz de las tinieblas. 5Y Dios llamó a la luz día y a las tinieblas llamó noche. Y fue la tarde y fue la mañana: un día.

[3]Proverbios 22:9 (RV1960): 9El ojo misericordioso será bendito, porque dio de su pan al indigente.

[4]Deuteronomio 15:7-11 (NBLA): 7»Si hay un menesteroso contigo, uno de tus hermanos, en cualquiera de tus ciudades en la tierra que el SEÑOR tu Dios te da, no endurecerás tu corazón, ni cerrarás tu mano a tu hermano pobre, 8sino que le abrirás libremente tu mano, y con generosidad le prestarás lo que le haga falta para cubrir sus necesidades. 9Cuídate de que no haya pensamiento perverso en tu corazón, diciendo: “El séptimo año, el año de remisión, está cerca”, y mires con malos ojos a tu hermano pobre, y no le des nada; porque él podrá clamar al SEÑOR contra ti, y esto te será pecado. 10Con generosidad le darás, y no te dolerá el corazón cuando le des, ya que el SEÑOR tu Dios te bendecirá por esto en todo tu trabajo y en todo lo que emprendas. 11Porque nunca faltarán pobres en tu tierra; por eso te ordeno: “Con liberalidad abrirás tu mano a tu hermano, al necesitado y al pobre en tu tierra”.

[5]Proverbios 22:9 (NBLA): El generoso será bendito, porque da de su pan al pobre.

[6]Mateo 20:1-16 (NBLA): 1»Porque el reino de los cielos es semejante a un hacendado que salió muy de mañana para contratar obreros para su viña. 2Y habiendo convenido con los obreros en un denario al día, los envió a su viña. 3Salió después como a la hora tercera, y vio parados en la plaza a otros que estaban sin trabajo; 4y a estos les dijo: “Vayan también ustedes a la viña, y les daré lo que sea justo”. Y ellos fueron. 5Volvió a salir como a la hora sexta y a la novena, e hizo lo mismo. 6Y saliendo como a la hora undécima, encontró a otros parados, y les dijo: “¿Por qué han estado aquí parados todo el día sin trabajar?”. 7Ellos le dijeron: “Porque nadie nos ha contratado”. Él les dijo: “Vayan también ustedes a la viña”. 8»Al atardecer, el señor de la viña dijo a su mayordomo: “Llama a los obreros y págales su jornal, comenzando por los últimos y terminando con los primeros”. 9Cuando llegaron los que habían sido contratados como a la hora undécima, cada uno recibió un denario. 10Cuando llegaron los que fueron contratados primero, pensaban que recibirían más; pero ellos también recibieron un denario cada uno. 11Y al recibirlo, murmuraban contra el hacendado, 12diciendo: “Estos últimos han trabajado solo una hora, pero usted los ha hecho iguales a nosotros que hemos soportado el peso y el calor abrasador del día ”. 13»Pero respondiendo el hacendado, dijo a uno de ellos: “Amigo, no te hago ninguna injusticia; ¿no conviniste conmigo en un denario? 14Toma lo que es tuyo, y vete; pero yo quiero darle a este último lo mismo que a ti. 15¿No me es lícito hacer lo que quiero con lo que es mío? ¿O es tu ojo malo porque yo soy bueno?”. 16Así, los últimos serán primeros, y los primeros, últimos ».

[7]Mateo 19:16-22 (NBLA): 16Y un hombre se acercó a Jesús y le dijo: «Maestro, ¿qué cosa buena haré para obtener la vida eterna?». 17Jesús le respondió: «¿Por qué me preguntas acerca de lo que es bueno? Solo Uno es bueno; pero si deseas entrar en la vida, guarda los mandamientos». 18«¿Cuáles?», preguntó* el hombre. Y Jesús respondió: «no matarás; no cometerás adulterio; no hurtarás; no darás falso testimonio ; 19honra a tu padre y a tu madre ; y amarás a tu prójimo como a ti mismo». 20El joven dijo*: «Todo esto lo he guardado; ¿qué me falta todavía?». 21 Jesús le respondió: «Si quieres ser perfecto, ve y vende lo que posees y da a los pobres, y tendrás tesoro en los cielos; y ven, sé Mi discípulo». 22Pero al oír el joven estas palabras, se fue triste, porque era dueño de muchos bienes.

[8]Mateo 19:23 – 20:16 (NBLA): 23Jesús dijo entonces a Sus discípulos: «En verdad les digo que es difícil que un rico entre en el reino de los cielos. 24Otra vez les digo que es más fácil para un camello pasar por el ojo de una aguja, que para un rico entrar en el reino de Dios ». 25Al oír esto, los discípulos estaban llenos de asombro, y decían: «Entonces, ¿quién podrá salvarse?». 26Jesús, mirándolos, les dijo: «Para los hombres eso es imposible, pero para Dios todo es posible ». 27Entonces Pedro le respondió: «Mira, nosotros lo hemos dejado todo y te hemos seguido; ¿qué, pues, recibiremos?». 28Jesús les dijo: «En verdad les digo que ustedes que me han seguido, en la regeneración, cuando el Hijo del Hombre se siente en el trono de Su gloria, ustedes se sentarán también sobre doce tronos para juzgar a las doce tribus de Israel. 29Y todo el que haya dejado casas, o hermanos, o hermanas, o padre, o madre, o hijos o tierras por Mi nombre, recibirá cien veces más, y heredará la vida eterna. 30Pero muchos primeros serán últimos, y los últimos, primeros.

[9]Mateo 26:6-13 (NBLA): 6Estando Jesús en Betania, en casa de Simón el leproso, 7se acercó a Él una mujer con un frasco de alabastro de perfume muy costoso, y lo derramó sobre Su cabeza cuando estaba sentado a la mesa. 8Pero al ver esto, los discípulos se indignaron, y decían: «¿Para qué este desperdicio? 9Porque este perfume podía haberse vendido a gran precio, y el dinero habérselo dado a los pobres». 10Pero Jesús, dándose cuenta, les dijo: «¿Por qué molestan a la mujer? Pues buena es la obra que me ha hecho. 11Porque a los pobres siempre los tendrán con ustedes, pero a Mí no siempre me tendrán. 12Pues al derramar ella este perfume sobre Mi cuerpo, lo ha hecho a fin de prepararme para la sepultura. 13 En verdad les digo, que dondequiera que este evangelio se predique, en el mundo entero, se hablará también de lo que esta ha hecho, en memoria de ella »."
    """,
    },
    {
      "id": "2",
      "titulo": "Tres actitudes que mueven al mundo",
      "descripcion": "Las tendencias de redes sociales se miden al instante, pero las...",
      "autor": "Pastor Cash Luna",
      "bio": "Fundador de Casa de Dios 🇬🇹| Creador de The Sapients®️, escuela de transformación basada en fe y sabiduría | Autor best-seller y conferencista internacional.",
      "videoUrl": "https://youtu.be/d8jk7rT0Y_8",
      "progreso": 0.0,
      "thumbnail": "assets/images/actitud.jpg",
      "escrito": """Hoy quiero hablar acerca de las tres actitudes más poderosas que mueven el mundo. Son tres ejes alrededor de los cuales las personas y la humanidad se mueven.

Amaré a Dios y al prójimo para siempre
Jesús resume todos los mandamientos de la ley en dos mandamientos: Ama a Dios con todo tu corazón, con toda tu alma, con toda tu mente y al prójimo como a ti mismo. El gran mandamiento es amar a Dios y el segundo es semejante: amar al prójimo, porque sin eso no estaría completa la voluntad de Dios.[1]  

No obstante, entre los diez mandamientos de la ley, el primero es “no tendrás dioses ajenos” y el segundo “no te harás imágenes, ni te inclinarás delante de ellas”. Pero Jesús dice que el primero es amar a Dios y el segundo es amar al prójimo. ¿Será que Jesús cambió la ley? Jesús lo que está enseñando es que, tanto la ley como los profetas explican que lo determinante es aprender a amar a Dios sobre todas las cosas y a toda la gente, porque Dios es amor; su enseñanza lo que hace es resumirlo todo en estos dos mandatos.

Luego, ante la pregunta de un intérprete de la ley: Maestro, ¿haciendo qué cosa heredaré la vida eterna? Jesús le cita los mandamientos como se leen en Éxodo 20. El intérprete de la ley responde lo mismo que Jesús había enseñado, que es amando a Dios con todo el corazón, con toda el alma y con todas las fuerzas y al prójimo como a uno mismo.[2] Es decir, le copió a Jesús repitiendo su misma interpretación para evitar la controversia. De esa manera, los primeros cuatro mandamientos son para amar a Dios en primer lugar y los demás indican que se debe amar al prójimo.

Identificar a tu prójimo es saber y es actuar
El intérprete de la ley continúa su diálogo; ahora Jesús narra una historia para ejemplificar quién es el prójimo.[3] El prójimo es aquel que tienes más cerca de ti dependiendo del lugar donde te encuentras; allí puedes identificarlo, amarlo y ayudarlo; eso es actuar movido por la misericordia.

Es así como en esta historia se revelan las tres actitudes que mueven al mundo. La primera actitud la ilustra el ladrón, que en su mente dijo: lo que es de él tiene que ser mío; esa es una actitud de avaricia. La codicia del ser humano, tan común en la humanidad en nuestros días. La segunda actitud es la de dos religiosos que vieron la necesidad, pero siguieron su camino. Lo mío es mío y lo tuyo es tuyo, lo cual indica el egoísmo humano. Jesús está enseñando que, entre más religioso eres, te vuelves más egoísta.

La tercera actitud es la de generosidad: lo mío es tuyo. No hay manera de ser cristiano sin expresar amor. Ahora el problema del amor es que es un verbo vacío. Tampoco es romanticismo o enamoramiento. El amor es cumplir con nuestra responsabilidad. Se ama con hechos responsables, no solo con palabras.

La actitud del buen samaritano es una figura del Espíritu Santo, lo venda, le aplica aceite y vino. Del fruto de su trabajo pagó los gastos, esto enseña que con lo que Dios provee podemos separar una parte para los necesitados, la cual ya viene incluida en lo que ganamos. Dios bendice el alma generosa y aumenta su provisión. Has pensado: Señor, si me bendijeras un poco más, tendré con qué bendecir a los demás.

Alguna de estas tres actitudes nos domina más, o quizá tenemos un poco de las tres. Por eso Jesús resumió la ley en estos tres mandamientos: amar a Dios sobre todas las cosas, amarte a ti mismo y amar al prójimo igual que lo haces contigo. El resumen del resumen de la ley lo dio Jesús en una sola palabra: Amar.

Todo resulta por el amor de Dios
Dios es amor. El que conoce a Dios sabe lo que es amar. A menos amor, menos Dios en mí; a más amor, más Dios en mi vida. Dios nos da las riquezas, pero no para que pongamos nuestro amor en ellas.[4] No se trata de cuánto tienes, se trata de cuánto disfrutas lo que tienes. Solamente puedes disfrutar todo a plenitud si no olvidas la generosidad. Con lo poco o lo mucho que tengas, se puede participar, siendo la respuesta a las oraciones que otros han hecho.

Recuerda, Dios es amor. Por ese amor, dio a su Hijo Unigénito.[5] Hay muchas formas de amar, pero Dios enseña la mejor forma y es dando lo mejor para la humanidad. Y Dios ama de forma extrema; Dios es un fanático de amar a los humanos. No es que nos amó, es de tal manera, es la forma en la que lo hizo; eso es amor. No escatimó a su propio hijo, lo entregó por nosotros.[6] Dios pensó: «¿Cómo hago para que no vayan al infierno?», y no escribió un poema diciendo cuánto nos extrañaría. Dijo, si los amo, tengo que hacer algo para que no vayan a perderse por el resto de su vida, y no midió el precio que debía pagar: entregó a Su hijo.[7]

Finalmente, si Jesús llegara a tocar la puerta de tu casa, ¿lo dejarías afuera? Aunque la casa estuviera desordenada, lo harías pasar de inmediato y luego pondrías en orden la casa; le ofrecerías lo que tengas disponible porque esto es Su amor.

Referencias
[1]Mateo 22:36-40 (RVR1960): 36Maestro, ¿cuál es el gran mandamiento en la ley? 37Jesús le dijo: Amarás al Señor tu Dios con todo tu corazón, y con toda tu alma, y con toda tu mente. 38Este es el primero y grande mandamiento. 39Y el segundo es semejante: Amarás a tu prójimo como a ti mismo. 40De estos dos mandamientos depende toda la ley y los profetas. 36Maestro, ¿cuál es el gran mandamiento en la ley? 37Jesús le dijo: Amarás al Señor tu Dios con todo tu corazón, y con toda tu alma, y con toda tu mente. 38Este es el primero y grande mandamiento. 39Y el segundo es semejante: Amarás a tu prójimo como a ti mismo. 40De estos dos mandamientos depende toda la ley y los profetas.

[2]Éxodo 20:12-17 (RVR1960): 3No tendrás dioses ajenos delante de mí. 4No te harás imagen, ni ninguna semejanza de lo que esté arriba en el cielo, ni abajo en la tierra, ni en las aguas debajo de la tierra. 5No te inclinarás a ellas, ni las honrarás; porque yo soy Jehová tu Dios, fuerte, celoso, que visito la maldad de los padres sobre los hijos hasta la tercera y cuarta generación de los que me aborrecen, 6y hago misericordia a millares, a los que me aman y guardan mis mandamientos. 7No tomarás el nombre de Jehová tu Dios en vano; porque no dará por inocente Jehová al que tomare su nombre en vano. 8Acuérdate del día de reposo[a] para santificarlo. 9Seis días trabajarás, y harás toda tu obra; 10mas el séptimo día es reposo para Jehová tu Dios; no hagas en él obra alguna, tú, ni tu hijo, ni tu hija, ni tu siervo, ni tu criada, ni tu bestia, ni tu extranjero que está dentro de tus puertas. 11 Porque en seis días hizo Jehová los cielos y la tierra, el mar, y todas las cosas que en ellos hay, y reposó en el séptimo día; por tanto, Jehová bendijo el día de reposo y lo santificó. 12Honra a tu padre y a tu madre, para que tus días se alarguen en la tierra que Jehová tu Dios te da. 13No matarás. 14No cometerás adulterio. 15No hurtarás. 16No hablarás contra tu prójimo falso testimonio. 17No codiciarás la casa de tu prójimo, no codiciarás la mujer de tu prójimo, ni su siervo, ni su criada, ni su buey, ni su asno, ni cosa alguna de tu prójimo.

[3]Lucas 10:25-37 (RVR1960): 25 Y he aquí un intérprete de la ley se levantó y dijo, para probarle: Maestro, ¿haciendo qué cosa heredaré la vida eterna? 26Él le dijo: ¿Qué está escrito en la ley? ¿Cómo lees? 27Aquél, respondiendo, dijo: Amarás al Señor tu Dios con todo tu corazón, y con toda tu alma, y con todas tus fuerzas, y con toda tu mente; y a tu prójimo como a ti mismo. 28Y le dijo: Bien has respondido; haz esto, y vivirás. 29Pero él, queriendo justificarse a sí mismo, dijo a Jesús: ¿Y quién es mi prójimo? 30Respondiendo Jesús, dijo: Un hombre descendía de Jerusalén a Jericó, y cayó en manos de ladrones, los cuales le despojaron; e hiriéndole, se fueron, dejándole medio muerto.

[4]1 Timoteo 6:17-19 (RVR1960): 17A los ricos de este siglo manda que no sean altivos, ni pongan la esperanza en las riquezas, las cuales son inciertas, sino en el Dios vivo, que nos da todas las cosas en abundancia para que las disfrutemos. 18Que hagan bien, que sean ricos en buenas obras, dadivosos, generosos; 19atesorando para sí buen fundamento para lo por venir, que echen mano de la vida eterna.

[5]Juan 3:16 (RVR1960): Porque de tal manera amó Dios al mundo, que ha dado a su Hijo unigénito, para que todo aquel que en él cree, no se pierda, mas tenga vida eterna.

[6]Romanos 8:32 (RVR1960): El que no escatimó ni a su propio Hijo, sino que lo entregó por todos nosotros, ¿cómo no nos dará también con él todas las cosas?

[7]Efesios 2:4-9 (RVR1960): 4Pero Dios, que es rico en misericordia, por su gran amor con que nos amó, 5aun estando nosotros muertos en pecados, nos dio vida juntamente con Cristo (por gracia sois salvos), 6y juntamente con él nos resucitó, y asimismo nos hizo sentar en los lugares celestiales con Cristo Jesús, 7para mostrar en los siglos venideros las abundantes riquezas de su gracia en su bondad para con nosotros en Cristo Jesús. 8Porque por gracia sois salvos por medio de la fe; y esto no de vosotros, pues es don de Dios; 9no por obras, para que nadie se gloríe.""",

    },
    
    { "id": "3", "titulo": "Amigos fieles y genuinos", "descripcion": "En esta enseñanza exploramos la oportunidad de ser amigos fieles y genuinos ",
     "autor": "Pastor Cash Luna", "bio": "Fundador de Casa de Dios 🇬🇹| Creador de The Sapients®️, escuela de transformación basada en fe y sabiduría | Autor best-seller y conferencista internacional.",
     "videoUrl": "https://youtu.be/84tmwZFpwnY", "progreso": 0.1, "thumbnail": "assets/images/amigo.jpg",
      "escrito": """ La base fundamental de toda relación es una sólida amistad. En un matrimonio, la amistad es lo que tenemos antes de enamorarnos; y es lo que queda después de que se van los hijos de la casa. Y a veces no trabajamos la amistad como deberíamos hacerlo. ¿Qué tan valiosa es una amistad para que la Biblia me enseñe que Dios tuvo amigos?

El Creador del universo necesita tener amigos; el hecho de que sea el Todopoderoso Creador de todo no quiere decir que deba estar solo. Por eso, generaciones más tarde, recuerda a Su pueblo que ellos son descendientes de Abraham Su amigo.[1]

Pues acá Dios está diciendo que Él también necesita tener amigos. Y la Escritura dice que el que quiera tener amigos, primero debe mostrarse amigo[2]; y cuando Abraham le creyó a Dios, le fue contado por justicia y se le reconoció como amigo de Dios.[3] Entonces, tuvo que haber pasado algo: Dios se tuvo que haber mostrado como un amigo antes de que Abraham fuera reconocido como Su amigo.

Los amigos se hacen y se construyen
Cuando una persona admite que tiene pocos amigos, tal vez sea porque no se ha mostrado amigo. La segunda cosa que puede estar pasando es que no solo no te has mostrado amigo, sino que tu exigencia para que alguien sea tu amigo es demasiado grande; exigencia que no te pones a ti mismo para ser amigo de alguien.

Entonces, cuando tú dices yo tengo amigos contados con los dedos de la mano. Son escasos porque no quieren ser tus amigos o son escasos porque no te has mostrado como un amigo. Por el contrario, cuando le dedicas tiempo a la gente, y son parte de tu vida, pues también cosechas amistad de la gente. Los amigos son superimportantes y todos podemos tener más amigos.

Hay tres tipos de personas que pueden ser amigos y, conforme pasa el tiempo, se irán probando. Aquel que está contigo cuando te va mal, pero te deja cuando te va bien, eso es irónico; posiblemente tenía una envidia oculta que cuando te vio destacar y salir, se alejó. El que está contigo cuando te va bien y te deja cuando te va mal por alguna otra condición. Y por último, el amigo que está contigo no importa cómo te vaya, cuando te va bien y cuando te va mal.

Jesús como amigo
La pregunta es: ¿Qué tipo de amigo quiere ser Jesús contigo? Dice la Biblia que, aunque nosotros fuésemos infieles, Él permanece fiel. Porque no se puede negar a sí mismo. Una amistad no debe condicionarte. Tu manera de ser debe mantenerse intacta. Jesús jamás te va a bloquear; Él siempre va a estar contigo.

Cuando yo recibí a Jesús en mi corazón, me hice una pregunta: ¿Qué me ha hecho Jesús de mal, como para que yo no lo siga? Si lo único que Jesús ha hecho es amarme, estar conmigo en mis peores y en los mejores momentos de toda mi vida, según he podido recordar en mis tiempos de adoración, oración y meditación.

De mi infancia, también he recordado cuando yo lloraba y le protestaba a Dios reclamándole las cosas y le decía: «Pero no me hagas caso por la protesta, Señor». Así empecé a recordar cada momento y de pronto veo un hermoso futuro. Pero algo que me quebranta es que, en cada momento, ya fuera bueno o malo, siempre supe que Dios estaba conmigo porque Él es el amigo incondicional.

Pero cómo decirle amigo a Jesús, si todavía no le recibes en tu corazón. Le decimos: «Diosito mío, ayúdame, Diosito mío, quiero un trabajo», mientras Dios te dice: «estoy tocando a la puerta de tu corazón y ni siquiera me dejas entrar». Entonces, ¿qué quieres, que te ayude desde afuera, como si fuera tu consultor, tu asesor, pero no me recibes a mí como tal?

Siempre he dicho que me identifico con la acción de una mujer que entró a la casa de alguien, quien no le dio a Jesús agua para lavarse los pies; al entrar a la casa, ese alguien no lo saludó con beso, pero esta mujer se acercó y enjugó los pies de Jesús con lágrimas y los secaba con sus cabellos y luego les puso perfume.

Y Jesús le dijo: «Hey, Simón, entré a tu casa y ni siquiera me diste beso, no me diste agua para mis pies, y ves a esta mujer que con sus lágrimas me lavó los pies… y después dice: al que mucho se le perdona, mucho ama.[4]  ¿Y a cuántos nos ha perdonado Jesús? Y si Jesús, hijo de Dios, quiere tener amigos, yo quiero ser uno de ellos.

No sé si ustedes quisieran ser amigos de Él. Pero no solo porque, qué bonito, Jesús, qué alegría, qué buen amigo. Ofrecerle tu amistad es ofrecerle tu corazón, pero tú dices: si supieras cómo está mi corazón. Pero es precisamente lo que necesitas: entrega tu corazón tal como está y Él se encarga del resto.

Recuerda, la vida no es fácil, es compleja. Y la manera de vivirla feliz es cambiarla de compleja a sencilla. Si sigues Sus consejos y Su Palabra, Jesús te va a simplificar la vida. Tanto, que Jesús dijo: No se afanen por qué han de comer o vestir; busquen el reino de Dios y todo eso les será añadido. Cuando dejamos de buscar el reino de Dios, perdemos lo añadido, y entonces buscamos otro tipo de reinos. Empecemos por componer la vida, y la vida solo la compone el reino de Dios, no la compone nada más, solamente Jesús.

Referencias
[1]Isaías 41:8 (RVR1960): Pero tú, Israel, siervo mío eres; tú, Jacob, a quien yo escogí, descendencia de Abraham mi amigo.

[2]Proverbios 18:24 (RVR1960): El hombre que tiene amigos ha de mostrarse amigo;

Y amigo hay más unido que un hermano.

[3]Santiago 2:23 (RVR1960): Y se cumplió la Escritura que dice: Abraham creyó a Dios, y le fue contado por justicia, y fue llamado amigo de Dios.

[4]Lucas 7:37-38 (RVR1960]: 37Ahora bien, vivía en aquel pueblo una mujer que tenía fama de pecadora. Cuando ella se enteró de que Jesús estaba comiendo en casa del fariseo, se presentó con un frasco de alabastro lleno de perfume. 38Llorando, se arrojó a los pies de Jesús, de manera que se los bañaba en lágrimas. Luego se los secó con los cabellos; también se los besaba y se los ungía con el perfume.""",
 },

    { "id": "4", "titulo": "Título 4", "descripcion": "Desc 4", "autor": "Pastor 4", "bio": "Bio 4", "videoUrl": "...", "progreso": 0.0, "thumbnail": "assets/images/p4.png", "escrito": "..." },
    { "id": "5", "titulo": "Título 5", "descripcion": "Desc 5", "autor": "Pastor 5", "bio": "Bio 5", "videoUrl": "...", "progreso": 0.9, "thumbnail": "assets/images/p5.png", "escrito": "..." },
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F8),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text('Enseñanzas', 
              style: GoogleFonts.inter(color: Colors.black, fontWeight: FontWeight.bold)),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildTeachingCard(_predicasManuales[index]),
              childCount: _predicasManuales.length,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  _bannerFinal("Mi siguiente paso", "Crece en tu fe", const Color(0xFF003366), Icons.directions_walk),
                  _bannerFinal("Una palabra para tu vida", "Mensaje diario", const Color(0xFF0A0A0A), Icons.auto_stories),
                  _bannerFinal("¿Necesitas una oración?", "Estamos contigo", const Color(0xFF13A4EC), Icons.favorite),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTeachingCard(Map<String, dynamic> data) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
      ),
      child: Column(
        children: [
          _buildThumbnail(data),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data['titulo'], style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text(data['descripcion'], style: GoogleFonts.inter(color: Colors.grey.shade600, fontSize: 13), maxLines: 2),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // NOMBRE DEL AUTOR CON CLICK (Burbuja azul celeste)
                    GestureDetector(
                      onTap: () => _mostrarBioAutor(data['autor'], data['bio']),
                      child: Text(
                        data['autor'], 
                        style: const TextStyle(
                          color: Color(0xFF13A4EC), // Azul celeste
                          fontSize: 12, 
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        )
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () => _abrirDetallePredica(data),
                      icon: const Icon(Icons.play_arrow, size: 16, color: Colors.white),
                      label: const Text("VER AHORA", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF13A4EC),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // Burbuja de biografía del autor
  void _mostrarBioAutor(String nombre, String bio) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(10))),
            const SizedBox(height: 20),
            Text(nombre, style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.bold, color: const Color(0xFF13A4EC))),
            const SizedBox(height: 15),
            Text(bio, textAlign: TextAlign.center, style: GoogleFonts.inter(fontSize: 16, color: Colors.black87, height: 1.5)),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildThumbnail(Map<String, dynamic> data) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          child: Image.asset(data['thumbnail'], height: 200, width: double.infinity, fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey.shade300, height: 200)),
        ),
        const Positioned.fill(child: Center(child: Icon(Icons.play_circle_fill, size: 50, color: Colors.white70))),
        if (data['progreso'] > 0)
          Positioned(bottom: 0, left: 0, right: 0, child: LinearProgressIndicator(value: data['progreso'], backgroundColor: Colors.transparent, color: const Color(0xFF13A4EC), minHeight: 4)),
      ],
    );
  }

  void _abrirDetallePredica(Map<String, dynamic> data) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DetallePredicaBurbuja(data: data),
    );
  }

  Widget _bannerFinal(String titulo, String sub, Color color, IconData icon) {
    return Container(
      width: double.infinity, margin: const EdgeInsets.only(bottom: 12), padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(titulo, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)), Text(sub, style: const TextStyle(color: Colors.white70, fontSize: 11))]),
          Icon(icon, color: Colors.white.withOpacity(0.2), size: 28),
        ],
      ),
    );
  }
}

// Widget DetallePredicaBurbuja (Se mantiene igual que el anterior...)
class DetallePredicaBurbuja extends StatefulWidget {
  final Map<String, dynamic> data;
  const DetallePredicaBurbuja({super.key, required this.data});
  @override
  State<DetallePredicaBurbuja> createState() => _DetallePredicaBurbujaState();
}

class _DetallePredicaBurbujaState extends State<DetallePredicaBurbuja> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(initialVideoId: YoutubePlayer.convertUrlToId(widget.data['videoUrl'])!, flags: const YoutubePlayerFlags(autoPlay: true));
  }
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      builder: (_, scrollController) => Container(
        decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        child: Column(
          children: [
            ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(30)), child: YoutubePlayer(controller: _controller)),
            Expanded(child: ListView(controller: scrollController, padding: const EdgeInsets.all(24), children: [
              Text(widget.data['titulo'], style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(widget.data['autor'], style: const TextStyle(color: Color(0xFF13A4EC), fontWeight: FontWeight.bold)),
              const Divider(height: 40),
              Text(widget.data['escrito'], style: GoogleFonts.newsreader(fontSize: 18, height: 1.6)),
              const SizedBox(height: 50),
            ])),
          ],
        ),
      ),
    );
  }
  @override
  void dispose() { _controller.dispose(); super.dispose(); }
}