class GoalTemplate {
  final String title;
  final String description;
  final List<StageTemplate> stages;
  final String iconName;
  GoalTemplate({
    required this.title,
    required this.description,
    required this.stages,
    required this.iconName,
  });
}

class StageTemplate {
  final String title;
  final int order;
  final String description;
  final List<TaskTemplate> tasks;
  StageTemplate({
    required this.title,
    required this.description,
    required this.order,
    required this.tasks,
  });
}

class TaskTemplate {
  final String title;
  final int order;
  final String description;
  final int estimatedMinutes;
  final int difficulty;
  TaskTemplate({
    required this.title,
    required this.estimatedMinutes,
    required this.description,
    required this.order,
    required this.difficulty,
  });
}

List<GoalTemplate> goalTemplates = [
  // 1 — Aprender un idioma
  GoalTemplate(
    title: 'Aprender un idioma',
    description:
        'Desarrollar la capacidad de comunicarse en un nuevo idioma mediante la comprensión de sus bases gramaticales, vocabulario fundamental y práctica activa en situaciones cotidianas.',
    iconName: 'language',
    stages: [
      StageTemplate(
        title: 'Fundamentos básicos',
        order: 1,
        description:
            'Primer acercamiento al idioma a través del alfabeto, la pronunciación y las expresiones esenciales para comunicar ideas simples.',
        tasks: [
          TaskTemplate(
            title: 'Aprender el alfabeto',
            description:
                'Familiarizarse con las letras, sus sonidos y combinaciones más frecuentes del idioma.',
            order: 1,
            estimatedMinutes: 25,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Dominar frases esenciales',
            description:
                'Interiorizar expresiones básicas que se usan en saludos, presentaciones y situaciones simples.',
            order: 2,
            estimatedMinutes: 30,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Practicar pronunciación',
            description:
                'Entrenar la producción de sonidos que no existen en tu lengua materna para hablar con mayor naturalidad.',
            order: 3,
            estimatedMinutes: 40,
            difficulty: 2,
          ),
        ],
      ),
      StageTemplate(
        title: 'Construcción de vocabulario',
        order: 2,
        description:
            'Expansión de palabras y expresiones útiles relacionadas con temas cotidianos como comida, transporte o tiempo.',
        tasks: [
          TaskTemplate(
            title: 'Memorizar vocabulario diario',
            description:
                'Aprender palabras relacionadas con actividades diarias, objetos cotidianos y rutinas.',
            order: 1,
            estimatedMinutes: 35,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Estudiar verbos comunes',
            description:
                'Comprender y practicar los verbos más usados en el idioma para construir frases simples.',
            order: 2,
            estimatedMinutes: 45,
            difficulty: 2,
          ),
        ],
      ),
      StageTemplate(
        title: 'Estructuras intermedias',
        order: 3,
        description:
            'Comprender la gramática fundamental para mantener conversaciones básicas con confianza.',
        tasks: [
          TaskTemplate(
            title: 'Practicar tiempos verbales',
            description:
                'Aprender cómo se expresan pasado, presente y futuro en el idioma para comunicar acciones correctamente.',
            order: 1,
            estimatedMinutes: 50,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Entender estructuras de preguntas',
            description:
                'Estudiar la forma correcta de formular preguntas comunes.',
            order: 2,
            estimatedMinutes: 40,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Leer textos simples',
            description:
                'Interpretar pequeños relatos o diálogos para reforzar gramática y vocabulario.',
            order: 3,
            estimatedMinutes: 35,
            difficulty: 1,
          ),
        ],
      ),
    ],
  ),

  // 2 — Aprender un lenguaje de programación
  GoalTemplate(
    title: 'Aprender un lenguaje de programación',
    description:
        'Adquirir los conceptos fundamentales de la programación mediante un lenguaje específico, con énfasis en lógica, sintaxis y desarrollo de pequeños proyectos funcionales.',
    iconName: 'code',
    stages: [
      StageTemplate(
        title: 'Introducción al lenguaje',
        order: 1,
        description:
            'Aprender la estructura básica del lenguaje, su sintaxis y cómo ejecutar programas simples.',
        tasks: [
          TaskTemplate(
            title: 'Instalar herramientas necesarias',
            description:
                'Configurar el entorno de desarrollo para escribir y ejecutar código sin complicaciones.',
            order: 1,
            estimatedMinutes: 20,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Comprender la sintaxis básica',
            description:
                'Estudiar cómo se declaran variables, funciones y estructuras simples.',
            order: 2,
            estimatedMinutes: 40,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Conceptos fundamentales',
        order: 2,
        description:
            'Aprender estructuras lógicas y de control para resolver problemas comunes.',
        tasks: [
          TaskTemplate(
            title: 'Trabajar con variables y tipos',
            description:
                'Comprender cómo se almacenan y manipulan datos en el lenguaje.',
            order: 1,
            estimatedMinutes: 45,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Practicar condicionales',
            description:
                'Implementar decisiones lógicas usando estructuras como if/else.',
            order: 2,
            estimatedMinutes: 40,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Usar bucles',
            description:
                'Aplicar ciclos para repetir acciones y procesar colecciones de datos.',
            order: 3,
            estimatedMinutes: 40,
            difficulty: 2,
          ),
        ],
      ),
      StageTemplate(
        title: 'Construcción de un mini proyecto',
        order: 3,
        description:
            'Poner en práctica lo aprendido construyendo un pequeño programa funcional.',
        tasks: [
          TaskTemplate(
            title: 'Diseñar el proyecto',
            description:
                'Definir qué vas a crear, qué problema resuelve y qué funciones necesitarás.',
            order: 1,
            estimatedMinutes: 30,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Implementar funcionalidad básica',
            description:
                'Escribir el código central que resuelve el problema principal.',
            order: 2,
            estimatedMinutes: 60,
            difficulty: 3,
          ),
          TaskTemplate(
            title: 'Probar y corregir errores',
            description:
                'Detectar fallas en el programa para garantizar que funciona correctamente.',
            order: 3,
            estimatedMinutes: 50,
            difficulty: 3,
          ),
        ],
      ),
    ],
  ),

  // 3 — Aprender a tocar un instrumento
  GoalTemplate(
    title: 'Aprender a tocar un instrumento',
    description:
        'Desarrollar habilidades técnicas y auditivas para interpretar música con un instrumento específico, trabajando postura, técnica y repertorio básico.',
    iconName: 'music_note',
    stages: [
      StageTemplate(
        title: 'Familiarización con el instrumento',
        order: 1,
        description:
            'Comprender las partes del instrumento, su mantenimiento y la postura correcta para tocar.',
        tasks: [
          TaskTemplate(
            title: 'Conocer las partes del instrumento',
            description:
                'Identificar cada componente físico y entender su función.',
            order: 1,
            estimatedMinutes: 25,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Aprender postura básica',
            description:
                'Adoptar la posición adecuada para evitar lesiones y mejorar sonido.',
            order: 2,
            estimatedMinutes: 30,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Técnica inicial',
        order: 2,
        description:
            'Introducción a ejercicios básicos que fortalecen la coordinación y precisión.',
        tasks: [
          TaskTemplate(
            title: 'Ejercicios de digitación',
            description:
                'Practicar patrones sencillos para mejorar la movilidad de los dedos.',
            order: 1,
            estimatedMinutes: 40,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Practicar escalas simples',
            description:
                'Entrenar oído y técnica mediante escalas mayores y menores.',
            order: 2,
            estimatedMinutes: 45,
            difficulty: 2,
          ),
        ],
      ),
      StageTemplate(
        title: 'Interpretación inicial',
        order: 3,
        description:
            'Tocar piezas simples que combinan ritmo, melodía y técnica básica.',
        tasks: [
          TaskTemplate(
            title: 'Aprender canción simple',
            description:
                'Interpretar una pieza corta que combine notas aprendidas.',
            order: 1,
            estimatedMinutes: 50,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Practicar con metrónomo',
            description:
                'Mantener un ritmo estable mediante la práctica guiada.',
            order: 2,
            estimatedMinutes: 30,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Grabar una práctica',
            description:
                'Registrar una interpretación para evaluar progreso y detectar mejoras.',
            order: 3,
            estimatedMinutes: 20,
            difficulty: 1,
          ),
        ],
      ),
    ],
  ),

  // 1. Meditación
  GoalTemplate(
    title: 'Aprender a meditar',
    description: 'Crear una práctica de meditación simple y sostenible.',
    iconName: 'self_improvement',
    stages: [
      StageTemplate(
        title: 'Introducción',
        description: 'Explorar conceptos básicos de la meditación.',
        order: 1,
        tasks: [
          TaskTemplate(
            title: 'Leer guía corta',
            description: 'Leer una explicación breve sobre qué es meditar.',
            order: 1,
            estimatedMinutes: 10,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Respiración consciente',
            description: 'Practicar 5 minutos de respiración enfocada.',
            order: 2,
            estimatedMinutes: 5,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Práctica básica',
        description: 'Realizar ejercicios de meditación simples.',
        order: 2,
        tasks: [
          TaskTemplate(
            title: 'Escaneo corporal',
            description: 'Recorrer el cuerpo con atención plena.',
            order: 1,
            estimatedMinutes: 5,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Crear rutina',
        description: 'Establecer un horario constante.',
        order: 3,
        tasks: [
          TaskTemplate(
            title: 'Definir horario',
            description: 'Elegir un momento del día para meditar.',
            order: 1,
            estimatedMinutes: 5,
            difficulty: 1,
          ),
        ],
      ),
    ],
  ),

  // 2. Mejorar sueño
  GoalTemplate(
    title: 'Mejorar calidad del sueño',
    description: 'Desarrollar hábitos para dormir mejor.',
    iconName: 'bedtime',
    stages: [
      StageTemplate(
        title: 'Evaluación',
        description: 'Observar hábitos actuales.',
        order: 1,
        tasks: [
          TaskTemplate(
            title: 'Registrar horarios',
            description: 'Anotar a qué hora te dormís y despertás.',
            order: 1,
            estimatedMinutes: 5,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Cambios simples',
        description: 'Implementar ajustes fáciles.',
        order: 2,
        tasks: [
          TaskTemplate(
            title: 'Evitar pantallas',
            description: 'Reducir el uso de pantallas 30 minutos antes.',
            order: 1,
            estimatedMinutes: 5,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Rutina noche',
        description: 'Construir hábitos previos al sueño.',
        order: 3,
        tasks: [
          TaskTemplate(
            title: 'Seleccionar actividades relajantes',
            description: 'Elegir acciones para hacer antes de dormir.',
            order: 1,
            estimatedMinutes: 5,
            difficulty: 1,
          ),
        ],
      ),
    ],
  ),

  // 3. Ordenar habitación
  GoalTemplate(
    title: 'Organizar habitación',
    description: 'Dejar el espacio más ordenado y funcional.',
    iconName: 'home',
    stages: [
      StageTemplate(
        title: 'Orden rápido',
        description: 'Recuperar el orden básico.',
        order: 1,
        tasks: [
          TaskTemplate(
            title: 'Guardar ropa',
            description: 'Poner la ropa limpia y sucia en su lugar.',
            order: 1,
            estimatedMinutes: 10,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Limpieza puntual',
        description: 'Atender zonas específicas.',
        order: 2,
        tasks: [
          TaskTemplate(
            title: 'Limpiar escritorio',
            description: 'Ordenar y limpiar la superficie.',
            order: 1,
            estimatedMinutes: 10,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Optimización',
        description: 'Reacomodar el espacio.',
        order: 3,
        tasks: [
          TaskTemplate(
            title: 'Mover objetos innecesarios',
            description: 'Elegir qué dejar y qué guardar.',
            order: 1,
            estimatedMinutes: 10,
            difficulty: 2,
          ),
        ],
      ),
    ],
  ),

  // 4. Journaling
  GoalTemplate(
    title: 'Empezar journaling',
    description: 'Crear un espacio para escribir sobre el día.',
    iconName: 'edit_note',
    stages: [
      StageTemplate(
        title: 'Preparación',
        description: 'Elegir formato y frecuencia.',
        order: 1,
        tasks: [
          TaskTemplate(
            title: 'Elegir formato',
            description: 'Decidir si usar papel o app.',
            order: 1,
            estimatedMinutes: 5,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Primeras entradas',
        description: 'Escribir ideas sencillas.',
        order: 2,
        tasks: [
          TaskTemplate(
            title: 'Entrada breve',
            description: 'Escribir algo corto del día.',
            order: 1,
            estimatedMinutes: 5,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Crear hábito',
        description: 'Mantener constancia.',
        order: 3,
        tasks: [
          TaskTemplate(
            title: 'Definir frecuencia',
            description: 'Decidir cuántas veces escribir por semana.',
            order: 1,
            estimatedMinutes: 5,
            difficulty: 1,
          ),
        ],
      ),
    ],
  ),

  // 5. Rutina de mañana
  GoalTemplate(
    title: 'Armar rutina de mañana',
    description: 'Empezar el día con pasos simples.',
    iconName: 'light_mode',
    stages: [
      StageTemplate(
        title: 'Activación',
        description: 'Mover y despertar el cuerpo.',
        order: 1,
        tasks: [
          TaskTemplate(
            title: 'Hidratarse',
            description: 'Tomar un vaso de agua al despertar.',
            order: 1,
            estimatedMinutes: 5,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Organización',
        description: 'Ordenar ideas para el día.',
        order: 2,
        tasks: [
          TaskTemplate(
            title: 'Prioridades del día',
            description: 'Definir 3 tareas clave.',
            order: 1,
            estimatedMinutes: 5,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Prepararse',
        description: 'Cerrar la preparación del día.',
        order: 3,
        tasks: [
          TaskTemplate(
            title: 'Estiramientos suaves',
            description: 'Mover articulaciones para activar el cuerpo.',
            order: 1,
            estimatedMinutes: 5,
            difficulty: 1,
          ),
        ],
      ),
    ],
  ),

  // 6. Mejorar postura
  GoalTemplate(
    title: 'Mejorar postura',
    description: 'Adoptar posiciones más saludables.',
    iconName: 'accessibility_new',
    stages: [
      StageTemplate(
        title: 'Identificar hábitos',
        description: 'Reconocer posturas no ideales.',
        order: 1,
        tasks: [
          TaskTemplate(
            title: 'Ejercicio abrir pecho',
            description: 'Abrir el pecho y llevar hombros atrás.',
            order: 1,
            estimatedMinutes: 5,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Correcciones',
        description: 'Ajustar la postura día a día.',
        order: 2,
        tasks: [
          TaskTemplate(
            title: 'Ajustar silla/escritorio',
            description: 'Acomodar la posición de trabajo.',
            order: 1,
            estimatedMinutes: 5,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Constancia',
        description: 'Recordatorios y práctica.',
        order: 3,
        tasks: [
          TaskTemplate(
            title: 'Recordatorio postural',
            description: 'Tomar 1 minuto para corregir postura.',
            order: 1,
            estimatedMinutes: 5,
            difficulty: 1,
          ),
        ],
      ),
    ],
  ),

  // 7. Detox digital
  GoalTemplate(
    title: 'Desintoxicación digital breve',
    description: 'Reducir tiempo de pantalla.',
    iconName: 'phone_iphone',
    stages: [
      StageTemplate(
        title: 'Preparación',
        description: 'Ajustar configuraciones del dispositivo.',
        order: 1,
        tasks: [
          TaskTemplate(
            title: 'Desactivar notificaciones',
            description: 'Silenciar apps no esenciales.',
            order: 1,
            estimatedMinutes: 5,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Bloques sin pantalla',
        description: 'Establecer horarios libres.',
        order: 2,
        tasks: [
          TaskTemplate(
            title: 'Elegir horario sin celular',
            description: 'Definir un bloque diario sin pantalla.',
            order: 1,
            estimatedMinutes: 5,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Actividades alternativas',
        description: 'Elegir opciones offline.',
        order: 3,
        tasks: [
          TaskTemplate(
            title: 'Lista de actividades',
            description: 'Anotar actividades sin pantalla.',
            order: 1,
            estimatedMinutes: 5,
            difficulty: 1,
          ),
        ],
      ),
    ],
  ),

  // 8. Empezar a correr
  GoalTemplate(
    title: 'Empezar a correr',
    description: 'Iniciar con sesiones suaves de running.',
    iconName: 'directions_run',
    stages: [
      StageTemplate(
        title: 'Calentar',
        description: 'Preparación previa al trote.',
        order: 1,
        tasks: [
          TaskTemplate(
            title: 'Movilidad articular',
            description: 'Giros suaves de articulaciones.',
            order: 1,
            estimatedMinutes: 5,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Trote suave',
        description: 'Primeros minutos de carrera.',
        order: 2,
        tasks: [
          TaskTemplate(
            title: 'Trotar 5 minutos',
            description: 'Trote liviano continuo.',
            order: 1,
            estimatedMinutes: 5,
            difficulty: 2,
          ),
        ],
      ),
      StageTemplate(
        title: 'Enfriamiento',
        description: 'Bajar pulsaciones.',
        order: 3,
        tasks: [
          TaskTemplate(
            title: 'Respiración de recuperación',
            description: 'Respirar profundo para relajar.',
            order: 1,
            estimatedMinutes: 5,
            difficulty: 1,
          ),
        ],
      ),
    ],
  ),

  // 9. Cocinar receta
  GoalTemplate(
    title: 'Aprender una receta nueva',
    description: 'Preparar una comida siguiendo pasos simples.',
    iconName: 'restaurant_menu',
    stages: [
      StageTemplate(
        title: 'Preparación',
        description: 'Revisar ingredientes requeridos.',
        order: 1,
        tasks: [
          TaskTemplate(
            title: 'Leer receta',
            description: 'Revisar todos los pasos de la receta.',
            order: 1,
            estimatedMinutes: 5,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Preparar ingredientes',
        description: 'Cortar y organizar todo.',
        order: 2,
        tasks: [
          TaskTemplate(
            title: 'Cortar ingredientes',
            description: 'Dejar todo listo para cocinar.',
            order: 1,
            estimatedMinutes: 10,
            difficulty: 2,
          ),
        ],
      ),
      StageTemplate(
        title: 'Cocción',
        description: 'Seguir los pasos de cocina.',
        order: 3,
        tasks: [
          TaskTemplate(
            title: 'Cocinar paso a paso',
            description: 'Seguir la receta exactamente.',
            order: 1,
            estimatedMinutes: 15,
            difficulty: 2,
          ),
        ],
      ),
    ],
  ),

  // 10. Presupuesto mensual
  GoalTemplate(
    title: 'Crear presupuesto mensual',
    description: 'Organizar gastos para mayor claridad.',
    iconName: 'attach_money',
    stages: [
      StageTemplate(
        title: 'Registrar gastos',
        description: 'Anotar gastos actuales.',
        order: 1,
        tasks: [
          TaskTemplate(
            title: 'Registrar gastos del mes',
            description: 'Anotar los gastos principales.',
            order: 1,
            estimatedMinutes: 10,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Clasificación',
        description: 'Organizar gastos en categorías.',
        order: 2,
        tasks: [
          TaskTemplate(
            title: 'Organizar categorías',
            description: 'Etiquetar y clasificar gastos.',
            order: 1,
            estimatedMinutes: 10,
            difficulty: 2,
          ),
        ],
      ),
      StageTemplate(
        title: 'Límites',
        description: 'Definir límites para cada categoría.',
        order: 3,
        tasks: [
          TaskTemplate(
            title: 'Asignar montos',
            description: 'Definir cuánto destinar a cada categoría.',
            order: 1,
            estimatedMinutes: 10,
            difficulty: 2,
          ),
        ],
      ),
    ],
  ),
];
