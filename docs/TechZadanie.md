﻿**Техническое задание (ТЗ) на разработку сайта "Бестиарий Регионов России"**

**Цель проекта:**
Целью данного проекта является разработка электронного справочника "Бестиарий Регионов России", который будет содержать информацию о флоре и фауне всех регионов РФ. Сайт должен быть доступен в сети Интернет и предоставлять пользователям возможность искать и просматривать данные о животных и растениях по видам, семействам и ареалам обитания.

-----
**Функциональные требования:**

1. **Имиджевая функция:**
   Сайт должен формировать стиль и образ проекта, используя оформление, которое отражает научно-просветительскую направленность. Оформление должно соответствовать теме экологии и биологии.
1. **Информационная функция:**
   Сайт предоставляет информацию о флоре и фауне регионов РФ, включая:
   1. Название вида (русское и латинское);
   1. Семейство;
   1. Ареал обитания;
   1. Описание и фотографии.
1. **Рекламная функция:**
   Возможность размещения информационных блоков о природоохранных мероприятиях и организациях.
-----
**Требования к функциональности веб-сервера:**

1. **Платформа сервера:**
   Сервер должен поддерживать современные технологии для разработки веб-сайтов (PHP 7.x и выше, Python, Node.js).
1. **Поддержка базы данных:**
   Веб-сервер должен поддерживать работу с реляционными базами данных (например, MySQL или PostgreSQL) для хранения информации о флоре и фауне.
1. **SSL-сертификаты:**
   Сайт должен быть защищен SSL-сертификатом для обеспечения безопасности данных пользователей.
1. **Производительность:**
   Веб-сервер должен быть настроен на оптимальную скорость загрузки страниц, с возможностью кэширования данных для повышения производительности.
-----
**Требования к браузеру:**

1. **Поддерживаемые браузеры:**
   Сайт должен корректно отображаться в следующих браузерах:
   1. Google Chrome (последние 2 версии);
   1. Mozilla Firefox (последние 2 версии);
   1. Safari (последняя версия);
   1. Microsoft Edge (последняя версия);
   1. Opera (последняя версия).
1. **Мобильные устройства:**
   Сайт должен корректно отображаться на всех типах мобильных устройств (iOS, Android), включая планшеты и смартфоны.
-----
**Требования к верстке:**

1. **Адаптивность:**
   Верстка сайта должна быть адаптивной (responsive), корректно отображаться на устройствах с разным разрешением экрана (ПК, планшеты, смартфоны).
1. **Кроссбраузерность:**
   Верстка должна быть проверена на всех основных браузерах (см. "Требования к браузеру") и обеспечивать одинаковый опыт для пользователей.
1. **Валидация кода:**
   Весь HTML/CSS код должен соответствовать стандартам W3C, что гарантирует отсутствие критических ошибок при отображении на разных устройствах.
-----
**Структура сайта и навигация:**

1. **Главная страница:**
   Содержит краткую информацию о проекте и ссылки на основные разделы сайта.
1. **Меню навигации:**
   1. Главная
   1. О проекте
   1. Флора
   1. Фауна
   1. Поиск по регионам
   1. Контакты
1. **Подвал сайта:**
   1. Ссылки на социальные сети
   1. Контактная информация
   1. Правовая информация
-----
**Описание разделов сайта:**

1. **Главная страница:**
   1. Введение в проект "Бестиарий Регионов России";
   1. Последние добавленные виды;
   1. Ссылки на новостные статьи (экологические мероприятия).
1. **Флора и Фауна:**
   Разделы, где пользователи могут найти информацию о растениях и животных, рассортированных по видам и семействам.
1. **Поиск по регионам:**
   Раздел, где пользователь может выбрать регион и увидеть всю информацию о флоре и фауне этого региона.
1. **О проекте:**
   Раздел с описанием миссии проекта, его истории и целей.
1. **Контакты:**
   Страница с формой для обратной связи и контактной информацией.
-----
**Внутренние страницы:**

1. **Страница вида (пример для животного):**
   1. Название животного (русское и латинское);
   1. Фото животного;
   1. Описание (ареал обитания, особенности вида);
   1. Семейство, отряд, класс;
   1. Карта ареала обитания;
   1. Ссылки на внешние ресурсы для дополнительной информации.
1. **Поиск:**
   Страница с возможностью фильтрации по категориям (регион, вид, семейство) и поисковая строка для быстрого нахождения нужного вида.
1. **Новости и статьи:**
   Статьи о флоре и фауне России, а также новости, связанные с природоохранными мероприятиями.
-----
**Дополнительные требования:**

1. **Кэширование данных:**
   Веб-сайт должен поддерживать кэширование для повышения скорости работы, особенно при отображении данных о видах и ареалах обитания.
1. **Интеграция с социальными сетями:**
   Поддержка кнопок для быстрого "шаринга" информации в популярных социальных сетях.
1. **Поддержка мультиязычности:**
   Возможность добавления версий сайта на нескольких языках (опционально).
-----
### **Подкаталог**
Для каждой сущности (животного или растения) на сайте должна быть предусмотрена отдельная "карточка", содержащая следующую информацию:

1. **Фотография**: изображение животного или растения, представленное в высоком разрешении, для визуальной идентификации пользователя.
1. **Описание**: текстовое описание вида, включая систематическое положение (название вида, семейства и т.д.), особенности поведения или биологические характеристики, а также дополнительные сведения.
1. **Место обитания**: указание региона обитания вида, с возможностью отображения его ареала на интерактивной карте.
1. **Опасность для человека**: наличие информации о том, представляет ли данный вид угрозу для человека (например, "не опасен", "ядовит" и т.д.).

Карточки должны быть адаптированы для удобного просмотра на всех устройствах, обеспечивая чёткое восприятие информации и фотографий.
