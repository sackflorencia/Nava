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
  // 1. Aprender un idioma
  GoalTemplate(
    title: 'Aprender un idioma',
    description:
        'Se introducen las bases para comunicarse en otro idioma, incorporando vocabulario, estructuras simples y práctica progresiva en situaciones cotidianas.',
    iconName: 'language',
    stages: [
      StageTemplate(
        title: 'Fundamentos',
        order: 1,
        description: 'Primer contacto con el idioma',
        tasks: [
          TaskTemplate(
            title: 'Aprender sonidos',
            description: 'Pronunciación básica',
            order: 1,
            estimatedMinutes: 15,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Saludos comunes',
            description: 'Frases simples',
            order: 2,
            estimatedMinutes: 10,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Vocabulario básico',
            description: 'Palabras frecuentes',
            order: 3,
            estimatedMinutes: 60,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Escuchar diálogos',
            description: 'Comprensión oral',
            order: 4,
            estimatedMinutes: 45,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Repetición guiada',
            description: 'Imitación auditiva',
            order: 5,
            estimatedMinutes: 5,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Construcción',
        order: 2,
        description: 'Armar frases y estructuras',
        tasks: [
          TaskTemplate(
            title: 'Formar oraciones',
            description: 'Estructura básica',
            order: 1,
            estimatedMinutes: 30,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Verbos comunes',
            description: 'Uso frecuente',
            order: 2,
            estimatedMinutes: 90,
            difficulty: 3,
          ),
          TaskTemplate(
            title: 'Preguntas simples',
            description: 'Interacción básica',
            order: 3,
            estimatedMinutes: 20,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Lectura corta',
            description: 'Texto simple',
            order: 4,
            estimatedMinutes: 60,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Ejercicios escritos',
            description: 'Refuerzo',
            order: 5,
            estimatedMinutes: 10,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Uso práctico',
        order: 3,
        description: 'Aplicar el idioma en contextos reales',
        tasks: [
          TaskTemplate(
            title: 'Conversación guiada',
            description: 'Práctica oral',
            order: 1,
            estimatedMinutes: 120,
            difficulty: 3,
          ),
          TaskTemplate(
            title: 'Escuchar contenido',
            description: 'Audio real',
            order: 2,
            estimatedMinutes: 45,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Responder preguntas',
            description: 'Comprensión',
            order: 3,
            estimatedMinutes: 20,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Escribir texto corto',
            description: 'Producción escrita',
            order: 4,
            estimatedMinutes: 30,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Repaso general',
            description: 'Cerrar etapa',
            order: 5,
            estimatedMinutes: 10,
            difficulty: 1,
          ),
        ],
      ),
    ],
  ),

  // 2. Aprender programación
  GoalTemplate(
    title: 'Aprender programación',
    description:
        'Se aprenden los conceptos fundamentales de la programación, la lógica computacional y la creación de pequeños proyectos funcionales.',
    iconName: 'code',
    stages: [
      StageTemplate(
        title: 'Introducción',
        order: 1,
        description: 'Primeros pasos con el código',
        tasks: [
          TaskTemplate(
            title: 'Instalar entorno',
            description: 'Preparar sistema',
            order: 1,
            estimatedMinutes: 30,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Primer programa',
            description: 'Ejecutar código',
            order: 2,
            estimatedMinutes: 15,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Sintaxis básica',
            description: 'Estructura simple',
            order: 3,
            estimatedMinutes: 60,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Variables',
            description: 'Datos simples',
            order: 4,
            estimatedMinutes: 25,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Comentarios',
            description: 'Leer código',
            order: 5,
            estimatedMinutes: 5,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Lógica',
        order: 2,
        description: 'Pensamiento lógico y control del flujo',
        tasks: [
          TaskTemplate(
            title: 'Condicionales',
            description: 'Decisiones',
            order: 1,
            estimatedMinutes: 45,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Bucles',
            description: 'Repeticiones',
            order: 2,
            estimatedMinutes: 30,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Funciones',
            description: 'Reutilizar código',
            order: 3,
            estimatedMinutes: 90,
            difficulty: 3,
          ),
          TaskTemplate(
            title: 'Errores comunes',
            description: 'Debug básico',
            order: 4,
            estimatedMinutes: 20,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Ejercicios prácticos',
            description: 'Aplicación',
            order: 5,
            estimatedMinutes: 10,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Proyecto',
        order: 3,
        description: 'Construcción de una app simple',
        tasks: [
          TaskTemplate(
            title: 'Definir idea',
            description: 'Qué construir',
            order: 1,
            estimatedMinutes: 20,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Estructura base',
            description: 'Organizar código',
            order: 2,
            estimatedMinutes: 60,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Implementar lógica',
            description: 'Funcionalidad',
            order: 3,
            estimatedMinutes: 180,
            difficulty: 3,
          ),
          TaskTemplate(
            title: 'Probar programa',
            description: 'Detectar errores',
            order: 4,
            estimatedMinutes: 30,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Mejoras finales',
            description: 'Pulir detalles',
            order: 5,
            estimatedMinutes: 15,
            difficulty: 1,
          ),
        ],
      ),
    ],
  ),

  // 8. Aprender un instrumento
  GoalTemplate(
    title: 'Aprender un instrumento',
    description:
        'Se exploran las bases de la música, el uso del instrumento elegido y la interpretación progresiva de piezas simples.',
    iconName: 'music_note',
    stages: [
      StageTemplate(
        title: 'Contacto',
        order: 1,
        description: 'Primer acercamiento al instrumento',
        tasks: [
          TaskTemplate(
            title: 'Partes instrumento',
            description: 'Reconocer',
            order: 1,
            estimatedMinutes: 15,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Postura',
            description: 'Sujeción',
            order: 2,
            estimatedMinutes: 10,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Sonidos básicos',
            description: 'Explorar',
            order: 3,
            estimatedMinutes: 45,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Afinación',
            description: 'Ajustar sonido',
            order: 4,
            estimatedMinutes: 20,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Rutina corta',
            description: 'Primer hábito',
            order: 5,
            estimatedMinutes: 5,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Técnica',
        order: 2,
        description: 'Desarrollo de coordinación y control',
        tasks: [
          TaskTemplate(
            title: 'Ejercicios simples',
            description: 'Coordinación',
            order: 1,
            estimatedMinutes: 30,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Escalas',
            description: 'Sonidos base',
            order: 2,
            estimatedMinutes: 60,
            difficulty: 3,
          ),
          TaskTemplate(
            title: 'Ritmo',
            description: 'Tiempo',
            order: 3,
            estimatedMinutes: 20,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Lectura básica',
            description: 'Notas',
            order: 4,
            estimatedMinutes: 45,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Repetición',
            description: 'Memoria',
            order: 5,
            estimatedMinutes: 10,
            difficulty: 1,
          ),
        ],
      ),
      StageTemplate(
        title: 'Interpretación',
        order: 3,
        description: 'Aplicar técnica en piezas musicales',
        tasks: [
          TaskTemplate(
            title: 'Canción corta',
            description: 'Aplicar técnica',
            order: 1,
            estimatedMinutes: 60,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Practicar lento',
            description: 'Precisión',
            order: 2,
            estimatedMinutes: 30,
            difficulty: 2,
          ),
          TaskTemplate(
            title: 'Aumentar ritmo',
            description: 'Fluidez',
            order: 3,
            estimatedMinutes: 90,
            difficulty: 3,
          ),
          TaskTemplate(
            title: 'Grabar práctica',
            description: 'Autoevaluar',
            order: 4,
            estimatedMinutes: 15,
            difficulty: 1,
          ),
          TaskTemplate(
            title: 'Revisión',
            description: 'Mejorar',
            order: 5,
            estimatedMinutes: 10,
            difficulty: 1,
          ),
        ],
      ),
    ],
  ),
];
