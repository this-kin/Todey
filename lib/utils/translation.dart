import 'package:todey/utils/exports.dart';

class Translation extends Translations {
  ///supports (3) lanugages ENGLISH, FRENCH AND PORTUGESE

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'schedule': 'Schedule',
          'choose_time': 'Choose start time and end time',
          'important': 'Important',
          'planned': 'Planned',
          'task_name': 'Task name',
          'note': 'Note',
          'settings': 'Settings',
          'stats': 'Stats',
          'language': 'Language',
          'event_cat': 'Event Category',
          'notification': 'Notification',
          'daily_reminder': 'Daily Reminder',
          'help_feed': 'Help & Feedback',
          'suggest': 'Suggest a feature',
          'report': 'Report a problem',
          'follow twitt': 'Follow us on twitter',
          'version': 'Version',
          'started': 'A new Event has Started',
          'ended': 'An Event has ended',
          'morning': 'Good morning please make a Schedule',
          'night': 'Good night please make a Schedule'
        },
        'fr_FR': {
          'schedule': 'Horaire',
          'choose_time': 'Choisissez l\'heure de début et de fin',
          'important': 'Important',
          'planned': 'Planifié',
          'task_name': 'Task name',
          'note': 'Nom de la tâche',
          'settings': 'Réglage',
          'stats': 'Statistiques',
          'language': 'Langue',
          'event_cat': 'catégorie d\'événement',
          'notification': 'Notification',
          'daily_reminder': 'Rappel quotidien',
          'help_feed': 'Aide et commentaires',
          'suggest': 'Suggérer une fonctionnalité',
          'report': 'Signaler un problème',
          'follow twitt': 'Suivez-nous sur Twitter',
          'version': 'Version',
          'started': 'Un nouvel événement a commencé',
          'ended': 'Un événement est terminé',
          'morning': 'Bonjour s\'il vous plaît faire un programme',
          'night': 'Bonjour nuit vous plaît faire un programme'
        },
        'pt_ANG': {
          'schedule': ' Cronograma',
          'choose_time': 'Escolha o horário de início e término',
          'important': 'Importante',
          'planned': 'Planejado',
          'task_name': 'Nome da tarefa',
          'note': 'Observação',
          'settings': 'Definições',
          'stats': 'Estatístico',
          'language': 'Língua',
          'event_cat': 'Categoria de evento',
          'notification': 'Notificação',
          'daily_reminder': 'Lembrete diario',
          'help_feed': 'Ajuda e feedback',
          'suggest': 'Sugira um recurso',
          'report': 'Reportar um problema',
          'follow twitt': 'Siga-nos no Twitter',
          'version': 'Versão',
          'started': 'Um novo evento começou',
          'ended': 'Um evento terminou',
          'morning': 'Bom dia por favor faça um cronograma',
          'night': 'Bom noite por favor faça um cronograma'
        },
      };
}
