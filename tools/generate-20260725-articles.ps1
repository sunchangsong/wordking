param(
    [string] $Date = "20260725"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$excludedRootDirs = @(".git", "assets", "tools")

$learnNamesZh = @{
    Afrikaans="南非语"; Arabic="阿拉伯语"; Bengali="孟加拉语"; Bulgarian="保加利亚语"; Chinese="中文"; Czech="捷克语"; Danish="丹麦语"; Dutch="荷兰语"; English="英语"; Filipino="菲律宾语"; Finnish="芬兰语"; French="法语"; German="德语"; Greek="希腊语"; Hindi="印地语"; Hungarian="匈牙利语"; Indonesian="印尼语"; Italian="意大利语"; Japanese="日语"; Kazakh="哈萨克语"; Korean="韩语"; Latin="拉丁语"; Latvian="拉脱维亚语"; Lithuanian="立陶宛语"; Malay="马来语"; Norwegian="挪威语"; Persian="波斯语"; Polish="波兰语"; Portugues_Brazil="巴西葡萄牙语"; Portuguese="葡萄牙语"; Romanian="罗马尼亚语"; Russian="俄语"; Serbian="塞尔维亚语"; Spanish="西班牙语"; Swahili="斯瓦希里语"; Swedish="瑞典语"; Thai="泰语"; Turkish="土耳其语"; Uzbek="乌兹别克语"; Vietnamese="越南语"
}

function LabelName([string] $value) { $value -replace "_", " " }
function LearnName([string] $source, [string] $target) {
    if ($target -eq "Chinese" -or $target -eq "Traditional_Chinese") { return $learnNamesZh[$source] }
    return (LabelName $source)
}
function Write-Utf8File([string] $path, [string] $content) {
    $utf8NoBom = New-Object System.Text.UTF8Encoding $false
    [System.IO.File]::WriteAllText($path, $content, $utf8NoBom)
}

function Article([string] $target, [string] $language) {
    switch ($target) {
        "Chinese" { return @"
# WordKing — 帮助用户系统提升${language}能力的智能学习工具

**WordKing** 不只是一个背单词 App，更是一套帮助用户持续提升${language}能力的学习系统。它通过词汇积累、科学复习、多场景练习和学习数据反馈，帮助用户把零散的学习时间转化为稳定、可见的语言进步。

无论你正在备考、提升工作沟通能力，还是希望长期培养${language}能力，WordKing 都能帮助你建立更清晰、更高效的学习路径。

---

## WordKing 如何提升${language}能力

### 扩大核心词汇量
- 按计划学习高频词汇和实用表达
- 从基础词汇逐步过渡到进阶内容
- 通过例句和语境理解单词真实用法
- 减少“认识单词却不会使用”的问题

### 用科学复习巩固长期记忆
- 基于遗忘规律安排复习节奏
- 自动提醒用户复习容易忘记的内容
- 区分已掌握、待巩固和易错词汇
- 把时间用在真正需要加强的地方

### 促进听力和语音理解
- 通过发音训练建立听辨能力
- 连接拼写、发音和含义
- 适合碎片时间反复听、反复记
- 为听力理解和口语表达打好基础

### 强化拼写和准确表达
- 通过拼写测试加深记忆
- 帮助用户发现容易混淆的词汇
- 提升书面表达准确性
- 让词汇从“看得懂”逐步变成“写得出”

### 提升阅读和口语效率
- 词汇越稳定，阅读越顺畅
- 更快理解文章、题目和真实材料
- 提升词汇提取速度
- 为日常交流、面试和考试口语积累素材

---

## 数据反馈让学习更清楚

WordKing 会记录学习进度、复习状态和掌握情况。用户可以看到每天学了多少词、哪些词已经掌握、哪些词还需要复习，以及长期词汇量是否在增长。

这些数据能帮助用户及时调整学习计划，避免盲目学习，也能带来持续前进的动力。

---

## 适合哪些用户

- 正在准备语言考试的学生
- 想提升${language}能力的自学者
- 希望提高工作沟通能力的职场人士
- 需要长期积累词汇的语言学习者
- 想用碎片时间保持学习习惯的用户

---

## 为什么选择 WordKing？

> WordKing 的目标不是让用户短时间机械背很多词，而是帮助用户真正记住、理解并使用${language}。

通过科学复习、持续练习和清晰的数据反馈，WordKing 帮助用户把语言学习变成可坚持、可追踪、可积累的长期过程。

---

## 立即开始

下载 **WordKing**，用更科学的方法积累词汇，提升听、说、读、写综合语言能力。

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

语言学习工具, ${language}学习软件, 背单词app推荐, 提高${language}能力, 提升语言能力, 词汇学习软件, 智能复习单词, 听说读写训练, WordKing
"@ }
        "Traditional_Chinese" { return @"
# WordKing — 幫助使用者系統提升${language}能力的智慧學習工具

**WordKing** 不只是背單字 App，更是一套協助使用者持續提升${language}能力的學習系統。它結合詞彙累積、科學複習、多種練習與清楚的學習回饋，讓零散時間變成穩定進步。

無論你正在準備考試、提升工作溝通，或長期培養${language}能力，WordKing 都能幫助你建立更清楚、更有效率的學習路徑。

---

## WordKing 如何提升${language}能力

### 建立核心詞彙量
- 依照每日計畫學習高頻詞與實用表達
- 從基礎詞彙逐步進入進階內容
- 透過意思、發音、拼寫與語境理解詞彙
- 減少「看得懂但不會用」的問題

### 用科學複習鞏固記憶
- 根據遺忘規律安排複習
- 優先加強容易忘記和常出錯的詞
- 區分已掌握、待加強和新學詞彙
- 把學習時間用在最需要的地方

### 提升聽、讀、說、寫
- 連結聲音、拼寫和意思
- 更快聽出熟悉詞彙
- 閱讀時減少查詞中斷
- 說話和寫作時更快提取詞彙

---

## 清楚的學習回饋

WordKing 會記錄學習進度、複習狀態和掌握程度。使用者可以看到每天學了多少詞、哪些詞已經穩定、哪些詞還需要複習，以及詞彙量是否持續成長。

---

## 適合哪些使用者

- 準備語言考試的學生
- 想提升${language}能力的自學者
- 需要改善工作溝通的職場人士
- 長期累積詞彙的語言學習者
- 想利用碎片時間學習的使用者

---

## 為什麼選擇 WordKing？

> WordKing 幫助使用者真正記住、理解並使用${language}。

透過科學複習、持續練習和可見的進步，WordKing 讓語言學習更容易堅持。

---

## 立即開始

下載 **WordKing**，用更聰明的方法提升詞彙、聽力、口說、閱讀和寫作能力。

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

語言學習工具, ${language}學習, 背單字App, 智慧複習, WordKing
"@ }
        "English" { return @"
# WordKing — A Smart Tool for Improving $language Language Skills

**WordKing** is more than a vocabulary app. It is a practical learning system that helps users build stronger $language skills through vocabulary growth, scientific review, varied practice, and clear learning feedback.

Whether you are preparing for an exam, improving communication for work, or building long-term language ability, WordKing helps turn short study sessions into steady progress.

---

## How WordKing Improves $language Skills

### Build a stronger vocabulary base
- Learn high-frequency words and useful expressions with a daily plan
- Move from basic words to more advanced vocabulary step by step
- Understand words through meaning, sound, spelling, and usage
- Reduce the gap between recognizing words and using them correctly

### Remember more with scientific review
- Schedule review around natural forgetting patterns
- Focus on words that are easy to forget or often answered incorrectly
- Separate mastered, weak, and new vocabulary
- Spend study time where it matters most

### Support listening and pronunciation
- Connect spelling, sound, and meaning through repeated exposure
- Improve word recognition while listening
- Practice in short sessions throughout the day
- Build a stronger base for listening comprehension and speaking

### Improve spelling and accurate expression
- Use spelling practice to deepen memory
- Notice confusing or similar words earlier
- Write with better accuracy
- Turn passive vocabulary into words you can actively use

### Make reading and speaking easier
- Reduce reading interruptions caused by unknown words
- Understand articles, exercises, and real materials more quickly
- Recall words faster during speaking
- Prepare useful vocabulary for daily communication, interviews, and exams

---

## Clear Feedback for Better Learning

WordKing tracks learning progress, review status, and mastery. Users can see how many words they learned, which words are stable, which words need more review, and whether their vocabulary is growing over time.

This feedback helps users adjust their study plan and stay motivated.

---

## Who WordKing Is For

- Students preparing for language exams
- Self-learners improving $language skills
- Professionals who need better communication
- Learners building vocabulary over the long term
- Busy users who want to learn in short daily sessions

---

## Why Choose WordKing?

> WordKing is designed not only to help users learn more words, but to help them remember, understand, and use $language with confidence.

With scientific review, consistent practice, and visible progress, WordKing makes language learning easier to continue and easier to measure.

---

## Start Now

Download **WordKing** and improve vocabulary, listening, speaking, reading, and writing with a smarter learning method.

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

language learning app, $language learning, vocabulary app, improve $language skills, smart word review, listening speaking reading writing, WordKing
"@ }
        "French" { return @"
# WordKing — Un outil intelligent pour améliorer ses compétences en $language

**WordKing** est plus qu'une application de vocabulaire. C'est un système d'apprentissage qui aide les utilisateurs à progresser en $language grâce à l'acquisition de vocabulaire, à la révision scientifique, à des exercices variés et à un suivi clair des progrès.

Que vous prépariez un examen, amélioriez votre communication professionnelle ou développiez une compétence linguistique durable, WordKing transforme les petites sessions quotidiennes en progrès réguliers.

---

## Comment WordKing aide à progresser en $language

### Développer le vocabulaire essentiel
- Apprendre des mots fréquents et des expressions utiles avec un plan quotidien
- Passer progressivement du vocabulaire de base au vocabulaire avancé
- Comprendre les mots par le sens, la prononciation, l'orthographe et le contexte
- Mieux utiliser les mots, pas seulement les reconnaître

### Mémoriser durablement
- Planifier les révisions selon les mécanismes de l'oubli
- Renforcer les mots fragiles ou souvent confondus
- Séparer les mots maîtrisés, nouveaux et à revoir
- Utiliser le temps d'étude de façon plus efficace

### Améliorer écoute, lecture et expression
- Relier son, orthographe et sens
- Reconnaître les mots plus vite à l'écoute
- Lire avec moins d'interruptions
- Retrouver le bon mot plus facilement à l'oral et à l'écrit

---

## Des données pour apprendre plus clairement

WordKing suit la progression, les révisions et le niveau de maîtrise. L'utilisateur voit les mots appris, les mots solides, les mots à revoir et l'évolution de son vocabulaire.

Ces données aident à ajuster le plan d'étude et à garder la motivation.

---

## Pour qui ?

- Étudiants préparant un examen de langue
- Autodidactes qui veulent progresser en $language
- Professionnels qui veulent mieux communiquer
- Apprenants qui construisent leur vocabulaire sur le long terme
- Utilisateurs occupés qui apprennent par courtes sessions

---

## Pourquoi choisir WordKing ?

> WordKing aide les utilisateurs à mémoriser, comprendre et utiliser le $language avec plus de confiance.

Avec une révision scientifique, une pratique régulière et des progrès visibles, WordKing rend l'apprentissage plus durable.

---

## Commencer maintenant

Téléchargez **WordKing** et améliorez vocabulaire, écoute, expression orale, lecture et écriture.

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

application d'apprentissage des langues, apprendre $language, vocabulaire, révision intelligente, WordKing
"@ }
        "Spanish" { return @"
# WordKing — Una herramienta inteligente para mejorar tus habilidades en $language

**WordKing** es más que una app para memorizar palabras. Es un sistema de aprendizaje que ayuda a mejorar el $language mediante vocabulario, repaso científico, práctica variada y datos claros de progreso.

Ya sea que prepares un examen, mejores tu comunicación profesional o desarrolles una habilidad lingüística a largo plazo, WordKing convierte sesiones breves en progreso constante.

---

## Cómo WordKing mejora tu $language

### Amplía tu vocabulario esencial
- Aprende palabras frecuentes y expresiones útiles con un plan diario
- Avanza desde vocabulario básico hasta contenido más avanzado
- Comprende las palabras por significado, sonido, ortografía y contexto
- Reduce la distancia entre reconocer una palabra y usarla bien

### Recuerda más con repaso científico
- Organiza repasos según los patrones naturales del olvido
- Refuerza palabras difíciles o fáciles de confundir
- Distingue vocabulario dominado, nuevo y pendiente de repaso
- Dedica tiempo a lo que realmente necesitas mejorar

### Mejora escucha, lectura y expresión
- Conecta sonido, escritura y significado
- Reconoce palabras con más rapidez al escuchar
- Lee con menos interrupciones
- Recupera palabras con mayor fluidez al hablar y escribir

---

## Datos claros para aprender mejor

WordKing registra progreso, repaso y dominio. Puedes ver cuántas palabras aprendiste, cuáles ya dominas, cuáles necesitan práctica y cómo crece tu vocabulario con el tiempo.

Estos datos ayudan a ajustar el plan y mantener la motivación.

---

## Para quién es WordKing

- Estudiantes que preparan exámenes de idioma
- Autodidactas que quieren mejorar el $language
- Profesionales que necesitan comunicarse mejor
- Personas que construyen vocabulario a largo plazo
- Usuarios ocupados que estudian en sesiones cortas

---

## ¿Por qué elegir WordKing?

> WordKing ayuda a recordar, comprender y usar el $language con más confianza.

Con repaso científico, práctica constante y progreso visible, WordKing hace que aprender sea más sostenible.

---

## Empieza ahora

Descarga **WordKing** y mejora vocabulario, escucha, habla, lectura y escritura.

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

app para aprender idiomas, aprender $language, vocabulario, repaso inteligente, WordKing
"@ }
        "German" { return @"
# WordKing — Ein intelligentes Werkzeug zur Verbesserung deiner $language-Kenntnisse

**WordKing** ist mehr als eine Vokabel-App. Es ist ein Lernsystem, das Nutzer durch Wortschatzaufbau, wissenschaftliche Wiederholung, vielseitige Übungen und klares Feedback beim Lernen von $language unterstützt.

Ob Prüfungsvorbereitung, berufliche Kommunikation oder langfristiger Spracherwerb: WordKing macht aus kurzen Lerneinheiten stetigen Fortschritt.

---

## Wie WordKing beim Lernen von $language hilft

### Einen starken Wortschatz aufbauen
- Häufige Wörter und nützliche Ausdrücke mit Tagesplan lernen
- Schrittweise von Grundlagen zu fortgeschrittenem Wortschatz wechseln
- Wörter über Bedeutung, Klang, Schreibweise und Kontext verstehen
- Wörter nicht nur erkennen, sondern sicher verwenden

### Mit System langfristig behalten
- Wiederholungen nach natürlichen Vergessensmustern planen
- Schwierige und häufig verwechselte Wörter gezielt stärken
- Beherrschte, neue und unsichere Wörter unterscheiden
- Lernzeit dort einsetzen, wo sie am meisten bringt

### Hören, Lesen und Ausdruck verbessern
- Klang, Schreibweise und Bedeutung verbinden
- Wörter beim Hören schneller erkennen
- Texte mit weniger Unterbrechungen lesen
- Wörter beim Sprechen und Schreiben schneller abrufen

---

## Klare Daten für besseres Lernen

WordKing verfolgt Fortschritt, Wiederholung und Beherrschung. Nutzer sehen gelernte Wörter, stabile Wörter, Wörter mit Wiederholungsbedarf und das langfristige Wachstum ihres Wortschatzes.

Diese Daten helfen, den Lernplan anzupassen und motiviert zu bleiben.

---

## Für wen ist WordKing geeignet?

- Lernende in der Prüfungsvorbereitung
- Selbstlernende, die $language verbessern möchten
- Berufstätige, die besser kommunizieren wollen
- Nutzer, die langfristig Wortschatz aufbauen
- Beschäftigte Menschen, die in kurzen Einheiten lernen

---

## Warum WordKing?

> WordKing hilft, $language nicht nur zu lernen, sondern zu behalten, zu verstehen und sicher zu nutzen.

Mit wissenschaftlicher Wiederholung, regelmäßiger Übung und sichtbarem Fortschritt wird Lernen nachhaltiger.

---

## Jetzt starten

Lade **WordKing** herunter und verbessere Wortschatz, Hören, Sprechen, Lesen und Schreiben.

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

Sprachlern-App, $language lernen, Vokabel-App, intelligente Wiederholung, WordKing
"@ }
        "Russian" { return @"
# WordKing — умный инструмент для развития навыков $language

**WordKing** — это не просто приложение для слов. Это система обучения, которая помогает развивать $language через накопление словаря, научное повторение, разные виды практики и понятную статистику прогресса.

Если вы готовитесь к экзамену, улучшаете рабочее общение или развиваете язык на долгий срок, WordKing превращает короткие занятия в устойчивый результат.

---

## Как WordKing помогает улучшать $language

### Расширение основного словаря
- Учите частотные слова и полезные выражения по плану
- Переходите от базовой лексики к более сложной
- Понимайте слова через значение, звук, написание и контекст
- Используйте слова активнее, а не только узнавайте их

### Долговременная память через повторение
- Повторение строится с учетом естественного забывания
- Сложные и часто ошибочные слова получают больше внимания
- Слова разделяются на новые, слабые и уже освоенные
- Время обучения используется более точно

### Улучшение аудирования, чтения и речи
- Связывайте звук, написание и значение
- Быстрее узнавайте слова на слух
- Читайте с меньшим количеством остановок
- Быстрее вспоминайте слова в устной и письменной речи

---

## Понятная статистика обучения

WordKing отслеживает прогресс, повторение и уровень владения словами. Пользователь видит, сколько слов выучено, какие слова закреплены, какие требуют повторения и как растет словарный запас.

Эти данные помогают корректировать план и сохранять мотивацию.

---

## Кому подходит WordKing

- Студентам, готовящимся к языковым экзаменам
- Тем, кто самостоятельно улучшает $language
- Специалистам, которым нужно лучше общаться
- Учащимся, которые долго накапливают словарь
- Занятым людям, которые учатся короткими сессиями

---

## Почему WordKing?

> WordKing помогает не только учить слова, но и запоминать, понимать и уверенно использовать $language.

Научное повторение, регулярная практика и видимый прогресс делают обучение устойчивым.

---

## Начните сейчас

Скачайте **WordKing** и улучшайте словарь, аудирование, речь, чтение и письмо.

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

приложение для изучения языков, изучать $language, словарный запас, умное повторение, WordKing
"@ }
        "Arabic" { return @"
# WordKing — أداة ذكية لتحسين مهارات $language

**WordKing** ليس مجرد تطبيق لحفظ الكلمات، بل نظام تعلم يساعد المستخدمين على تطوير $language من خلال بناء المفردات، والمراجعة العلمية، والتدريب المتنوع، ومتابعة التقدم بوضوح.

---

## كيف يساعد WordKing في تحسين $language

### بناء مفردات قوية
- تعلم الكلمات الشائعة والتعبيرات العملية بخطة يومية
- الانتقال تدريجيا من المفردات الأساسية إلى المتقدمة
- فهم الكلمة من خلال المعنى والنطق والتهجئة والسياق
- تحويل المفردات من معرفة سلبية إلى استخدام فعلي

### مراجعة علمية للذاكرة الطويلة
- تنظيم المراجعة وفق أنماط النسيان الطبيعية
- التركيز على الكلمات الضعيفة أو كثيرة الأخطاء
- تمييز الكلمات المتقنة عن الكلمات التي تحتاج إلى تدريب
- استخدام وقت الدراسة بطريقة أكثر فعالية

### تحسين الاستماع والقراءة والتعبير
- ربط الصوت والكتابة والمعنى
- التعرف على الكلمات بسرعة أكبر عند الاستماع
- قراءة النصوص بانقطاع أقل
- استدعاء الكلمات بسهولة أكبر عند التحدث والكتابة

---

## متابعة واضحة للتقدم

يعرض WordKing الكلمات التي تعلمتها، والكلمات التي أتقنتها، والكلمات التي تحتاج إلى مراجعة، وكيف ينمو مخزونك اللغوي مع الوقت.

---

## لمن يناسب WordKing؟

- الطلاب الذين يستعدون لاختبارات اللغة
- المتعلمون الذاتيون الذين يريدون تحسين $language
- المهنيون الذين يحتاجون إلى تواصل أفضل
- من يبنون مفرداتهم على المدى الطويل
- المستخدمون المشغولون الذين يدرسون في جلسات قصيرة

---

## لماذا WordKing؟

> يساعد WordKing المستخدمين على تذكر $language وفهمها واستخدامها بثقة أكبر.

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

تطبيق تعلم اللغات, تعلم $language, مفردات, مراجعة ذكية, WordKing
"@ }
        "Bengali" { return @"
# WordKing — $language দক্ষতা উন্নত করার স্মার্ট শেখার টুল

**WordKing** শুধু শব্দ মুখস্থ করার অ্যাপ নয়। এটি এমন একটি শেখার ব্যবস্থা যা শব্দভান্ডার বৃদ্ধি, বৈজ্ঞানিক পুনরাবৃত্তি, বিভিন্ন অনুশীলন এবং স্পষ্ট অগ্রগতি দেখানোর মাধ্যমে ব্যবহারকারীদের $language দক্ষতা উন্নত করতে সাহায্য করে।

---

## WordKing কীভাবে $language শেখায়

### দরকারি শব্দভান্ডার তৈরি
- দৈনিক পরিকল্পনা অনুযায়ী প্রচলিত শব্দ ও ব্যবহারিক বাক্যাংশ শেখা
- ধাপে ধাপে মৌলিক শব্দ থেকে উন্নত শব্দে এগোনো
- অর্থ, উচ্চারণ, বানান এবং প্রেক্ষাপটের মাধ্যমে শব্দ বোঝা
- শুধু চেনা নয়, সঠিকভাবে ব্যবহার করা শেখা

### বৈজ্ঞানিক পুনরাবৃত্তি
- ভুলে যাওয়ার স্বাভাবিক ধারা অনুযায়ী রিভিউ সাজানো
- দুর্বল ও ভুল হওয়া শব্দে বেশি মনোযোগ দেওয়া
- শেখা, নতুন এবং পুনরাবৃত্তির দরকার এমন শব্দ আলাদা করা
- শেখার সময়কে আরও কার্যকর করা

### শুনতে, পড়তে ও বলতে সাহায্য
- শব্দের ধ্বনি, বানান এবং অর্থ যুক্ত করা
- শোনার সময় শব্দ দ্রুত চিনতে শেখা
- পড়ার সময় কম বাধা অনুভব করা
- কথা বলা ও লেখার সময় শব্দ দ্রুত মনে আনা

---

## পরিষ্কার শেখার অগ্রগতি

WordKing দেখায় কত শব্দ শেখা হয়েছে, কোন শব্দ ভালোভাবে মনে আছে, কোনগুলো আবার পড়তে হবে এবং সময়ের সঙ্গে শব্দভান্ডার কীভাবে বাড়ছে।

---

## কার জন্য উপযোগী

- ভাষা পরীক্ষার প্রস্তুতি নেওয়া শিক্ষার্থী
- যারা নিজেরা $language শিখতে চান
- ভালো যোগাযোগ দরকার এমন পেশাজীবী
- দীর্ঘমেয়াদে শব্দভান্ডার বাড়াতে চান এমন ব্যবহারকারী
- ব্যস্ত মানুষ যারা ছোট সেশনে শেখেন

---

## কেন WordKing?

> WordKing ব্যবহারকারীদের $language মনে রাখতে, বুঝতে এবং আত্মবিশ্বাসের সঙ্গে ব্যবহার করতে সাহায্য করে।

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

ভাষা শেখার অ্যাপ, $language শেখা, শব্দভান্ডার, স্মার্ট রিভিউ, WordKing
"@ }
        "Hindi" { return @"
# WordKing — $language कौशल सुधारने का स्मार्ट लर्निंग टूल

**WordKing** केवल शब्द याद करने वाला ऐप नहीं है। यह एक सीखने की प्रणाली है जो शब्दावली, वैज्ञानिक रिव्यू, अलग-अलग अभ्यास और साफ प्रगति डेटा के माध्यम से उपयोगकर्ताओं को $language बेहतर करने में मदद करती है।

---

## WordKing कैसे $language सुधारता है

### मजबूत शब्दावली बनाएं
- दैनिक योजना से उपयोगी शब्द और अभिव्यक्तियां सीखें
- बुनियादी शब्दों से धीरे-धीरे उन्नत शब्दों तक बढ़ें
- अर्थ, उच्चारण, वर्तनी और संदर्भ से शब्द समझें
- शब्दों को सिर्फ पहचानने के बजाय सही तरह से उपयोग करें

### वैज्ञानिक रिव्यू से याद रखें
- भूलने के प्राकृतिक पैटर्न के अनुसार रिव्यू करें
- कमजोर और बार-बार गलत होने वाले शब्दों पर ध्यान दें
- सीखे हुए, नए और रिव्यू योग्य शब्द अलग रखें
- पढ़ाई का समय सही जगह लगाएं

### सुनना, पढ़ना और अभिव्यक्ति सुधारें
- ध्वनि, वर्तनी और अर्थ को जोड़ें
- सुनते समय शब्द जल्दी पहचानें
- पढ़ते समय कम रुकावट महसूस करें
- बोलते और लिखते समय शब्द जल्दी याद करें

---

## स्पष्ट सीखने का डेटा

WordKing दिखाता है कि आपने कितने शब्द सीखे, कौन से शब्द मजबूत हैं, किन्हें रिव्यू चाहिए और समय के साथ आपकी शब्दावली कैसे बढ़ रही है।

---

## किसके लिए उपयोगी

- भाषा परीक्षा की तैयारी करने वाले विद्यार्थी
- $language सुधारना चाहने वाले स्व-अध्ययनकर्ता
- बेहतर संचार चाहने वाले पेशेवर
- लंबे समय तक शब्दावली बनाने वाले सीखने वाले
- छोटे दैनिक सत्रों में पढ़ने वाले व्यस्त उपयोगकर्ता

---

## WordKing क्यों चुनें?

> WordKing उपयोगकर्ताओं को $language याद रखने, समझने और आत्मविश्वास से इस्तेमाल करने में मदद करता है।

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

भाषा सीखने का ऐप, $language सीखना, शब्दावली, स्मार्ट रिव्यू, WordKing
"@ }
        "Italian" { return @"
# WordKing — Uno strumento intelligente per migliorare il $language

**WordKing** non è solo un'app per memorizzare parole. È un sistema di apprendimento che aiuta gli utenti a migliorare il $language con vocabolario, ripasso scientifico, pratica varia e dati chiari sui progressi.

---

## Come WordKing migliora il $language

### Costruire un vocabolario utile
- Imparare parole frequenti ed espressioni pratiche con un piano quotidiano
- Passare gradualmente dal vocabolario di base a quello avanzato
- Capire le parole tramite significato, pronuncia, ortografia e contesto
- Usare le parole correttamente, non solo riconoscerle

### Ricordare con il ripasso scientifico
- Pianificare il ripasso secondo i naturali schemi dell'oblio
- Concentrarsi sulle parole deboli o spesso sbagliate
- Separare parole acquisite, nuove e da rivedere
- Usare meglio il tempo di studio

### Migliorare ascolto, lettura ed espressione
- Collegare suono, scrittura e significato
- Riconoscere più rapidamente le parole ascoltate
- Leggere con meno interruzioni
- Recuperare parole più velocemente parlando e scrivendo

---

## Feedback chiaro sui progressi

WordKing mostra parole imparate, parole consolidate, parole da ripassare e crescita del vocabolario nel tempo.

---

## Per chi è WordKing

- Studenti che preparano esami di lingua
- Autodidatti che vogliono migliorare il $language
- Professionisti che vogliono comunicare meglio
- Persone che costruiscono vocabolario nel lungo periodo
- Utenti occupati che studiano in brevi sessioni

---

## Perché scegliere WordKing?

> WordKing aiuta a ricordare, capire e usare il $language con più sicurezza.

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

app per imparare lingue, imparare $language, vocabolario, ripasso intelligente, WordKing
"@ }
        "Japanese" { return @"
# WordKing — $language の力を伸ばすスマート学習ツール

**WordKing** は単語を覚えるだけのアプリではありません。語彙の蓄積、科学的な復習、多様な練習、わかりやすい学習データによって、ユーザーの $language 能力を継続的に高める学習システムです。

---

## WordKing が $language 学習を支える方法

### 実用的な語彙を増やす
- 毎日の計画に沿って頻出語と便利な表現を学ぶ
- 基礎語彙から応用語彙へ段階的に進む
- 意味、発音、つづり、文脈を結びつけて理解する
- 知っているだけの単語を使える単語に変える

### 科学的な復習で記憶を定着
- 忘却の傾向に合わせて復習を調整
- 苦手な単語や間違いやすい単語を重点的に練習
- 習得済み、新出、復習が必要な単語を整理
- 学習時間を効果的に使う

### 聞く・読む・話す・書くを伸ばす
- 音、つづり、意味を結びつける
- 聞いた単語をより速く認識する
- 読解中のつまずきを減らす
- 会話や作文で単語を素早く思い出す

---

## 学習状況が見える

WordKing は学習数、復習状況、習熟度を記録し、どの単語を覚え、どの単語を復習すべきかを明確にします。

---

## こんな人におすすめ

- 語学試験を準備している学生
- $language を独学で伸ばしたい人
- 仕事でより良いコミュニケーションが必要な人
- 長期的に語彙を増やしたい学習者
- 短時間で毎日学びたい忙しい人

---

## なぜ WordKing なのか

> WordKing は $language を覚え、理解し、自信を持って使えるようにします。

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

語学学習アプリ, $language 学習, 単語アプリ, スマート復習, WordKing
"@ }
        "Javanese" { return @"
# WordKing — Piranti pinter kanggo nambah kabisan $language

**WordKing** dudu mung aplikasi ngapalake tembung. WordKing iku sistem sinau sing mbantu pangguna ningkatake $language liwat tambahing kosakata, pangulangan ilmiah, latihan macem-macem, lan data kemajuan sing cetha.

---

## Kepiye WordKing mbantu sinau $language

### Mbangun kosakata migunani
- Sinau tembung umum lan ungkapan praktis nganggo rencana saben dina
- Maju saka kosakata dhasar menyang tingkat luwih dhuwur
- Ngerti tembung saka makna, pangucapan, ejaan, lan konteks
- Ngowahi tembung sing mung dikenal dadi tembung sing bisa digunakake

### Pangulangan sing luwih ilmiah
- Ngatur pangulangan miturut pola lali alami
- Fokus marang tembung sing ringkih utawa asring salah
- Misahake tembung sing wis dikuasai, anyar, lan kudu dibaleni
- Nggunakake wektu sinau kanthi luwih efektif

### Nambah ngrungokake, maca, lan ngandharake
- Nyambungake swara, tulisan, lan makna
- Luwih cepet ngenali tembung nalika ngrungokake
- Maca kanthi luwih lancar
- Luwih cepet kelingan tembung nalika ngomong lan nulis

---

## Umpan balik sinau sing cetha

WordKing nuduhake kemajuan, status pangulangan, lan tembung sing wis dikuasai supaya pangguna bisa nyetel rencana sinau.

---

## Cocog kanggo sapa?

- Siswa sing nyiapake ujian basa
- Wong sing sinau dhewe kanggo nambah $language
- Profesional sing butuh komunikasi luwih apik
- Pangguna sing pengin ngembangake kosakata jangka panjang
- Wong sibuk sing sinau ing wektu cendhak

---

## Napa milih WordKing?

> WordKing mbantu pangguna ngelingi, ngerti, lan nggunakake $language kanthi luwih percaya diri.

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

aplikasi sinau basa, sinau $language, kosakata, pangulangan pinter, WordKing
"@ }
        "Korean" { return @"
# WordKing — $language 실력을 높이는 스마트 학습 도구

**WordKing**은 단순한 단어 암기 앱이 아닙니다. 어휘 확장, 과학적인 복습, 다양한 연습, 명확한 학습 데이터를 통해 사용자의 $language 능력을 꾸준히 높여 주는 학습 시스템입니다.

---

## WordKing이 $language 실력을 높이는 방법

### 실용 어휘를 쌓기
- 매일 계획에 따라 자주 쓰는 단어와 표현을 학습
- 기초 어휘에서 고급 어휘로 단계적으로 이동
- 뜻, 발음, 철자, 문맥을 함께 이해
- 아는 단어를 실제로 사용할 수 있는 단어로 전환

### 과학적인 복습
- 자연스러운 망각 패턴에 맞춰 복습 일정 구성
- 약한 단어와 자주 틀리는 단어를 집중 강화
- 익힌 단어, 새 단어, 복습할 단어를 구분
- 학습 시간을 더 효율적으로 사용

### 듣기, 읽기, 말하기, 쓰기 향상
- 소리, 철자, 의미를 연결
- 듣는 중 단어를 더 빠르게 인식
- 읽을 때 멈추는 시간을 줄임
- 말하고 쓸 때 단어를 더 빨리 떠올림

---

## 명확한 학습 피드백

WordKing은 학습량, 복습 상태, 숙련도를 기록하여 어떤 단어를 익혔고 어떤 단어를 다시 봐야 하는지 보여 줍니다.

---

## 추천 대상

- 어학 시험을 준비하는 학생
- $language 실력을 높이고 싶은 자기주도 학습자
- 더 나은 업무 커뮤니케이션이 필요한 직장인
- 장기적으로 어휘를 쌓고 싶은 학습자
- 짧은 시간에 매일 공부하려는 사용자

---

## 왜 WordKing인가요?

> WordKing은 사용자가 $language 를 기억하고 이해하며 자신 있게 사용하도록 돕습니다.

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

언어 학습 앱, $language 학습, 단어 앱, 스마트 복습, WordKing
"@ }
        "Portuguese" { return @"
# WordKing — Uma ferramenta inteligente para melhorar o $language

**WordKing** é mais do que um app de vocabulário. É um sistema de aprendizagem que ajuda usuários a melhorar o $language com vocabulário, revisão científica, prática variada e dados claros de progresso.

---

## Como o WordKing melhora o $language

### Criar vocabulário útil
- Aprender palavras frequentes e expressões práticas com um plano diário
- Avançar do vocabulário básico ao avançado passo a passo
- Entender palavras por significado, pronúncia, escrita e contexto
- Usar as palavras corretamente, não apenas reconhecê-las

### Memorizar com revisão científica
- Planejar revisões segundo padrões naturais de esquecimento
- Focar em palavras fracas ou frequentemente erradas
- Separar palavras dominadas, novas e que precisam de revisão
- Usar melhor o tempo de estudo

### Melhorar escuta, leitura e expressão
- Conectar som, escrita e significado
- Reconhecer palavras mais rápido ao ouvir
- Ler com menos interrupções
- Lembrar palavras com mais fluidez ao falar e escrever

---

## Feedback claro de aprendizagem

WordKing mostra palavras aprendidas, palavras consolidadas, palavras que precisam de revisão e o crescimento do vocabulário ao longo do tempo.

---

## Para quem é o WordKing

- Estudantes preparando exames de idioma
- Autodidatas que querem melhorar o $language
- Profissionais que precisam se comunicar melhor
- Pessoas que constroem vocabulário no longo prazo
- Usuários ocupados que estudam em sessões curtas

---

## Por que escolher WordKing?

> WordKing ajuda usuários a lembrar, entender e usar o $language com mais confiança.

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

app de idiomas, aprender $language, vocabulário, revisão inteligente, WordKing
"@ }
        "Marathi" { return @"
# WordKing — $language कौशल्य वाढवण्यासाठी स्मार्ट शिकण्याचे साधन

**WordKing** हे फक्त शब्द पाठांतराचे अॅप नाही. शब्दसंग्रह वाढ, वैज्ञानिक पुनरावृत्ती, विविध सराव आणि स्पष्ट प्रगती माहिती यांच्या मदतीने ते वापरकर्त्यांना $language अधिक चांगले शिकण्यास मदत करते.

---

## WordKing $language कसे सुधारते

### उपयुक्त शब्दसंग्रह तयार करा
- रोजच्या योजनेनुसार वारंवार वापरले जाणारे शब्द आणि वाक्यप्रचार शिका
- मूलभूत शब्दांपासून प्रगत शब्दांकडे टप्प्याटप्प्याने जा
- अर्थ, उच्चार, स्पेलिंग आणि संदर्भातून शब्द समजून घ्या
- ओळखता येणारे शब्द प्रत्यक्ष वापरता येतील असे बनवा

### वैज्ञानिक पुनरावृत्ती
- विसरण्याच्या नैसर्गिक पद्धतीनुसार पुनरावृत्ती करा
- कमकुवत आणि वारंवार चुकणाऱ्या शब्दांवर लक्ष द्या
- शिकलेले, नवीन आणि पुन्हा पाहण्याचे शब्द वेगळे ठेवा
- अभ्यासाचा वेळ अधिक परिणामकारक करा

### ऐकणे, वाचन आणि अभिव्यक्ती सुधारा
- आवाज, स्पेलिंग आणि अर्थ जोडून शिका
- ऐकताना शब्द जलद ओळखा
- वाचनात कमी अडथळे येऊ द्या
- बोलताना आणि लिहिताना शब्द लवकर आठवा

---

## स्पष्ट प्रगती माहिती

WordKing शिकलेले शब्द, पुनरावृत्तीची स्थिती आणि प्रभुत्व दाखवते. त्यामुळे वापरकर्ता योजना बदलू शकतो आणि प्रेरित राहू शकतो.

---

## कोणासाठी उपयुक्त

- भाषा परीक्षेची तयारी करणारे विद्यार्थी
- $language सुधारू इच्छिणारे स्व-अभ्यासक
- उत्तम संवाद हवा असलेले व्यावसायिक
- दीर्घकाळ शब्दसंग्रह वाढवणारे शिकणारे
- कमी वेळात रोज शिकणारे व्यस्त वापरकर्ते

---

## WordKing का निवडावे?

> WordKing वापरकर्त्यांना $language लक्षात ठेवण्यास, समजण्यास आणि आत्मविश्वासाने वापरण्यास मदत करते.

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

भाषा शिकण्याचे अॅप, $language शिकणे, शब्दसंग्रह, स्मार्ट पुनरावृत्ती, WordKing
"@ }
        "Punjabi" { return @"
# WordKing — $language ਹੁਨਰ ਸੁਧਾਰਨ ਲਈ ਸਮਾਰਟ ਸਿੱਖਣ ਵਾਲਾ ਟੂਲ

**WordKing** ਸਿਰਫ਼ ਸ਼ਬਦ ਯਾਦ ਕਰਨ ਵਾਲੀ ਐਪ ਨਹੀਂ ਹੈ। ਇਹ ਇੱਕ ਸਿੱਖਣ ਪ੍ਰਣਾਲੀ ਹੈ ਜੋ ਸ਼ਬਦਾਵਲੀ, ਵਿਗਿਆਨਕ ਦੁਹਰਾਈ, ਵੱਖ-ਵੱਖ ਅਭਿਆਸ ਅਤੇ ਸਾਫ਼ ਪ੍ਰਗਤੀ ਡਾਟਾ ਰਾਹੀਂ ਵਰਤੋਂਕਾਰਾਂ ਨੂੰ $language ਸੁਧਾਰਨ ਵਿੱਚ ਮਦਦ ਕਰਦੀ ਹੈ।

---

## WordKing $language ਕਿਵੇਂ ਸੁਧਾਰਦਾ ਹੈ

### ਮਜ਼ਬੂਤ ਸ਼ਬਦਾਵਲੀ ਬਣਾਓ
- ਰੋਜ਼ਾਨਾ ਯੋਜਨਾ ਨਾਲ ਆਮ ਸ਼ਬਦ ਅਤੇ ਲਾਭਦਾਇਕ ਵਾਕਾਂਸ਼ ਸਿੱਖੋ
- ਬੁਨਿਆਦੀ ਸ਼ਬਦਾਂ ਤੋਂ ਹੌਲੀ-ਹੌਲੀ ਉੱਚ ਪੱਧਰ ਵੱਲ ਵਧੋ
- ਅਰਥ, ਉਚਾਰਨ, ਸਪੈਲਿੰਗ ਅਤੇ ਸੰਦਰਭ ਨਾਲ ਸ਼ਬਦ ਸਮਝੋ
- ਸ਼ਬਦਾਂ ਨੂੰ ਸਿਰਫ਼ ਪਛਾਣਣ ਦੀ ਥਾਂ ਵਰਤਣਾ ਸਿੱਖੋ

### ਵਿਗਿਆਨਕ ਦੁਹਰਾਈ
- ਭੁੱਲਣ ਦੇ ਕੁਦਰਤੀ ਪੈਟਰਨ ਅਨੁਸਾਰ ਦੁਹਰਾਈ ਕਰੋ
- ਕਮਜ਼ੋਰ ਅਤੇ ਵਾਰ-ਵਾਰ ਗਲਤ ਹੋਣ ਵਾਲੇ ਸ਼ਬਦਾਂ ਤੇ ਧਿਆਨ ਦਿਓ
- ਸਿੱਖੇ, ਨਵੇਂ ਅਤੇ ਦੁਹਰਾਉਣ ਵਾਲੇ ਸ਼ਬਦ ਵੱਖ ਕਰੋ
- ਅਧਿਐਨ ਦਾ ਸਮਾਂ ਹੋਰ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਬਣਾਓ

### ਸੁਣਨਾ, ਪੜ੍ਹਨਾ ਅਤੇ ਪ੍ਰਗਟਾਵਾ ਸੁਧਾਰੋ
- ਆਵਾਜ਼, ਲਿਖਤ ਅਤੇ ਅਰਥ ਨੂੰ ਜੋੜੋ
- ਸੁਣਦੇ ਸਮੇਂ ਸ਼ਬਦ ਜਲਦੀ ਪਛਾਣੋ
- ਪੜ੍ਹਾਈ ਵਿੱਚ ਰੁਕਾਵਟਾਂ ਘਟਾਓ
- ਬੋਲਦੇ ਅਤੇ ਲਿਖਦੇ ਸਮੇਂ ਸ਼ਬਦ ਜਲਦੀ ਯਾਦ ਕਰੋ

---

## ਸਾਫ਼ ਸਿੱਖਣ ਫੀਡਬੈਕ

WordKing ਦਿਖਾਉਂਦਾ ਹੈ ਕਿ ਕਿਹੜੇ ਸ਼ਬਦ ਸਿੱਖੇ ਗਏ ਹਨ, ਕਿਹੜੇ ਮਜ਼ਬੂਤ ਹਨ ਅਤੇ ਕਿਹੜਿਆਂ ਨੂੰ ਦੁਹਰਾਈ ਦੀ ਲੋੜ ਹੈ।

---

## ਕਿਸ ਲਈ ਹੈ

- ਭਾਸ਼ਾ ਇਮਤਿਹਾਨ ਦੀ ਤਿਆਰੀ ਕਰਨ ਵਾਲੇ ਵਿਦਿਆਰਥੀ
- $language ਸੁਧਾਰਨ ਵਾਲੇ ਖੁਦ ਸਿੱਖਣ ਵਾਲੇ
- ਬਿਹਤਰ ਸੰਚਾਰ ਚਾਹੁੰਦੇ ਪੇਸ਼ੇਵਰ
- ਲੰਬੇ ਸਮੇਂ ਲਈ ਸ਼ਬਦਾਵਲੀ ਬਣਾਉਣ ਵਾਲੇ
- ਛੋਟੇ ਸੈਸ਼ਨਾਂ ਵਿੱਚ ਸਿੱਖਣ ਵਾਲੇ ਵਿਅਸਤ ਵਰਤੋਂਕਾਰ

---

## WordKing ਕਿਉਂ?

> WordKing ਵਰਤੋਂਕਾਰਾਂ ਨੂੰ $language ਯਾਦ ਰੱਖਣ, ਸਮਝਣ ਅਤੇ ਭਰੋਸੇ ਨਾਲ ਵਰਤਣ ਵਿੱਚ ਮਦਦ ਕਰਦਾ ਹੈ।

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

ਭਾਸ਼ਾ ਸਿੱਖਣ ਐਪ, $language ਸਿੱਖਣਾ, ਸ਼ਬਦਾਵਲੀ, ਸਮਾਰਟ ਦੁਹਰਾਈ, WordKing
"@ }
        "Turkish" { return @"
# WordKing — $language becerilerini geliştiren akıllı öğrenme aracı

**WordKing** yalnızca kelime ezberleme uygulaması değildir. Kelime gelişimi, bilimsel tekrar, farklı alıştırmalar ve net ilerleme verileriyle kullanıcıların $language becerilerini güçlendiren bir öğrenme sistemidir.

---

## WordKing $language öğrenimine nasıl yardımcı olur?

### Kullanışlı kelime dağarcığı oluşturur
- Günlük planla sık kullanılan kelimeleri ve ifadeleri öğrenme
- Temel kelimelerden ileri kelimelere adım adım ilerleme
- Kelimeleri anlam, telaffuz, yazım ve bağlamla kavrama
- Kelimeleri sadece tanımak yerine doğru kullanma

### Bilimsel tekrar sağlar
- Tekrarları doğal unutma düzenine göre planlama
- Zayıf ve sık hata yapılan kelimelere odaklanma
- Öğrenilmiş, yeni ve tekrar gerektiren kelimeleri ayırma
- Çalışma zamanını daha verimli kullanma

### Dinleme, okuma ve ifadeyi geliştirir
- Ses, yazım ve anlamı birleştirme
- Dinlerken kelimeleri daha hızlı tanıma
- Daha az kesintiyle okuma
- Konuşurken ve yazarken kelimeleri daha hızlı hatırlama

---

## Net öğrenme geri bildirimi

WordKing öğrenilen kelimeleri, tekrar durumunu ve ustalık seviyesini gösterir. Böylece kullanıcı planını düzenleyebilir ve motivasyonunu koruyabilir.

---

## Kimler için uygun?

- Dil sınavlarına hazırlanan öğrenciler
- $language geliştirmek isteyen kendi kendine öğrenenler
- Daha iyi iletişim kurmak isteyen profesyoneller
- Uzun vadeli kelime birikimi isteyenler
- Kısa günlük oturumlarla öğrenen yoğun kullanıcılar

---

## Neden WordKing?

> WordKing kullanıcıların $language dilini hatırlamasına, anlamasına ve güvenle kullanmasına yardımcı olur.

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

dil öğrenme uygulaması, $language öğrenme, kelime uygulaması, akıllı tekrar, WordKing
"@ }
        "Tamil" { return @"
# WordKing — $language திறனை மேம்படுத்தும் புத்திசாலி கற்றல் கருவி

**WordKing** என்பது சொற்களை மனப்பாடம் செய்யும் செயலி மட்டும் அல்ல. சொற்களஞ்சியம், அறிவியல் மீளாய்வு, பலவகை பயிற்சி மற்றும் தெளிவான முன்னேற்றத் தகவல் மூலம் பயனர்கள் $language திறனை மேம்படுத்த உதவும் கற்றல் அமைப்பு.

---

## WordKing $language கற்றலை எப்படி உதவுகிறது

### பயனுள்ள சொற்களஞ்சியம் உருவாக்குதல்
- தினசரி திட்டத்துடன் பொதுவான சொற்களையும் பயன்பாட்டு சொற்றொடர்களையும் கற்றல்
- அடிப்படை சொற்களிலிருந்து மேம்பட்ட சொற்களுக்கு படிப்படியாக செல்லுதல்
- பொருள், உச்சரிப்பு, எழுத்து மற்றும் சூழல் மூலம் சொற்களைப் புரிதல்
- அறிந்த சொற்களை பயன்படுத்தக்கூடிய சொற்களாக மாற்றுதல்

### அறிவியல் மீளாய்வு
- இயல்பான மறப்பின் அடிப்படையில் மீளாய்வு அமைத்தல்
- பலவீனமான மற்றும் அடிக்கடி தவறும் சொற்களில் கவனம் செலுத்துதல்
- கற்றவை, புதியவை, மீண்டும் பார்க்க வேண்டியவை என பிரித்தல்
- கற்றல் நேரத்தை பயனுள்ளதாக பயன்படுத்துதல்

### கேட்கும், படிக்கும், வெளிப்படுத்தும் திறன்
- ஒலி, எழுத்து, பொருள் ஆகியவற்றை இணைத்தல்
- கேட்கும்போது சொற்களை வேகமாக அடையாளம் காணுதல்
- படிப்பில் தடைகள் குறைத்தல்
- பேசும்போதும் எழுதும்போதும் சொற்களை விரைவாக நினைவுகூருதல்

---

## தெளிவான கற்றல் பின்னூட்டம்

WordKing கற்ற சொற்கள், மீளாய்வு நிலை மற்றும் தேர்ச்சி அளவை காட்டுகிறது. இதன் மூலம் பயனர் தன் திட்டத்தை சரிசெய்ய முடியும்.

---

## யாருக்கு பொருத்தமானது

- மொழித் தேர்வுக்கு தயாராகும் மாணவர்கள்
- $language மேம்படுத்த விரும்பும் சுயகற்றவர்கள்
- நல்ல தொடர்பாடல் தேவைப்படும் தொழில்முறை பயனர்கள்
- நீண்ட காலமாக சொற்களஞ்சியம் வளர்க்கும் கற்றவர்கள்
- குறுகிய நேரத்தில் தினமும் கற்றுக்கொள்ளும் பயனர்கள்

---

## ஏன் WordKing?

> WordKing பயனர்கள் $language நினைவில் கொள்ளவும், புரிந்துகொள்ளவும், நம்பிக்கையுடன் பயன்படுத்தவும் உதவுகிறது.

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

மொழி கற்றல் செயலி, $language கற்றல், சொற்களஞ்சியம், புத்திசாலி மீளாய்வு, WordKing
"@ }
        "Telugu" { return @"
# WordKing — $language నైపుణ్యాలను మెరుగుపరచే స్మార్ట్ లెర్నింగ్ టూల్

**WordKing** కేవలం పదాలు గుర్తుపెట్టుకునే యాప్ కాదు. పదసంపద పెంపు, శాస్త్రీయ పునశ్చరణ, విభిన్న సాధన మరియు స్పష్టమైన పురోగతి సమాచారంతో వినియోగదారుల $language నైపుణ్యాలను మెరుగుపరచే వ్యవస్థ.

---

## WordKing $language నేర్చుకోవడంలో ఎలా సహాయపడుతుంది

### ఉపయోగకరమైన పదసంపద నిర్మాణం
- రోజువారీ ప్రణాళికతో సాధారణ పదాలు మరియు ఉపయోగకరమైన వ్యక్తీకరణలు నేర్చుకోండి
- ప్రాథమిక పదాల నుంచి మెరుగైన పదాలకు దశలవారీగా వెళ్లండి
- అర్థం, ఉచ్చారణ, స్పెల్లింగ్ మరియు సందర్భంతో పదాలను అర్థం చేసుకోండి
- తెలిసిన పదాలను ఉపయోగించగల పదాలుగా మార్చండి

### శాస్త్రీయ పునశ్చరణ
- సహజమైన మరచిపోవు విధానానికి అనుగుణంగా పునశ్చరణ చేయండి
- బలహీనమైన లేదా తరచూ తప్పే పదాలపై దృష్టి పెట్టండి
- నేర్చుకున్న, కొత్త, మళ్లీ చూడాల్సిన పదాలను వేరు చేయండి
- అధ్యయన సమయాన్ని సమర్థవంతంగా ఉపయోగించండి

### వినడం, చదవడం, వ్యక్తీకరణ
- శబ్దం, వ్రాత మరియు అర్థాన్ని కలపండి
- వినేటప్పుడు పదాలను త్వరగా గుర్తించండి
- చదవడంలో అంతరాయాలు తగ్గించండి
- మాట్లాడేటప్పుడు, వ్రాసేటప్పుడు పదాలను త్వరగా గుర్తుకు తెచ్చుకోండి

---

## స్పష్టమైన అభ్యాస ఫీడ్‌బ్యాక్

WordKing నేర్చుకున్న పదాలు, పునశ్చరణ స్థితి మరియు ప్రావీణ్యాన్ని చూపిస్తుంది. దీంతో వినియోగదారు తన అభ్యాస ప్రణాళికను సరిచేయగలడు.

---

## ఎవరికీ ఉపయోగం

- భాషా పరీక్షలకు సిద్ధమవుతున్న విద్యార్థులు
- $language మెరుగుపరుచుకోవాలనుకునే స్వయంకర్తలు
- మెరుగైన కమ్యూనికేషన్ అవసరమైన వృత్తి నిపుణులు
- దీర్ఘకాలిక పదసంపదను నిర్మించే అభ్యాసకులు
- చిన్న రోజువారీ సెషన్లలో నేర్చుకునే బిజీ వినియోగదారులు

---

## ఎందుకు WordKing?

> WordKing వినియోగదారులు $language ను గుర్తుంచుకోవడానికి, అర్థం చేసుకోవడానికి మరియు నమ్మకంగా ఉపయోగించడానికి సహాయపడుతుంది.

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

భాష నేర్చుకునే యాప్, $language నేర్చుకోవడం, పదసంపద, స్మార్ట్ పునశ్చరణ, WordKing
"@ }
        "Urdu" { return @"
# WordKing — $language مہارت بہتر بنانے کا اسمارٹ لرننگ ٹول

**WordKing** صرف الفاظ یاد کرنے والی ایپ نہیں ہے۔ یہ ایک تعلیمی نظام ہے جو الفاظ کے ذخیرے، سائنسی دہرائی، مختلف مشقوں اور واضح پیش رفت کے ذریعے صارفین کو $language بہتر بنانے میں مدد دیتا ہے۔

---

## WordKing $language کیسے بہتر بناتا ہے

### مفید الفاظ کا ذخیرہ بنائیں
- روزانہ منصوبے کے ساتھ عام الفاظ اور عملی جملے سیکھیں
- بنیادی الفاظ سے آہستہ آہستہ اعلی سطح تک جائیں
- معنی، تلفظ، ہجے اور سیاق و سباق سے الفاظ سمجھیں
- الفاظ کو صرف پہچاننے کے بجائے درست استعمال کرنا سیکھیں

### سائنسی دہرائی
- بھولنے کے فطری انداز کے مطابق دہرائی کریں
- کمزور اور بار بار غلط ہونے والے الفاظ پر توجہ دیں
- سیکھے ہوئے، نئے اور دہرائی کے الفاظ الگ رکھیں
- مطالعے کا وقت زیادہ مؤثر بنائیں

### سننا، پڑھنا اور اظہار بہتر کریں
- آواز، ہجے اور معنی کو جوڑیں
- سنتے وقت الفاظ جلد پہچانیں
- پڑھتے وقت رکاوٹیں کم کریں
- بولتے اور لکھتے وقت الفاظ جلد یاد کریں

---

## واضح تعلیمی فیڈ بیک

WordKing دکھاتا ہے کہ کون سے الفاظ سیکھے گئے، کون سے مضبوط ہیں، کنہیں دہرائی چاہیے، اور وقت کے ساتھ ذخیرہ الفاظ کیسے بڑھ رہا ہے۔

---

## کن کے لیے موزوں ہے

- زبان کے امتحان کی تیاری کرنے والے طلبہ
- $language بہتر بنانے والے خود سیکھنے والے
- بہتر رابطہ چاہتے پیشہ ور افراد
- طویل مدت تک الفاظ جمع کرنے والے سیکھنے والے
- مصروف صارفین جو مختصر نشستوں میں پڑھتے ہیں

---

## WordKing کیوں؟

> WordKing صارفین کو $language یاد رکھنے، سمجھنے اور اعتماد سے استعمال کرنے میں مدد دیتا ہے۔

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

زبان سیکھنے کی ایپ, $language سیکھنا, الفاظ, اسمارٹ دہرائی, WordKing
"@ }
        "Vietnamese" { return @"
# WordKing — Công cụ thông minh giúp cải thiện kỹ năng $language

**WordKing** không chỉ là ứng dụng học từ vựng. Đây là hệ thống học tập giúp người dùng nâng cao $language thông qua mở rộng vốn từ, ôn tập khoa học, luyện tập đa dạng và dữ liệu tiến bộ rõ ràng.

---

## WordKing giúp cải thiện $language như thế nào

### Xây dựng vốn từ hữu ích
- Học từ thường gặp và cụm từ thực tế theo kế hoạch hằng ngày
- Đi từ từ vựng cơ bản đến nâng cao từng bước
- Hiểu từ qua nghĩa, phát âm, chính tả và ngữ cảnh
- Biến từ đã nhận biết thành từ có thể sử dụng

### Ghi nhớ lâu hơn bằng ôn tập khoa học
- Sắp xếp ôn tập theo quy luật quên tự nhiên
- Tập trung vào từ yếu hoặc hay trả lời sai
- Phân loại từ đã nhớ, từ mới và từ cần ôn lại
- Sử dụng thời gian học hiệu quả hơn

### Cải thiện nghe, đọc và diễn đạt
- Kết nối âm thanh, cách viết và ý nghĩa
- Nhận ra từ nhanh hơn khi nghe
- Đọc ít bị gián đoạn hơn
- Nhớ từ nhanh hơn khi nói và viết

---

## Phản hồi học tập rõ ràng

WordKing theo dõi tiến độ, trạng thái ôn tập và mức độ ghi nhớ. Người dùng biết mình đã học gì, cần ôn gì và vốn từ tăng lên như thế nào theo thời gian.

---

## WordKing phù hợp với ai

- Học sinh chuẩn bị cho kỳ thi ngôn ngữ
- Người tự học muốn cải thiện $language
- Người đi làm cần giao tiếp tốt hơn
- Người học muốn tích lũy từ vựng lâu dài
- Người bận rộn học bằng các phiên ngắn mỗi ngày

---

## Vì sao chọn WordKing?

> WordKing giúp người dùng ghi nhớ, hiểu và sử dụng $language tự tin hơn.

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

ứng dụng học ngôn ngữ, học $language, từ vựng, ôn tập thông minh, WordKing
"@ }
        default { return @"
# WordKing — A Smart Tool for Improving $language Language Skills

**WordKing** is more than a vocabulary app. It is a practical learning system that helps users build stronger $language skills through vocabulary growth, scientific review, varied practice, and clear learning feedback.

Whether users are preparing for exams, improving work communication, or building long-term language ability, WordKing turns short study sessions into steady progress.

---

## How WordKing Helps Users Improve $language

### Build useful vocabulary
- Learn frequent words and practical expressions with a daily plan
- Move from basic words to advanced vocabulary step by step
- Understand words through meaning, pronunciation, spelling, and context
- Reduce the gap between recognizing words and using them correctly

### Review scientifically
- Schedule review according to natural forgetting patterns
- Focus on weak, new, and often-missed words
- Separate mastered words from words that need more practice
- Spend study time on the content that matters most

### Improve listening, reading, and expression
- Connect sound, spelling, and meaning
- Recognize words faster while listening
- Read with fewer interruptions
- Recall words more quickly when speaking and writing

---

## Clear Learning Feedback

WordKing tracks progress, review status, and vocabulary mastery. Users can see what they learned, what they remember well, what needs review, and how their vocabulary grows over time.

This feedback helps users adjust their plan and stay motivated.

---

## Who WordKing Is For

- Students preparing for language exams
- Self-learners improving $language skills
- Professionals who need stronger communication
- Learners building vocabulary over the long term
- Busy users who study in short daily sessions

---

## Why Choose WordKing?

> WordKing helps users remember, understand, and use $language with more confidence.

With scientific review, consistent practice, and visible progress, WordKing makes language learning easier to continue.

---

## Start Now

Download **WordKing** and improve vocabulary, listening, speaking, reading, and writing with a smarter learning method.

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

language learning app, $language learning, vocabulary app, smart word review, WordKing
"@ }
    }
}

$sourceDirs = Get-ChildItem -LiteralPath $repoRoot -Directory |
    Where-Object { $excludedRootDirs -notcontains $_.Name } |
    Sort-Object Name

$created = 0
$skipped = 0
foreach ($source in $sourceDirs) {
    $targetDirs = Get-ChildItem -LiteralPath $source.FullName -Directory | Sort-Object Name
    foreach ($target in $targetDirs) {
        $path = Join-Path $target.FullName "$Date.md"
        if (Test-Path -LiteralPath $path) {
            $skipped++
            continue
        }

        $language = LearnName $source.Name $target.Name
        Write-Utf8File $path (Article $target.Name $language)
        $created++
    }
}

Write-Host "Created $created files; skipped $skipped existing files."
