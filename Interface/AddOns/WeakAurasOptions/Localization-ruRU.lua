if not(GetLocale() == "ruRU") then
    return;
end

local L = WeakAuras.L

-- Options translation
-- L[""] = ""
L["1 Match"] = "1 Совпадение"
-- L["A 20x20 pixels icon"] = ""
-- L["A 32x32 pixels icon"] = ""
-- L["A 40x40 pixels icon"] = ""
-- L["A 48x48 pixels icon"] = ""
-- L["A 64x64 pixels icon"] = ""
L["Actions"] = "Действия"
L["Activate when the given aura(s) |cFFFF0000can't|r be found"] = "Активировать когда заданная аура(ы) |cFFFF0000не|r найдена"
L["Addons"] = "Аддоны"
L["Add to new Dynamic Group"] = "Добавить в новую динамическую группу"
L["Add to new Group"] = "Добавить в новую группу"
L["Add Trigger"] = "Добавить Триггер"
L["A group that dynamically controls the positioning of its children"] = "Группа, позволяющая динамично изменять позиции своих элементов"
L["Align"] = "Выровнять"
L["Allow Full Rotation"] = "Разрешить полное вращение"
L["Alpha"] = "Прозрачность"
L["Anchor"] = "Крепление"
L["Anchor Point"] = "Точка Крепления"
L["Angle"] = "Угол"
L["Animate"] = "Анимация"
L["Animated Expand and Collapse"] = "Анимированное Сворачивание и Разворачивание"
L["Animation relative duration description"] = [=[Длительность анимации по отношению к индикации, выраженная в виде дроби (1/2), процентах (50%), или десятично (0.5).
|cFFFF0000Примечание:|r Если индикация не имеет таймера (например аура без длительности и т.д.), то анимация не проигрывается.
|cFF4444FFДля Примера:|r
Если длительность анимации установлена в |cFF00CC0010%|r и триггер индикации это бафф длительностью 20 секунд, стартовая анимация проиграется за 2 секунды.
Если длительность анимации установлена в |cFF00CC0010%|r и триггер индикации это бесконечная аура, стартовая анимация не будет проигрываться (но проигралась бы, если установить длительность в секундах) .]=]
L["Animations"] = "Анимация"
L["Animation Sequence"] = "Цепочка Анимации"
-- L["Apply Template"] = ""
-- L["Arcane Orb"] = ""
-- L["At a position a bit left of Left HUD position."] = ""
-- L["At a position a bit left of Right HUD position"] = ""
-- L["At the same position as Blizzard's spell alert"] = ""
-- L["Aura Name"] = ""
L["Aura(s)"] = "Эффекты"
-- L["Aura Type"] = ""
L["Auto"] = "Авто"
L["Automatic Icon"] = "Автоматическая Иконка"
L["Backdrop Color"] = "Цвет фона" -- Needs review
L["Backdrop Style"] = "Стиль фона" -- Needs review
L["Background"] = "Подложка"
L["Background Color"] = "Цвет Подложки"
L["Background Inset"] = "Вложенная подложка"
L["Background Offset"] = "Смещение Подложки"
L["Background Texture"] = "Текстура Подложки"
L["Bar Alpha"] = "Прозрачность Полосы"
L["Bar Color"] = "Цвет Полосы"
L["Bar Color Settings"] = "Настройка цвета полос" -- Needs review
L["Bar in Front"] = "Полосы спереди" -- Needs review
L["Bar Texture"] = "Текстура Полосы"
-- L["Big Icon"] = ""
L["Blend Mode"] = "Режим Наложения"
-- L["Blue Rune"] = ""
-- L["Blue Sparkle Orb"] = ""
L["Border"] = "Граница"
L["Border Color"] = "Цвет Границы"
L["Border Inset"] = "Граница вкладки" -- Needs review
L["Border Offset"] = "Смещение Границы"
L["Border Settings"] = "Настройки Границы"
L["Border Size"] = "Размер Границы"
L["Border Style"] = "Стиль Границы"
L["Bottom Text"] = "Нижний текст"
L["Button Glow"] = "Подсветка кнопки"
L["Can be a name or a UID (e.g., party1). Only works on friendly players in your group."] = "Может быть именем или UID (н.п. party1). Работает только с дружественными целями в вашей группе."
L["Cancel"] = "Отмена"
L["Channel Number"] = "Номер Канала"
-- L["Chat Message"] = ""
L["Check On..."] = "Проверять..."
-- L["Children:"] = ""
L["Choose"] = "Выбрать"
L["Choose Trigger"] = "Выбор Триггера"
L["Choose whether the displayed icon is automatic or defined manually"] = "Выберите, будет ли значок определен автоматически или вручную"
L["Clone option enabled dialog"] = [=[Вы активировали опцию |cFFFF0000Авто-клонирования|r.

|cFFFF0000Авто-клонирование|r заставляет индикацию автоматически дубироватся для отображения нескольких источников информации.
Если вы поместите эту индикацию в |cFF22AA22Динамическую Группу|r, все клоны будут смещаться вверх этой большой кучи.

Вы хотите поместить эту индикацию в новую |cFF22AA22Динамическую Группу|r?]=]
L["Close"] = "Закрыть"
L["Collapse all loaded displays"] = "Свернуть все активные индикации"
L["Collapse all non-loaded displays"] = "Свернуть все неактивные индикации"
L["Color"] = "Цвет"
L["Compress"] = "Сжать"
L["Constant Factor"] = "Постоянный множитель"
L["Controls the positioning and configuration of multiple displays at the same time"] = "Управление позиционированием и настройка нескольких индикаций одновременно"
L["Cooldown"] = "Кулдаун"
L["Count"] = "Кол-во"
L["Creating buttons: "] = "Создание кнопок:"
L["Creating options: "] = "Создание настроек:"
-- L["Crop"] = ""
L["Crop X"] = "Обрезать по X"
L["Crop Y"] = "Обрезать по Y"
-- L["Custom"] = ""
L["Custom Code"] = "Свой Код"
-- L["Custom Function"] = ""
L["Custom Trigger"] = "Свой Триггер"
L["Custom trigger event tooltip"] = [=[Напишите какие события должны проверятся для активации триггера.
Несколько событий должны разделятся запятыми или пробелами.

|cFF4444FFДля Примера:|r
UNIT_POWER, UNIT_AURA PLAYER_TARGET_CHANGED
]=]
L["Custom trigger status tooltip"] = [=[Напишите какие события должны проверятся для активации триггера.
Поскольку это триггер состояния, указанные события могут быть вызваны WeakAuras без ожидаемых аргументов.
Несколько событий должны разделятся запятыми или пробелами.

|cFF4444FFДля Примера:|r
UNIT_POWER, UNIT_AURA PLAYER_TARGET_CHANGED
]=]
L["Custom Untrigger"] = "Свой Детриггер"
L["Debuff Type"] = "Тип Дебафа"
-- L["Default"] = ""
L["Delete all"] = "Удалить всё"
L["Delete Trigger"] = "Удалить Триггер"
L["Desaturate"] = "Обесцветить" -- Needs review
L["Disabled"] = "Выключено"
L["Discrete Rotation"] = "Вращать Дискретно"
L["Display"] = "Индикация"
L["Display Icon"] = "Отображать Значек"
-- L["Displays a text, works best in combination with other displays"] = ""
L["Display Text"] = "Отобразить Текст"
L["Distribute Horizontally"] = "Распределить по Горизонтали"
L["Distribute Vertically"] = "Распределить по Вертикали"
-- L["Done"] = ""
-- L["-- Do not remove this comment, it is part of this trigger: "] = ""
L["Duration Info"] = "Информация о продолжительности"
L["Duration (s)"] = "Длительность"
L["Dynamic Group"] = "Динамическая Группа"
-- L["Dynamic information"] = ""
-- L["Dynamic information from first Active Trigger"] = ""
-- L["Dynamic information from Trigger %i"] = ""
L["Dynamic text tooltip"] = [=[Несколько специальных кодов для отображения динамического текста:

|cFFFF0000%p|r - Прогресс - Оставшееся время таймера или без таймерная величина
|cFFFF0000%t|r - Всего - Максимальная длительность таймера или максимальная без таймерная величина
|cFFFF0000%n|r - Название - Название индикации (обычно название задействованной ауры) или ID индикатора
|cFFFF0000%i|r - Иконка - Иконка связанная с индикацией
|cFFFF0000%s|r - Стаки - Кол-во стаков (обычно для ауры)
|cFFFF0000%c|r - В ручную - Позволяет написать функцию на Lua, возвращаемое значение которой и будет отображено ]=]
L["Enabled"] = "Включено"
-- L["End Angle"] = ""
L["Enter an aura name, partial aura name, or spell id"] = "Введите полное название эффекта, часть его названия или ID заклинания."
-- L["Event"] = ""
-- L["Event(s)"] = ""
L["Event Type"] = "Тип События"
L["Expand all loaded displays"] = "Развернуть все загруженные индикации"
L["Expand all non-loaded displays"] = "Развернуть все не загруженные индикации"
L["Expand Text Editor"] = "Расширенный редактор текста"
L["Fade"] = "Скрыть"
-- L["Fade In"] = ""
-- L["Fade Out"] = ""
L["Finish"] = "Завершение"
-- L["Fire Orb"] = ""
L["Font"] = "Шрифт"
L["Font Flags"] = "Флаги шрифта" -- Needs review
L["Font Size"] = "Размер Шрифта"
L["Font Type"] = "Тип Шрифта"
L["Foreground Color"] = "Основной Цвет"
L["Foreground Texture"] = "Основная Текстура"
L["Frame"] = "Кадр"
L["Frame Strata"] = "Слой Кадра"
-- L["From Template"] = ""
L["Glow Action"] = "Действия для подсвечивания"
-- L["Green Rune"] = ""
-- L["Group"] = ""
L["Group aura count description"] = [=[Кол-во из %s человек, к которым должен быть применен один или более данных эффектов, чтобы индикатор сработал.
Если введено целое число (напр. 5), то число людей с этим эффектом, будет сравниваться с введеным значением.
Если введено не целое (напр. 0.5), дробь (напр. 1/2) или процент (напр. 50%%), то эта часть из %s человек и будет в расчетах.

|cFF4444FFДля Примера:|r
|cFF00CC00> 0|r сработает когда любой из %s попал под воздействие
|cFF00CC00= 100%%|r сработает когда любой из %s попал под воздействие
|cFF00CC00!= 2|r будет срабатывать когда %s человек под воздействием и их кол-во не равно 2
|cFF00CC00<= 0.8|r сработает когда менее 80%% из %s, под воздействием (4 из 5 сопартийцев, 8 из 10 или 20 из 25 членов рейда)
|cFF00CC00> 1/2|r сработает если затронуто больше половины из %s человек
|cFF00CC00>= 0|r всегда срабатывает, несмотря ни на что]=] -- Needs review
L["Group Member Count"] = "Кол-во Элементов Группы"
-- L["Grow"] = ""
-- L["Hawk"] = ""
L["Height"] = "Высота"
-- L["Hide"] = ""
-- L["Hide on"] = ""
L["Hide When Not In Group"] = "Скрыть Когда Не в Группе"
L["Horizontal Align"] = "Выравнивание по Горизонтали"
-- L["Horizontal Bar"] = ""
-- L["Horizontal Blizzard Raid Bar"] = ""
-- L["Huge Icon"] = ""
-- L["Hybrid Position"] = ""
-- L["Hybrid Sort Mode"] = ""
-- L["Icon"] = ""
-- L["Icon Color"] = ""
L["Icon Info"] = "Информация о значке"
L["Icon Inset"] = "Вставка вещи" -- Needs review
L["Ignored"] = "Игнорируется"
L["%i Matches"] = "%i Совпадений"
L["Import"] = "Импорт"
L["Import a display from an encoded string"] = "Импортировать индикацию из закодированной строки"
-- L["Inverse"] = ""
L["Justify"] = "Выравнивание"
-- L["Leaf"] = ""
-- L["Left 2 HUD position"] = ""
-- L["Left HUD position"] = ""
L["Left Text"] = "Текст Слева"
L["Load"] = "Загрузить"
L["Loaded"] = "Загружено"
-- L["Low Mana"] = ""
L["Main"] = "Главный"
L["Manage displays defined by Addons"] = "Управление индикациями, определенными Аддонами"
-- L["Medium Icon"] = ""
-- L["Message"] = ""
L["Message Prefix"] = "Префикс Сообщения"
L["Message Suffix"] = "Суффикс Сообщения"
-- L["Message Type"] = ""
L["Mirror"] = "Отразить"
L["Model"] = "Модель"
L["Multiple Displays"] = "Множество Индикаций"
L["Multiple Triggers"] = "Множественные Триггеры"
L["Multiselect ignored tooltip"] = [=[
|cFFFF0000Игнор|r - |cFF777777Одиночная|r - |cFF777777Множественная|r
Эта опция не определяет, когда индикация должна быть загружена]=]
L["Multiselect multiple tooltip"] = [=[
|cFFFF0000Игнор|r - |cFF777777Одиночная|r - |cFF777777Множественная|r
Любое количество совпадающих значений могут быть получены]=]
L["Multiselect single tooltip"] = [=[
|cFFFF0000Игнор|r - |cFF777777Одиночная|r - |cFF777777Множественная|r
Только одно совпадение может быть получено]=]
L["Name Info"] = "Название Инфо"
L["Negator"] = "Не"
-- L["Never"] = ""
L["New"] = "Новая Индикация"
L["No"] = "Нет"
-- L["None"] = ""
L["Not all children have the same value for this option"] = "Не все элементы имеют схожее значение для этой опции"
L["Not Loaded"] = "Не Загружено"
L["No tooltip text"] = "Без подсказки"
-- L["Offer a guided way to create auras for your class"] = ""
L["% of Progress"] = "% Прогресса"
L["Okay"] = "Ок"
L["On Hide"] = "При Скрытии"
-- L["On Init"] = ""
L["Only match auras cast by people other than the player"] = "Совпадение для эффектов других людей, но не игрока"
L["Only match auras cast by the player"] = "Совпадение только для эффектов игрока"
L["On Show"] = "При Появлении"
L["Operator"] = "Оператор"
L["or"] = "или"
-- L["Orange Rune"] = ""
L["Orientation"] = "Ориентация"
L["Outline"] = "Обводка"
L["Own Only"] = "Только своё"
-- L["Paste text below"] = ""
L["Play Sound"] = "Проиграть Звук"
-- L["Portrait Zoom"] = ""
-- L["Preset"] = ""
L["Prevents duration information from decreasing when an aura refreshes. May cause problems if used with multiple auras with different durations."] = "Не позволяет снижать информацию о длительности эффекта, при его обновлении. Может вызвать проблемы при использовании с несколькими эффектами разной длительности."
-- L["Processed %i chars"] = ""
L["Progress Bar"] = "Полоса Прогресса"
L["Progress Texture"] = "Текстура Прогресса"
-- L["Purple Rune"] = ""
-- L["Radius"] = ""
L["Re-center X"] = "Рецентровать X"
L["Re-center Y"] = "Рецентровать Y"
-- L["Remaining Time"] = ""
L["Remaining Time Precision"] = "Точность оставшегося времени"
L["Required For Activation"] = "Необходимо для Активации"
-- L["Right 2 HUD position"] = ""
L["Right-click for more options"] = "Правый клик для дополнительных опций"
-- L["Right HUD position"] = ""
L["Right Text"] = "Текст Справа"
L["Rotate"] = "Вращать"
L["Rotate In"] = "Вращение В"
L["Rotate Out"] = "Вращение Из"
L["Rotate Text"] = "Вращать Текст"
L["Rotation"] = "Поворот"
-- L["Rotation Mode"] = ""
L["Same"] = "Похожие"
-- L["Scale"] = ""
L["Search"] = "Поиск"
L["Select the auras you always want to be listed first"] = "Выберите ауры, которые будут первые в списке" -- Needs review
L["Send To"] = "Отправить"
L["Show all matches (Auto-clone)"] = "Показать все совпадения (Авто-клонирование)"
-- L["Show model of unit "] = ""
L["Show players that are |cFFFF0000not affected"] = "Показать |cFFFF0000не затронутых игроков"
L["Shows a 3D model from the game files"] = "Показать 3D модель из файлов игры"
L["Shows a custom texture"] = "Показывает свою текстуру"
L["Shows a progress bar with name, timer, and icon"] = "Показать полосу прогресса с названием, таймером и иконкой"
L["Shows a spell icon with an optional cooldown overlay"] = "Показать значек заклинания с наложением обратного отсчета" -- Needs review
L["Shows a texture that changes based on duration"] = "Показать текстуру, меняющуюся в зависимости от длительности"
L["Shows one or more lines of text, which can include dynamic information such as progress or stacks"] = "Показать одну или несколько строк текста, которые могут включать в себя информацию о длительности или стаках"
L["Size"] = "Размер"
L["Slide"] = "Скольжение"
L["Slide In"] = "Задвинуть"
L["Slide Out"] = "Выдвинуть"
-- L["Small Icon"] = ""
L["Sort"] = "Сортировка"
L["Sound"] = "Звук"
L["Sound Channel"] = "Звуковой канал"
L["Sound File Path"] = "Путь к Звуковому Файлу"
-- L["Sound Kit ID"] = ""
L["Space"] = "Отступ"
L["Space Horizontally"] = "Отступ по Горизонтали"
L["Space Vertically"] = "Отступ по Вертикали"
-- L["Spark"] = ""
-- L["Spark Settings"] = ""
-- L["Spark Texture"] = ""
-- L["Specific Unit"] = ""
L["Spell ID"] = "ID Заклинания"
L["Spell ID dialog"] = [=[По умолчанию |cFF8800FFWeakAuras|r не может различать ауры с тем же названием, но с разными |cFFFF0000ИД заклинаний|r.
Однако, если использовать Полное Сканирование, |cFF8800FFWeakAuras|r сможет обнаружить специфические |cFFFF0000ИД заклинаний|r.
Вы желаете задействовать Полное Сканирование, что бы онаружить эти |cFFFF0000ИД заклинаний|r.]=]
L["Stack Count"] = "Кол-во Стаков"
L["Stack Info"] = "Информация о стаках"
-- L["Stacks"] = ""
L["Stacks Settings"] = "Настройки Стаков"
L["Stagger"] = "Шатание"
-- L["Star"] = ""
L["Start"] = "Начало"
-- L["Start Angle"] = ""
-- L["Status"] = ""
L["Stealable"] = "Возможно Украсть"
L["Sticky Duration"] = "Липкая Длительность"
-- L["Symbol Settings"] = ""
L["Temporary Group"] = "Временная Группа"
L["Text"] = "Текст"
L["Text Color"] = "Цвет Текста"
L["Text Position"] = "Позиция Текста"
L["Texture"] = "Текстура"
L["Texture Info"] = "Информация Текстуры" -- Needs review
L["The children of this group have different display types, so their display options cannot be set as a group."] = "Элементы этой группы содержат разные типы индикаций, по этому их настройки не могут быть групповыми"
L["The duration of the animation in seconds."] = "Длительность анимации в секугдах"
L["The type of trigger"] = "Тип Триггера"
-- L["This region of type \"%s\" is not supported."] = ""
L["Time in"] = "Время В"
-- L["Tiny Icon"] = ""
L["Toggle the visibility of all loaded displays"] = "Переключить видимость всех загруженных индикаций"
L["Toggle the visibility of all non-loaded displays"] = "Переключить видимость всех не загруженных индикаций"
L["to group's"] = "в группы"
L["Tooltip"] = "Подсказка"
L["Tooltip on Mouseover"] = "Подсказка при наведении мыши"
-- L["Top HUD position"] = ""
L["Top Text"] = "Текст Вверху"
L["to screen's"] = "к экранам"
L["Total Time Precision"] = "Точность Общего Времени"
L["Trigger"] = "Триггер"
L["Trigger %d"] = "Триггер %d"
L["Type"] = "Тип"
-- L["Unit"] = ""
L["Unlike the start or finish animations, the main animation will loop over and over until the display is hidden."] = "В отличие от начальной или конечной анимации, главная анимация зациклена и будет повторятся пока индикация не пропадет."
L["Update Custom Text On..."] = "Обновить Свой Текст На..."
L["Use Full Scan (High CPU)"] = "Использовать Полное Сканирование (Загрузка ЦП)"
-- L["Use SetTransform api"] = ""
L["Use tooltip \"size\" instead of stacks"] = "Использовать подсказку размер вместо стаков"
L["Vertical Align"] = "Выравнивание по Вертикали"
-- L["Vertical Bar"] = ""
-- L["WeakAurasOptions"] = ""
L["Width"] = "Ширина"
L["X Offset"] = "Смещение по X"
-- L["X Rotation"] = ""
L["X Scale"] = "Масштаб по X"
-- L["Yellow Rune"] = ""
L["Yes"] = "Да"
L["Y Offset"] = "Смещение по Y"
-- L["Y Rotation"] = ""
L["Y Scale"] = "Масштаб по Y"
L["Z Offset"] = "Смещение по Z"
L["Zoom"] = "Увеличение"
L["Zoom In"] = "Увеличить"
L["Zoom Out"] = "Уменьшить"
-- L["Z Rotation"] = ""



