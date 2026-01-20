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

final List<GoalTemplate> goalTemplates = [
  GoalTemplate(
    title: 'Aprender un idioma',
    description:
        'Iniciación progresiva en la comprensión y el uso de un idioma',
    iconName: 'language',
    stages: [
      StageTemplate(
        title: 'Primer contacto',
        description: 'Familiarización inicial con el idioma',
        order: 1,
        tasks: [
          TaskTemplate(
            title: 'Elegir idioma y objetivo',
            description: 'Definir qué idioma aprender y para qué',
            order: 1,
            estimatedMinutes: 10,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Aprender saludos básicos',
            description: 'Incorporar formas simples de saludo',
            order: 2,
            estimatedMinutes: 15,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Escuchar pronunciación básica',
            description: 'Reconocer sonidos característicos del idioma',
            order: 3,
            estimatedMinutes: 20,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Practicar sonidos nuevos',
            description: 'Repetir sonidos y palabras simples',
            order: 4,
            estimatedMinutes: 30,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Repasar lo aprendido',
            description: 'Revisar contenidos vistos',
            order: 5,
            estimatedMinutes: 10,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Bases del idioma',
        description: 'Construcción de vocabulario y estructuras simples',
        order: 2,
        tasks: [
          TaskTemplate(
            title: 'Aprender frases comunes',
            description: 'Incorporar expresiones de uso frecuente',
            order: 1,
            estimatedMinutes: 20,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Leer texto corto',
            description: 'Comprender un texto sencillo',
            order: 2,
            estimatedMinutes: 30,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Escuchar audio simple',
            description: 'Identificar palabras conocidas al escuchar',
            order: 3,
            estimatedMinutes: 25,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Practicar escritura básica',
            description: 'Escribir frases simples',
            order: 4,
            estimatedMinutes: 40,
            difficulty: 3,
          ),
          TaskTemplate(
            title: 'Revisión general',
            description: 'Repasar vocabulario y frases',
            order: 5,
            estimatedMinutes: 15,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Uso práctico',
        description: 'Aplicación básica del idioma en situaciones reales',
        order: 3,
        tasks: [
          TaskTemplate(
            title: 'Mantener diálogo corto',
            description: 'Participar en una conversación simple',
            order: 1,
            estimatedMinutes: 30,
            difficulty: 3,
          ),
          TaskTemplate(
            title: 'Ver video corto sin subtítulos',
            description: 'Comprender ideas generales sin apoyo visual',
            order: 2,
            estimatedMinutes: 45,
            difficulty: 3,
          ),
          TaskTemplate(
            title: 'Escribir texto breve',
            description: 'Redactar un mensaje simple',
            order: 3,
            estimatedMinutes: 25,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Escuchar contenido más largo',
            description: 'Mantener atención en audio extendido',
            order: 4,
            estimatedMinutes: 60,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Repaso general',
            description: 'Consolidar lo aprendido',
            order: 5,
            estimatedMinutes: 20,
            difficulty: 1,
          ),
        ],
      ),
    ],
  ),

  GoalTemplate(
    title: 'Aprender programación',
    description: 'Introducción a la lógica y conceptos básicos de programación',
    iconName: 'code',
    stages: [
      StageTemplate(
        title: 'Fundamentos',
        description: 'Primeros conceptos de programación',
        order: 1,
        tasks: [
          TaskTemplate(
            title: 'Qué es programar',
            description: 'Entender el concepto general de programación',
            order: 1,
            estimatedMinutes: 10,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Instalar herramientas',
            description: 'Preparar el entorno de trabajo',
            order: 2,
            estimatedMinutes: 20,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Primer programa',
            description: 'Crear y ejecutar un programa simple',
            order: 3,
            estimatedMinutes: 30,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Variables y tipos',
            description: 'Comprender datos básicos',
            order: 4,
            estimatedMinutes: 40,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Repaso general',
            description: 'Revisar conceptos aprendidos',
            order: 5,
            estimatedMinutes: 15,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Lógica básica',
        description: 'Uso de estructuras lógicas',
        order: 2,
        tasks: [
          TaskTemplate(
            title: 'Condicionales',
            description: 'Tomar decisiones en el código',
            order: 1,
            estimatedMinutes: 30,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Bucles',
            description: 'Repetir acciones automáticamente',
            order: 2,
            estimatedMinutes: 35,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Ejercicios prácticos',
            description: 'Resolver problemas simples',
            order: 3,
            estimatedMinutes: 60,
            difficulty: 3,
          ),
          TaskTemplate(
            title: 'Leer código ajeno',
            description: 'Entender programas escritos por otros',
            order: 4,
            estimatedMinutes: 45,
            difficulty: 3,
          ),
          TaskTemplate(
            title: 'Revisión de errores',
            description: 'Detectar y corregir fallos',
            order: 5,
            estimatedMinutes: 20,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Aplicación',
        description: 'Uso práctico de lo aprendido',
        order: 3,
        tasks: [
          TaskTemplate(
            title: 'Proyecto pequeño',
            description: 'Crear una aplicación simple',
            order: 1,
            estimatedMinutes: 120,
            difficulty: 3,
          ),
          TaskTemplate(
            title: 'Mejorar código',
            description: 'Optimizar y ordenar el programa',
            order: 2,
            estimatedMinutes: 45,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Agregar funcionalidad',
            description: 'Incorporar nuevas características',
            order: 3,
            estimatedMinutes: 60,
            difficulty: 3,
          ),
          TaskTemplate(
            title: 'Pruebas básicas',
            description: 'Verificar que funcione correctamente',
            order: 4,
            estimatedMinutes: 30,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Documentar lo hecho',
            description: 'Explicar el funcionamiento del proyecto',
            order: 5,
            estimatedMinutes: 20,
            difficulty: 1,
          ),
        ],
      ),
    ],
  ),
  GoalTemplate(
    title: 'Empezar a correr',
    description:
        'Inicio progresivo del hábito de correr y mejora de resistencia',
    iconName: 'directions_run',
    stages: [
      StageTemplate(
        title: 'Primeros pasos',
        description: 'Adaptación inicial al movimiento',
        order: 1,
        tasks: [
          TaskTemplate(
            title: 'Caminar 10 minutos',
            description: 'Movimiento suave para activar el cuerpo',
            order: 1,
            estimatedMinutes: 10,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Correr 5 minutos',
            description: 'Primer contacto con el trote',
            order: 2,
            estimatedMinutes: 5,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Estiramientos básicos',
            description: 'Movilidad antes y después de correr',
            order: 3,
            estimatedMinutes: 10,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Caminata continua',
            description: 'Mantener movimiento sostenido',
            order: 4,
            estimatedMinutes: 30,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Registrar sensaciones',
            description: 'Anotar cómo respondió el cuerpo',
            order: 5,
            estimatedMinutes: 5,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Progresión',
        description: 'Aumento gradual de la intensidad',
        order: 2,
        tasks: [
          TaskTemplate(
            title: 'Correr 10 minutos',
            description: 'Extender el tiempo de trote',
            order: 1,
            estimatedMinutes: 10,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Intervalos correr-caminar',
            description: 'Alternar ritmos',
            order: 2,
            estimatedMinutes: 25,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Estiramientos completos',
            description: 'Trabajar flexibilidad general',
            order: 3,
            estimatedMinutes: 15,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Correr 20 minutos',
            description: 'Mantener esfuerzo continuo',
            order: 4,
            estimatedMinutes: 20,
            difficulty: 3,
          ),
          TaskTemplate(
            title: 'Descanso activo',
            description: 'Actividad suave para recuperar',
            order: 5,
            estimatedMinutes: 20,
            difficulty: 1,
          ),
        ],
      ),
    ],
  ),

  GoalTemplate(
    title: 'Entrenar fuerza básica',
    description: 'Desarrollo inicial de fuerza corporal',
    iconName: 'fitness_center',
    stages: [
      StageTemplate(
        title: 'Base corporal',
        description: 'Reconocimiento del cuerpo y movimientos',
        order: 1,
        tasks: [
          TaskTemplate(
            title: 'Movilidad articular',
            description: 'Preparar articulaciones',
            order: 1,
            estimatedMinutes: 10,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Ejercicios con peso corporal',
            description: 'Movimientos simples sin carga',
            order: 2,
            estimatedMinutes: 20,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Rutina corta',
            description: 'Serie breve de ejercicios',
            order: 3,
            estimatedMinutes: 15,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Rutina completa',
            description: 'Entrenamiento más prolongado',
            order: 4,
            estimatedMinutes: 45,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Estiramiento final',
            description: 'Relajar músculos trabajados',
            order: 5,
            estimatedMinutes: 10,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Progresión',
        description: 'Incremento de dificultad',
        order: 2,
        tasks: [
          TaskTemplate(
            title: 'Agregar repeticiones',
            description: 'Aumentar volumen de trabajo',
            order: 1,
            estimatedMinutes: 20,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Rutina intensa',
            description: 'Mayor exigencia física',
            order: 2,
            estimatedMinutes: 60,
            difficulty: 3,
          ),
          TaskTemplate(
            title: 'Trabajo de core',
            description: 'Fortalecer zona media',
            order: 3,
            estimatedMinutes: 25,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Sesión larga',
            description: 'Entrenamiento extendido',
            order: 4,
            estimatedMinutes: 90,
            difficulty: 3,
          ),
          TaskTemplate(
            title: 'Evaluar progreso',
            description: 'Revisar mejoras logradas',
            order: 5,
            estimatedMinutes: 10,
            difficulty: 1,
          ),
        ],
      ),
    ],
  ),

  GoalTemplate(
    title: 'Aprender a meditar',
    description: 'Práctica progresiva de atención plena',
    iconName: 'self_improvement',
    stages: [
      StageTemplate(
        title: 'Inicio',
        description: 'Primer contacto con la meditación',
        order: 1,
        tasks: [
          TaskTemplate(
            title: 'Respiración consciente',
            description: 'Observar la respiración',
            order: 1,
            estimatedMinutes: 5,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Postura cómoda',
            description: 'Encontrar posición adecuada',
            order: 2,
            estimatedMinutes: 10,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Meditación guiada corta',
            description: 'Seguir una guía básica',
            order: 3,
            estimatedMinutes: 10,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Sesión de 15 minutos',
            description: 'Mantener atención sostenida',
            order: 4,
            estimatedMinutes: 15,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Reflexión final',
            description: 'Registrar experiencia',
            order: 5,
            estimatedMinutes: 5,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Consolidación',
        description: 'Mayor profundidad en la práctica',
        order: 2,
        tasks: [
          TaskTemplate(
            title: 'Meditación silenciosa',
            description: 'Sin guía externa',
            order: 1,
            estimatedMinutes: 15,
            difficulty: 3,
          ),
          TaskTemplate(
            title: 'Control de respiración',
            description: 'Regular inhalación y exhalación',
            order: 2,
            estimatedMinutes: 20,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Sesión prolongada',
            description: 'Práctica más extensa',
            order: 3,
            estimatedMinutes: 30,
            difficulty: 3,
          ),
          TaskTemplate(
            title: 'Registro escrito',
            description: 'Anotar sensaciones',
            order: 4,
            estimatedMinutes: 10,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Relajación guiada',
            description: 'Cerrar la práctica',
            order: 5,
            estimatedMinutes: 15,
            difficulty: 1,
          ),
        ],
      ),
    ],
  ),

  GoalTemplate(
    title: 'Mejorar hábitos de sueño',
    description: 'Creación de rutinas para un descanso regular',
    iconName: 'bedtime',
    stages: [
      StageTemplate(
        title: 'Preparación',
        description: 'Organización previa al descanso',
        order: 1,
        tasks: [
          TaskTemplate(
            title: 'Definir horario fijo',
            description: 'Establecer hora de dormir',
            order: 1,
            estimatedMinutes: 10,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Rutina nocturna',
            description: 'Actividades previas al sueño',
            order: 2,
            estimatedMinutes: 20,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Evitar pantallas',
            description: 'Reducir estímulos visuales',
            order: 3,
            estimatedMinutes: 30,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Preparar ambiente',
            description: 'Luz, ruido y temperatura',
            order: 4,
            estimatedMinutes: 15,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Registro de descanso',
            description: 'Anotar calidad del sueño',
            order: 5,
            estimatedMinutes: 5,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Regularidad',
        description: 'Mantener constancia diaria',
        order: 2,
        tasks: [
          TaskTemplate(
            title: 'Dormir horario fijo',
            description: 'Respetar rutina completa',
            order: 1,
            estimatedMinutes: 180,
            difficulty: 3,
          ),
          TaskTemplate(
            title: 'Despertar constante',
            description: 'Evitar variaciones grandes',
            order: 2,
            estimatedMinutes: 10,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Evitar siestas largas',
            description: 'Regular descanso diurno',
            order: 3,
            estimatedMinutes: 30,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Evaluar descanso',
            description: 'Revisar sensaciones al despertar',
            order: 4,
            estimatedMinutes: 10,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Ajustar rutina',
            description: 'Hacer pequeños cambios',
            order: 5,
            estimatedMinutes: 15,
            difficulty: 1,
          ),
        ],
      ),
    ],
  ),

  GoalTemplate(
    title: 'Organizar estudios',
    description: 'Estructuración de una rutina de estudio',
    iconName: 'school',
    stages: [
      StageTemplate(
        title: 'Planificación',
        description: 'Orden inicial del estudio',
        order: 1,
        tasks: [
          TaskTemplate(
            title: 'Listar materias',
            description: 'Identificar qué estudiar',
            order: 1,
            estimatedMinutes: 15,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Definir objetivos',
            description: 'Establecer metas claras',
            order: 2,
            estimatedMinutes: 20,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Organizar horarios',
            description: 'Distribuir tiempos',
            order: 3,
            estimatedMinutes: 30,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Preparar material',
            description: 'Reunir recursos',
            order: 4,
            estimatedMinutes: 25,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Revisión general',
            description: 'Confirmar planificación',
            order: 5,
            estimatedMinutes: 10,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Aplicación',
        description: 'Poner en práctica la rutina',
        order: 2,
        tasks: [
          TaskTemplate(
            title: 'Sesión de estudio corta',
            description: 'Estudiar de forma concentrada',
            order: 1,
            estimatedMinutes: 30,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Sesión de estudio larga',
            description: 'Profundizar contenidos',
            order: 2,
            estimatedMinutes: 90,
            difficulty: 3,
          ),
          TaskTemplate(
            title: 'Repaso semanal',
            description: 'Consolidar lo aprendido',
            order: 3,
            estimatedMinutes: 60,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Autoevaluación',
            description: 'Revisar comprensión',
            order: 4,
            estimatedMinutes: 20,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Ajustar planificación',
            description: 'Mejorar organización',
            order: 5,
            estimatedMinutes: 15,
            difficulty: 1,
          ),
        ],
      ),
    ],
  ),

  GoalTemplate(
    title: 'Aprender música',
    description: 'Introducción al aprendizaje musical',
    iconName: 'music_note',
    stages: [
      StageTemplate(
        title: 'Fundamentos',
        description: 'Bases de la música',
        order: 1,
        tasks: [
          TaskTemplate(
            title: 'Conocer notas',
            description: 'Identificar notas musicales',
            order: 1,
            estimatedMinutes: 15,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Ritmo básico',
            description: 'Reconocer pulsos simples',
            order: 2,
            estimatedMinutes: 20,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Escuchar ejemplos',
            description: 'Prestar atención a melodías',
            order: 3,
            estimatedMinutes: 15,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Práctica inicial',
            description: 'Primeros intentos prácticos',
            order: 4,
            estimatedMinutes: 30,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Repaso',
            description: 'Reforzar conceptos',
            order: 5,
            estimatedMinutes: 10,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Práctica',
        description: 'Aplicación progresiva',
        order: 2,
        tasks: [
          TaskTemplate(
            title: 'Ejercicios diarios',
            description: 'Practicar de forma constante',
            order: 1,
            estimatedMinutes: 20,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Aprender melodía simple',
            description: 'Reproducir una pieza corta',
            order: 2,
            estimatedMinutes: 30,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Sesión prolongada',
            description: 'Práctica extensa',
            order: 3,
            estimatedMinutes: 90,
            difficulty: 3,
          ),
          TaskTemplate(
            title: 'Escuchar y analizar',
            description: 'Identificar patrones',
            order: 4,
            estimatedMinutes: 25,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Evaluar progreso',
            description: 'Revisar avances',
            order: 5,
            estimatedMinutes: 10,
            difficulty: 1,
          ),
        ],
      ),
    ],
  ),

  GoalTemplate(
    title: 'Mejorar alimentación diaria',
    description: 'Incorporación de hábitos alimenticios simples',
    iconName: 'restaurant',
    stages: [
      StageTemplate(
        title: 'Conciencia',
        description: 'Reconocer hábitos actuales',
        order: 1,
        tasks: [
          TaskTemplate(
            title: 'Registrar comidas',
            description: 'Anotar lo que se consume',
            order: 1,
            estimatedMinutes: 10,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Identificar mejoras',
            description: 'Detectar hábitos a cambiar',
            order: 2,
            estimatedMinutes: 15,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Planificar una comida',
            description: 'Pensar opciones simples',
            order: 3,
            estimatedMinutes: 20,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Cocinar comida simple',
            description: 'Preparar algo casero',
            order: 4,
            estimatedMinutes: 45,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Reflexión final',
            description: 'Evaluar cambios',
            order: 5,
            estimatedMinutes: 5,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Constancia',
        description: 'Mantener hábitos',
        order: 2,
        tasks: [
          TaskTemplate(
            title: 'Plan semanal',
            description: 'Organizar comidas',
            order: 1,
            estimatedMinutes: 30,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Cocinar varias comidas',
            description: 'Preparar por adelantado',
            order: 2,
            estimatedMinutes: 90,
            difficulty: 3,
          ),
          TaskTemplate(
            title: 'Elegir opciones saludables',
            description: 'Tomar decisiones conscientes',
            order: 3,
            estimatedMinutes: 15,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Evaluar resultados',
            description: 'Revisar sensaciones',
            order: 4,
            estimatedMinutes: 10,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Ajustar hábitos',
            description: 'Pequeños cambios',
            order: 5,
            estimatedMinutes: 15,
            difficulty: 1,
          ),
        ],
      ),
    ],
  ),

  GoalTemplate(
    title: 'Crear una rutina diaria',
    description: 'Organización general del día a día',
    iconName: 'schedule',
    stages: [
      StageTemplate(
        title: 'Diseño',
        description: 'Planificación inicial',
        order: 1,
        tasks: [
          TaskTemplate(
            title: 'Listar actividades',
            description: 'Identificar tareas diarias',
            order: 1,
            estimatedMinutes: 15,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Definir prioridades',
            description: 'Ordenar lo importante',
            order: 2,
            estimatedMinutes: 20,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Crear bloques horarios',
            description: 'Asignar tiempos',
            order: 3,
            estimatedMinutes: 30,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Rutina matutina',
            description: 'Organizar inicio del día',
            order: 4,
            estimatedMinutes: 20,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Rutina nocturna',
            description: 'Cerrar el día',
            order: 5,
            estimatedMinutes: 20,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Implementación',
        description: 'Poner la rutina en práctica',
        order: 2,
        tasks: [
          TaskTemplate(
            title: 'Seguir rutina completa',
            description: 'Aplicar lo planificado',
            order: 1,
            estimatedMinutes: 180,
            difficulty: 3,
          ),
          TaskTemplate(
            title: 'Detectar problemas',
            description: 'Identificar fallos',
            order: 2,
            estimatedMinutes: 20,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Ajustar tiempos',
            description: 'Optimizar la rutina',
            order: 3,
            estimatedMinutes: 30,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Eliminar distracciones',
            description: 'Reducir interrupciones',
            order: 4,
            estimatedMinutes: 45,
            difficulty: 3,
          ),
          TaskTemplate(
            title: 'Evaluar resultados',
            description: 'Revisar funcionamiento',
            order: 5,
            estimatedMinutes: 15,
            difficulty: 1,
          ),
        ],
      ),
    ],
  ),
];
