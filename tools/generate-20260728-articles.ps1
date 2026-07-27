param(
    [string] $Date = "20260728",
    [switch] $Overwrite
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$excludedRootDirs = @(".git", "assets", "tools")

$learnNamesZh = @{
    Afrikaans="南非语"; Arabic="阿拉伯语"; Bengali="孟加拉语"; Bulgarian="保加利亚语"; Chinese="中文"; Czech="捷克语"; Danish="丹麦语"; Dutch="荷兰语"; English="英语"; Filipino="菲律宾语"; Finnish="芬兰语"; French="法语"; German="德语"; Greek="希腊语"; Hindi="印地语"; Hungarian="匈牙利语"; Indonesian="印尼语"; Italian="意大利语"; Japanese="日语"; Kazakh="哈萨克语"; Korean="韩语"; Latin="拉丁语"; Latvian="拉脱维亚语"; Lithuanian="立陶宛语"; Malay="马来语"; Norwegian="挪威语"; Persian="波斯语"; Polish="波兰语"; Portugues_Brazil="巴西葡萄牙语"; Portuguese="葡萄牙语"; Romanian="罗马尼亚语"; Russian="俄语"; Serbian="塞尔维亚语"; Spanish="西班牙语"; Swahili="斯瓦希里语"; Swedish="瑞典语"; Thai="泰语"; Turkish="土耳其语"; Uzbek="乌兹别克语"; Vietnamese="越南语"
}

$learnNamesZhTw = @{
    Afrikaans="南非語"; Arabic="阿拉伯語"; Bengali="孟加拉語"; Bulgarian="保加利亞語"; Chinese="中文"; Czech="捷克語"; Danish="丹麥語"; Dutch="荷蘭語"; English="英語"; Filipino="菲律賓語"; Finnish="芬蘭語"; French="法語"; German="德語"; Greek="希臘語"; Hindi="印地語"; Hungarian="匈牙利語"; Indonesian="印尼語"; Italian="義大利語"; Japanese="日語"; Kazakh="哈薩克語"; Korean="韓語"; Latin="拉丁語"; Latvian="拉脫維亞語"; Lithuanian="立陶宛語"; Malay="馬來語"; Norwegian="挪威語"; Persian="波斯語"; Polish="波蘭語"; Portugues_Brazil="巴西葡萄牙語"; Portuguese="葡萄牙語"; Romanian="羅馬尼亞語"; Russian="俄語"; Serbian="塞爾維亞語"; Spanish="西班牙語"; Swahili="斯瓦希里語"; Swedish="瑞典語"; Thai="泰語"; Turkish="土耳其語"; Uzbek="烏茲別克語"; Vietnamese="越南語"
}

function LabelName([string] $value) { $value -replace "_", " " }

function LearnName([string] $source, [string] $target) {
    if ($target -eq "Traditional_Chinese") {
        if ($learnNamesZhTw.ContainsKey($source)) { return $learnNamesZhTw[$source] }
    }

    if ($target -eq "Chinese") {
        if ($learnNamesZh.ContainsKey($source)) { return $learnNamesZh[$source] }
    }

    return (LabelName $source)
}

function Write-Utf8File([string] $path, [string] $content) {
    $utf8NoBom = New-Object System.Text.UTF8Encoding $false
    [System.IO.File]::WriteAllText($path, $content, $utf8NoBom)
}

function GoogleTag() {
    return @"
<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-BS3LL1VXYN"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-BS3LL1VXYN');
</script>
"@
}

function ChineseArticle([string] $language) {
    return @"
# 如何学习${language}：用 WordKing 把词汇变成真正的语言能力

${language}学习不是只记几个单词、背几条语法规则就能完成的事情。真正有效的学习，需要把发音、词汇、句型、阅读、听力和表达逐步连接起来。学习者需要持续接触${language}的语音节奏、常用词汇、核心句型和真实语境，才能从“看懂解释”走向“自然使用”。

**WordKing** 可以作为${language}学习中的词汇核心工具，帮助学习者每天稳定积累单词，通过复习、练习和数据反馈，让词汇不只是短暂记住，而是逐渐变成阅读、听力、口语和写作中可以调用的能力。

---

## 学习${language}应该从哪里开始

### 先建立发音和拼写意识
学习初期不要只看中文释义，还要同时听发音、模仿音节节奏，并注意常见拼写和发音规律。把声音和单词一起记住，后续听力和口语会轻松很多。

### 优先掌握高频基础词
最重要的不是一次性背很多冷门词，而是先掌握生活、学习、工作和交流中最常见的词汇。高频词越稳定，阅读短文、听懂日常对话、理解例句和学习语法时就越顺畅。

### 在例句中理解词汇
单词不能只记一个中文意思。很多词在不同语境中会有不同用法，也会和固定搭配一起出现。通过例句学习，可以同时理解词义、词序和真实表达方式，避免“认识单词却不会用”的问题。

### 把语法放进真实表达里
学习语法时，可以结合已经学过的词汇造句、读句子、做替换练习，让规则变成可操作的表达习惯。词汇和语法一起练，语言能力会更稳。

### 每天小步复习
外语学习最怕只学新内容、不复习旧内容。每天安排固定时间复习旧词，再学习少量新词，比短时间突击更适合长期坚持。

---

## WordKing 如何帮助学习${language}

### 让词汇学习更系统
WordKing 可以帮助学习者按照计划积累${language}词汇，从基础词到进阶表达循序渐进。学习时可以结合释义、发音、例句和练习，不再只是机械地把单词和中文意思连在一起。

### 让复习更符合记忆规律
很多人背单词失败，不是因为不努力，而是复习节奏不稳定。WordKing 会根据学习进度和掌握情况安排复习，让容易忘的词得到更多练习，已经熟悉的词减少无效重复，帮助记忆更持久。

### 让薄弱词更容易被发现
有些词看起来熟悉，但一到听力、拼写或表达时就想不起来。WordKing 通过测试和练习记录学习表现，帮助用户发现这些“半掌握”的词，并进行针对性巩固。

### 让碎片时间真正有效
通勤、午休、睡前都可以用来完成一小组词汇学习。WordKing 把学习任务拆成更容易完成的小步骤，让用户不必等到有大块时间才开始学习，也更容易保持每天接触${language}的习惯。

---

## 使用 WordKing 学${language}的建议

### 每天固定一个小目标
可以从每天学习 10 到 20 个新词开始，同时完成当天复习任务。目标不要一开始设得太大，先让自己形成稳定节奏，再逐步增加学习量。

### 新词和复习都要做
只学新词会带来短暂成就感，但长期效果有限。建议每天先完成 WordKing 安排的复习，再学习新单词。这样可以保证旧词不断巩固，新词也能慢慢进入长期记忆。

### 多关注例句和发音
学习单词时，不要只看解释。尽量听发音、读例句、观察单词在句子中的位置和搭配。这样背下来的词更容易在真实阅读和表达中使用。

### 定期回看学习数据
WordKing 的学习记录可以帮助用户看到自己学了多少、掌握了多少、哪些词还需要加强。定期查看数据，能让学习计划更清晰，也能减少“学了很久却不知道有没有进步”的焦虑。

---

## WordKing 在外语学习中的优点

### 更清晰
学习进度、复习任务和掌握情况都能被记录下来。用户可以知道自己今天该学什么、该复习什么，而不是凭感觉随便翻单词。

### 更科学
WordKing 重视复习和巩固，帮助学习者按照记忆规律反复接触词汇。对需要长期积累的语言来说，科学复习比临时突击更重要。

### 更适合坚持
每天完成少量任务，就能不断积累词汇量。WordKing 适合自学者、备考者、出国生活或工作需要${language}的人，也适合希望用碎片时间保持学习节奏的用户。

### 更接近真实能力提升
背单词的最终目的不是在软件里完成数量，而是在阅读时更少查词、听力时更快反应、说话和写作时更容易找到表达。WordKing 通过识记、复习、测试和反馈，帮助词汇逐步转化为真实语言能力。

---

## 立即开始学习${language}

如果你正在学习${language}，或者准备从零开始建立${language}词汇基础，可以从每天一点点开始。下载 **WordKing**，用更系统、更科学、更容易坚持的方法，把单词真正学会。

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

${language}学习, 如何学习${language}, ${language}背单词, WordKing, 外语学习工具, 背单词app推荐, ${language}词汇, 科学复习单词, ${language}入门, 提高${language}能力
"@
}

function TraditionalChineseArticle([string] $language) {
    return @"
# 如何學習${language}：用 WordKing 把詞彙變成真正的語言能力

${language}學習不是只記幾個單字、背幾條文法規則就能完成的事情。真正有效的學習，需要把發音、詞彙、句型、閱讀、聽力和表達逐步連接起來。學習者需要持續接觸${language}的語音節奏、常用詞彙、核心句型和真實語境，才能從「看懂解釋」走向「自然使用」。

**WordKing** 可以作為${language}學習中的詞彙核心工具，幫助學習者每天穩定累積單字，透過複習、練習和學習資料回饋，讓詞彙不只是短暫記住，而是逐漸變成閱讀、聽力、口說和寫作中可以調用的能力。

---

## 學習${language}應該從哪裡開始

### 先建立發音和拼寫意識
學習初期不要只看母語解釋，也要同時聽發音、模仿音節節奏，並注意常見拼寫和發音規律。把聲音和單字一起記住，後續聽力和口說會輕鬆很多。

### 優先掌握高頻基礎詞
最重要的不是一次背很多冷門詞，而是先掌握生活、學習、工作和交流中最常見的詞彙。高頻詞越穩定，閱讀短文、聽懂日常對話、理解例句和學習文法時就越順暢。

### 在例句中理解詞彙
單字不能只記一個意思。很多詞在不同語境中會有不同用法，也會和固定搭配一起出現。透過例句學習，可以同時理解詞義、詞序和真實表達方式，避免「認識單字卻不會用」的問題。

### 把文法放進真實表達裡
學習文法時，可以結合已經學過的詞彙造句、讀句子、做替換練習，讓規則變成可操作的表達習慣。詞彙和文法一起練，語言能力會更穩。

### 每天小步複習
外語學習最怕只學新內容、不複習舊內容。每天安排固定時間複習舊詞，再學習少量新詞，比短時間突擊更適合長期堅持。

---

## WordKing 如何幫助學習${language}

### 讓詞彙學習更系統
WordKing 可以幫助學習者按照計畫累積${language}詞彙，從基礎詞到進階表達循序漸進。學習時可以結合釋義、發音、例句和練習，不再只是機械地把單字和意思連在一起。

### 讓複習更符合記憶規律
很多人背單字失敗，不是因為不努力，而是複習節奏不穩定。WordKing 會根據學習進度和掌握情況安排複習，讓容易忘的詞得到更多練習，已經熟悉的詞減少無效重複，幫助記憶更持久。

### 讓薄弱詞更容易被發現
有些詞看起來熟悉，但一到聽力、拼寫或表達時就想不起來。WordKing 透過測試和練習記錄學習表現，幫助使用者發現這些「半掌握」的詞，並進行針對性鞏固。

### 讓碎片時間真正有效
通勤、午休、睡前都可以用來完成一小組詞彙學習。WordKing 把學習任務拆成更容易完成的小步驟，讓使用者不必等到有大塊時間才開始學習，也更容易保持每天接觸${language}的習慣。

---

## 使用 WordKing 學${language}的建議

### 每天固定一個小目標
可以從每天學習 10 到 20 個新詞開始，同時完成當天複習任務。目標不要一開始設得太大，先讓自己形成穩定節奏，再逐步增加學習量。

### 新詞和複習都要做
只學新詞會帶來短暫成就感，但長期效果有限。建議每天先完成 WordKing 安排的複習，再學習新單字。這樣可以保證舊詞不斷鞏固，新詞也能慢慢進入長期記憶。

### 多關注例句和發音
學習單字時，不要只看解釋。盡量聽發音、讀例句、觀察單字在句子中的位置和搭配。這樣背下來的詞更容易在真實閱讀和表達中使用。

### 定期回看學習資料
WordKing 的學習記錄可以幫助使用者看到自己學了多少、掌握了多少、哪些詞還需要加強。定期查看資料，能讓學習計畫更清晰，也能減少「學了很久卻不知道有沒有進步」的焦慮。

---

## WordKing 在外語學習中的優點

### 更清晰
學習進度、複習任務和掌握情況都能被記錄下來。使用者可以知道自己今天該學什麼、該複習什麼，而不是憑感覺隨便翻單字。

### 更科學
WordKing 重視複習和鞏固，幫助學習者按照記憶規律反覆接觸詞彙。對需要長期累積的語言來說，科學複習比臨時突擊更重要。

### 更適合堅持
每天完成少量任務，就能不斷累積詞彙量。WordKing 適合自學者、備考者、出國生活或工作需要${language}的人，也適合希望用碎片時間保持學習節奏的使用者。

### 更接近真實能力提升
背單字的最終目的不是在軟體裡完成數量，而是在閱讀時更少查詞、聽力時更快反應、說話和寫作時更容易找到表達。WordKing 透過識記、複習、測試和回饋，幫助詞彙逐步轉化為真實語言能力。

---

## 立即開始學習${language}

如果你正在學習${language}，或者準備從零開始建立${language}詞彙基礎，可以從每天一點點開始。下載 **WordKing**，用更系統、更科學、更容易堅持的方法，把單字真正學會。

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

${language}學習, 如何學習${language}, ${language}背單字, WordKing, 外語學習工具, 背單字app推薦, ${language}詞彙, 科學複習單字, ${language}入門, 提高${language}能力
"@
}

function EnglishArticle([string] $language) {
    return @"
# How to Learn ${language}: Use WordKing to Turn Vocabulary Into Real Language Ability

Learning $language is not only about memorizing isolated words or reading grammar rules. Effective learning connects pronunciation, vocabulary, sentence patterns, reading, listening, speaking, and writing. Learners need regular contact with sounds, common words, core structures, and real examples before knowledge becomes natural use.

**WordKing** can serve as the vocabulary center of a $language learning routine. It helps learners build words steadily, review them scientifically, practice them in multiple ways, and track progress clearly, so vocabulary becomes a real skill instead of a short-term memory task.

---

## Where to Start When Learning $language

### Build pronunciation and spelling awareness
At the beginning, do not only read translations. Listen to pronunciation, repeat words aloud, and notice common spelling and sound patterns. Connecting sound and meaning early makes listening and speaking easier later.

### Learn high-frequency words first
The fastest progress comes from mastering words that appear often in daily life, study, work, and communication. A stable base of frequent words makes reading, listening, grammar study, and sentence practice much smoother.

### Understand words through example sentences
A word is rarely just one dictionary meaning. Example sentences show how a word behaves in context, what it combines with, and how it appears in real expression. This helps learners move from recognition to active use.

### Put grammar into real expression
Grammar becomes useful when it is practiced with words you already know. Read sentences, make substitutions, and build short expressions. This turns rules into habits.

### Review a little every day
Language learning depends on review. Studying only new words creates quick progress that fades quickly. A small daily routine of review plus a few new words is more sustainable than occasional intensive study.

---

## How WordKing Helps With $language

### More systematic vocabulary learning
WordKing helps learners build $language vocabulary with a clear plan, moving from basic words to more advanced expressions. Users can study meaning, pronunciation, examples, and exercises together instead of memorizing words mechanically.

### Review that follows memory patterns
Many learners forget words because their review rhythm is unstable. WordKing arranges review according to learning progress and mastery, giving more practice to weak words and reducing unnecessary repetition for familiar words.

### Easier discovery of weak words
Some words feel familiar until you need to hear, spell, speak, or write them. WordKing uses practice and testing records to reveal these half-learned words and bring them back for focused review.

### Better use of short study sessions
Commuting, breaks, and bedtime can all become useful moments for vocabulary review. WordKing breaks learning into small tasks, making it easier to keep daily contact with $language.

---

## Tips for Learning $language With WordKing

### Set a small daily goal
Start with 10 to 20 new words a day while completing review tasks. A realistic goal is easier to keep, and consistency matters more than a large one-day target.

### Balance new words and review
New words create momentum, but review creates long-term memory. Complete WordKing review tasks first, then add new vocabulary.

### Pay attention to pronunciation and examples
Do not stop at the translation. Listen, read examples, and notice how words are used in sentences. This makes vocabulary easier to use in real reading and expression.

### Check learning data regularly
WordKing records progress, review status, and mastery. Looking at the data helps learners see what has improved, what still needs practice, and how their vocabulary is growing over time.

---

## Advantages of WordKing in Foreign Language Learning

### Clearer
Progress, review tasks, and mastery are visible. Learners know what to study today and what to review next.

### More scientific
WordKing emphasizes review and consolidation. For long-term language learning, well-timed review is more valuable than short bursts of memorization.

### Easier to keep
Small daily tasks help learners continue even with limited time. WordKing fits self-study, exam preparation, travel, work, and long-term language goals.

### Closer to real ability
The goal of vocabulary learning is not only to finish a word list. It is to read with fewer interruptions, react faster while listening, and find words more easily when speaking or writing. WordKing helps vocabulary gradually become usable language ability.

---

## Start Learning $language Today

If you are learning $language or building a vocabulary base from the beginning, start with a small daily routine. Download **WordKing** and learn words in a more systematic, scientific, and sustainable way.

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

$language learning, how to learn $language, $language vocabulary, WordKing, language learning app, vocabulary app, smart word review, learn $language, improve $language skills
"@
}

function Article([string] $target, [string] $language) {
    switch ($target) {
        "Chinese" { return ChineseArticle $language }
        "Traditional_Chinese" { return TraditionalChineseArticle $language }
        "English" { return EnglishArticle $language }
        "French" { return @"
# Comment apprendre le $language avec WordKing

Apprendre le $language ne consiste pas seulement à mémoriser des mots. Il faut relier la prononciation, le vocabulaire, les phrases, la lecture, l'écoute et l'expression. Avec une routine régulière, les mots deviennent peu à peu une vraie capacité d'utilisation.

**WordKing** aide à construire cette base de vocabulaire avec un plan clair, des révisions régulières, des exercices variés et un suivi des progrès.

---

## Bien commencer

### Apprendre les mots fréquents
Commencez par les mots utiles dans la vie quotidienne, les études, le travail et les conversations. Un vocabulaire fréquent bien maîtrisé rend la lecture et l'écoute beaucoup plus faciles.

### Étudier avec des exemples
Un mot prend son vrai sens dans une phrase. Les exemples montrent les associations naturelles, l'ordre des mots et les usages réels.

### Réviser chaque jour
Les nouveaux mots s'oublient vite sans révision. WordKing aide à revoir les mots au bon moment et à renforcer ceux qui restent fragiles.

---

## Les avantages de WordKing

- Un apprentissage plus clair grâce au suivi des progrès
- Une mémorisation plus durable grâce aux révisions
- Des exercices adaptés aux petites sessions quotidiennes
- Une meilleure transition entre vocabulaire passif et expression active

---

## Commencer maintenant

Téléchargez **WordKing** et utilisez une méthode plus systématique pour apprendre le $language.

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

apprendre le $language, vocabulaire $language, application de vocabulaire, WordKing, apprentissage des langues
"@ }
        "Spanish" { return @"
# Cómo aprender $language con WordKing

Aprender $language no consiste solo en memorizar palabras. Para avanzar de verdad, hay que conectar pronunciación, vocabulario, frases, lectura, escucha y expresión. Con práctica constante, las palabras dejan de ser memoria temporal y se convierten en habilidad real.

**WordKing** ayuda a crear una rutina clara de vocabulario con estudio planificado, repaso inteligente, ejercicios variados y datos de progreso.

---

## Por dónde empezar

### Aprende palabras frecuentes
Empieza por las palabras que aparecen en la vida diaria, el estudio, el trabajo y la comunicación. Una base sólida hace que leer y escuchar sea mucho más fácil.

### Usa frases de ejemplo
Las frases muestran cómo se usa una palabra en contexto, con qué se combina y cómo aparece en expresiones reales.

### Repasa todos los días
Sin repaso, los nuevos términos se olvidan rápido. WordKing ayuda a revisar en el momento adecuado y dedica más práctica a las palabras débiles.

---

## Ventajas de WordKing

- Progreso claro y fácil de seguir
- Repaso basado en la memoria a largo plazo
- Sesiones pequeñas para estudiar cada día
- Mejor conexión entre reconocer palabras y usarlas al hablar o escribir

---

## Empieza ahora

Descarga **WordKing** y aprende $language con un método más sistemático y sostenible.

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

aprender $language, vocabulario $language, app para aprender idiomas, WordKing, repaso inteligente
"@ }
        "German" { return @"
# Wie man $language mit WordKing lernt

$language zu lernen bedeutet mehr als einzelne Wörter auswendig zu lernen. Wirklicher Fortschritt entsteht, wenn Aussprache, Wortschatz, Satzmuster, Lesen, Hören und Ausdruck zusammen trainiert werden.

**WordKing** unterstützt diesen Prozess mit geplantem Wortschatzlernen, regelmäßiger Wiederholung, abwechslungsreichen Übungen und klaren Fortschrittsdaten.

---

## Der richtige Einstieg

### Häufige Wörter zuerst lernen
Beginnen Sie mit Wörtern, die im Alltag, beim Lernen, bei der Arbeit und in Gesprächen oft vorkommen. Eine stabile Basis macht Texte und Hörmaterial leichter verständlich.

### Wörter in Beispielsätzen lernen
Sätze zeigen, wie Wörter wirklich verwendet werden. So erkennt man typische Verbindungen, Wortstellung und natürliche Ausdrücke.

### Jeden Tag wiederholen
Neue Wörter verschwinden schnell aus dem Gedächtnis, wenn sie nicht wiederholt werden. WordKing hilft, schwache Wörter rechtzeitig zu festigen.

---

## Vorteile von WordKing

- Klare Lernziele und sichtbarer Fortschritt
- Wissenschaftlich orientierte Wiederholung
- Kurze tägliche Lerneinheiten
- Bessere Umwandlung von passivem Wortschatz in aktive Sprachfähigkeit

---

## Jetzt starten

Laden Sie **WordKing** herunter und lernen Sie $language mit einer systematischeren Methode.

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

$language lernen, Wortschatz lernen, Sprachlern-App, WordKing, intelligente Wiederholung
"@ }
        "Russian" { return @"
# Как изучать $language с помощью WordKing

Изучение $language — это не только запоминание отдельных слов. Важно связывать произношение, словарный запас, фразы, чтение, аудирование и активное выражение. Так слова постепенно превращаются в настоящую языковую способность.

**WordKing** помогает учить лексику по плану, регулярно повторять материал, выполнять разные упражнения и видеть прогресс.

---

## С чего начать

### Учите частотные слова
Начните со слов, которые часто встречаются в быту, учебе, работе и общении. Прочная база помогает быстрее читать и лучше понимать речь на слух.

### Учите слова в примерах
Предложения показывают реальное употребление слова, его сочетания и место в фразе.

### Повторяйте каждый день
Без повторения новые слова быстро забываются. WordKing помогает вовремя возвращаться к слабым словам и закреплять их.

---

## Преимущества WordKing

- Понятный план и видимый прогресс
- Повторение с учетом долговременной памяти
- Короткие ежедневные занятия
- Переход от пассивного узнавания слов к активному использованию

---

## Начните сейчас

Скачайте **WordKing** и изучайте $language более системно и устойчиво.

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

изучать $language, словарь $language, приложение для слов, WordKing, умное повторение
"@ }
        "Arabic" { return @"
# كيف تتعلم $language باستخدام WordKing

تعلم $language لا يعني حفظ كلمات منفصلة فقط. التقدم الحقيقي يحدث عندما تربط النطق والمفردات والجمل والقراءة والاستماع والتعبير في تدريب يومي منظم.

**WordKing** يساعد المتعلم على بناء المفردات بخطة واضحة، ومراجعة منتظمة، وتمارين متنوعة، وبيانات تقدم سهلة الفهم.

---

## من أين تبدأ

### تعلم الكلمات الشائعة أولا
ابدأ بالكلمات المستخدمة في الحياة اليومية والدراسة والعمل والمحادثة. المفردات الأساسية القوية تجعل القراءة والاستماع أسهل.

### تعلم الكلمات داخل الجمل
الأمثلة توضّح معنى الكلمة في السياق، وطريقة ارتباطها بكلمات أخرى، وكيفية استخدامها في التعبير الحقيقي.

### راجع كل يوم
الكلمات الجديدة تُنسى بسرعة من دون مراجعة. WordKing يساعدك على مراجعة الكلمات في الوقت المناسب والتركيز على الكلمات الضعيفة.

---

## مزايا WordKing

- خطة تعلم واضحة وتقدم مرئي
- مراجعة تساعد على الذاكرة طويلة المدى
- جلسات قصيرة مناسبة للتعلم اليومي
- تحويل المفردات من معرفة سلبية إلى استخدام فعلي

---

## ابدأ الآن

حمّل **WordKing** وتعلم $language بطريقة أكثر تنظيما واستمرارا.

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

تعلم $language, مفردات $language, تطبيق تعلم اللغات, WordKing, مراجعة ذكية
"@ }
        "Bengali" { return @"
# WordKing দিয়ে কীভাবে $language শেখা যায়

$language শেখা মানে শুধু আলাদা আলাদা শব্দ মুখস্থ করা নয়। উচ্চারণ, শব্দভান্ডার, বাক্য, পড়া, শোনা এবং প্রকাশকে একসঙ্গে অনুশীলন করলেই ভাষা সত্যিকারের দক্ষতায় পরিণত হয়।

**WordKing** পরিকল্পিত শব্দ শেখা, নিয়মিত রিভিউ, বিভিন্ন অনুশীলন এবং পরিষ্কার অগ্রগতির তথ্য দিয়ে শেখাকে সহজ করে।

---

## কোথা থেকে শুরু করবেন

### আগে বেশি ব্যবহৃত শব্দ শিখুন
দৈনন্দিন জীবন, পড়াশোনা, কাজ এবং কথোপকথনে ব্যবহৃত সাধারণ শব্দ দিয়ে শুরু করুন। মজবুত শব্দভান্ডার পড়া ও শোনা সহজ করে।

### উদাহরণ বাক্যে শব্দ শিখুন
উদাহরণ দেখায় শব্দটি বাস্তবে কীভাবে ব্যবহৃত হয়, কোন শব্দের সঙ্গে আসে এবং বাক্যে কী ভূমিকা রাখে।

### প্রতিদিন রিভিউ করুন
রিভিউ ছাড়া নতুন শব্দ দ্রুত ভুলে যায়। WordKing দুর্বল শব্দগুলোকে সময়মতো আবার অনুশীলনে আনে।

---

## WordKing-এর সুবিধা

- পরিষ্কার শেখার পরিকল্পনা
- দীর্ঘমেয়াদি স্মৃতির জন্য নিয়মিত রিভিউ
- ছোট দৈনিক অনুশীলন
- চেনা শব্দকে ব্যবহারযোগ্য শব্দে রূপান্তর

---

## এখনই শুরু করুন

**WordKing** ডাউনলোড করুন এবং আরও পদ্ধতিগতভাবে $language শিখুন।

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

$language শেখা, শব্দভান্ডার, ভাষা শেখার অ্যাপ, WordKing, স্মার্ট রিভিউ
"@ }
        "Hindi" { return @"
# WordKing के साथ $language कैसे सीखें

$language सीखना केवल अलग-अलग शब्द याद करना नहीं है। सही प्रगति तब होती है जब उच्चारण, शब्दावली, वाक्य, पढ़ना, सुनना और अभिव्यक्ति एक साथ अभ्यास में आते हैं।

**WordKing** योजनाबद्ध शब्द सीखने, नियमित दोहराव, अलग-अलग अभ्यास और स्पष्ट प्रगति डेटा के साथ सीखने को व्यवस्थित बनाता है।

---

## शुरुआत कैसे करें

### पहले सामान्य शब्द सीखें
दैनिक जीवन, पढ़ाई, काम और बातचीत में आने वाले शब्दों से शुरू करें। मजबूत आधार पढ़ने और सुनने को आसान बनाता है।

### उदाहरण वाक्यों से सीखें
उदाहरण बताते हैं कि शब्द वास्तविक संदर्भ में कैसे इस्तेमाल होता है और किन शब्दों के साथ आता है।

### हर दिन दोहराएं
दोहराव के बिना नए शब्द जल्दी भूल जाते हैं। WordKing कमजोर शब्दों को सही समय पर फिर से अभ्यास में लाता है।

---

## WordKing के लाभ

- स्पष्ट सीखने की योजना
- लंबी अवधि की स्मृति के लिए नियमित दोहराव
- छोटी दैनिक अध्ययन अवधि
- पहचाने गए शब्दों को सक्रिय उपयोग में बदलना

---

## अभी शुरू करें

**WordKing** डाउनलोड करें और $language को अधिक व्यवस्थित तरीके से सीखें।

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

$language सीखना, शब्दावली ऐप, भाषा सीखना, WordKing, स्मार्ट रिव्यू
"@ }
        "Italian" { return @"
# Come imparare $language con WordKing

Imparare $language non significa solo memorizzare parole isolate. Il progresso reale nasce collegando pronuncia, vocabolario, frasi, lettura, ascolto e produzione.

**WordKing** aiuta a costruire una routine di vocabolario con studio pianificato, ripasso regolare, esercizi diversi e dati chiari sui progressi.

---

## Da dove iniziare

### Impara prima le parole frequenti
Comincia dalle parole usate nella vita quotidiana, nello studio, nel lavoro e nella comunicazione. Una base solida rende più facile leggere e ascoltare.

### Studia con frasi di esempio
Le frasi mostrano come una parola viene usata davvero, con quali parole si combina e in quale contesto appare.

### Ripassa ogni giorno
Senza ripasso, le parole nuove si dimenticano in fretta. WordKing aiuta a rivederle al momento giusto.

---

## Vantaggi di WordKing

- Percorso di studio chiaro
- Ripasso utile per la memoria a lungo termine
- Sessioni brevi adatte a ogni giorno
- Passaggio dal vocabolario passivo all'uso attivo

---

## Inizia ora

Scarica **WordKing** e impara $language con un metodo più sistematico.

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

imparare $language, vocabolario $language, app per lingue, WordKing, ripasso intelligente
"@ }
        "Japanese" { return @"
# WordKingで${language}を学ぶ方法

${language}の学習は、単語をただ暗記するだけでは十分ではありません。発音、語彙、文型、読解、リスニング、表現をつなげて練習することで、知識が実際に使える力になります。

**WordKing** は、計画的な単語学習、復習、さまざまな練習、進捗データによって、語彙を長期的な語学力へ変えるサポートをします。

---

## どこから始めるか

### 頻出語を先に覚える
日常生活、学習、仕事、会話でよく使う単語から始めると、読む力と聞く力が伸びやすくなります。

### 例文で理解する
単語は文の中で覚えると、意味だけでなく使い方、語順、自然な組み合わせも理解できます。

### 毎日少し復習する
新しい単語は復習しないとすぐに忘れます。WordKing は弱い単語を適切なタイミングで復習できるようにします。

---

## WordKingの利点

- 学習内容と進捗がわかりやすい
- 長期記憶につながる復習ができる
- 短い時間でも毎日続けやすい
- 覚えた単語を実際の読解、聞き取り、表現につなげやすい

---

## 今すぐ始める

**WordKing** をダウンロードして、より体系的に${language}を学びましょう。

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

${language}学習, 単語アプリ, 語学学習, WordKing, スマート復習
"@ }
        "Javanese" { return @"
# Cara sinau $language nganggo WordKing

Sinau $language ora mung ngapalake tembung siji-siji. Supaya bisa maju, pangucapan, kosakata, ukara, maca, ngrungokake, lan ngomong kudu dilatih bebarengan.

**WordKing** mbantu nggawe rutinitas sinau kosakata kanthi rencana cetha, balen sinau, latihan macem-macem, lan cathetan kemajuan.

---

## Miwiti saka ngendi

### Sinau tembung sing kerep digunakake
Miwiti saka tembung saben dina, sekolah, kerja, lan pacelathon. Dhasar kosakata sing kuwat nggawe maca lan ngrungokake luwih gampang.

### Sinau liwat conto ukara
Conto ukara nuduhake carane tembung digunakake ing kahanan nyata lan gandhengane karo tembung liyane.

### Baleni saben dina
Tembung anyar gampang lali yen ora dibaleni. WordKing mbantu mbaleni tembung sing isih ringkih ing wektu sing pas.

---

## Kaluwihan WordKing

- Rencana sinau luwih cetha
- Balen sinau kanggo memori jangka dawa
- Cocok kanggo sesi cekak saben dina
- Mbantu ngowahi kosakata pasif dadi kemampuan nggunakake basa

---

## Miwiti saiki

Undhuh **WordKing** lan sinau $language kanthi cara luwih teratur.

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

sinau $language, kosakata, aplikasi sinau basa, WordKing, balen sinau pinter
"@ }
        "Korean" { return @"
# WordKing으로 $language 배우는 방법

$language 학습은 단어를 따로 외우는 것만으로는 충분하지 않습니다. 발음, 어휘, 문장, 읽기, 듣기, 말하기와 쓰기를 함께 연결해야 실제로 사용할 수 있는 능력이 됩니다.

**WordKing**은 계획적인 단어 학습, 반복 복습, 다양한 연습, 명확한 학습 데이터를 통해 어휘를 오래 기억하고 실제 언어 능력으로 바꾸도록 돕습니다.

---

## 어디서부터 시작할까

### 자주 쓰는 단어부터 배우기
일상, 공부, 업무, 대화에서 자주 나오는 단어를 먼저 익히면 읽기와 듣기가 훨씬 쉬워집니다.

### 예문으로 이해하기
예문은 단어의 실제 쓰임, 함께 쓰이는 표현, 문장 속 위치를 보여 줍니다.

### 매일 조금씩 복습하기
새 단어는 복습하지 않으면 쉽게 잊힙니다. WordKing은 약한 단어를 적절한 시점에 다시 연습하게 합니다.

---

## WordKing의 장점

- 학습 계획과 진행 상황이 명확함
- 장기 기억을 돕는 복습
- 짧은 시간에도 꾸준히 학습 가능
- 아는 단어를 실제 표현으로 연결

---

## 지금 시작하기

**WordKing**을 다운로드하고 더 체계적으로 $language 어휘를 익혀 보세요.

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

$language 학습, 단어 앱, 언어 학습, WordKing, 스마트 복습
"@ }
        "Portuguese" { return @"
# Como aprender $language com o WordKing

Aprender $language não é apenas memorizar palavras isoladas. O progresso real acontece quando pronúncia, vocabulário, frases, leitura, escuta e expressão são treinados juntos.

**WordKing** ajuda a criar uma rotina clara de vocabulário com estudo planejado, revisão regular, exercícios variados e dados de progresso.

---

## Por onde começar

### Aprenda palavras frequentes
Comece pelas palavras usadas no dia a dia, nos estudos, no trabalho e na comunicação. Uma base forte torna leitura e escuta muito mais fáceis.

### Use frases de exemplo
As frases mostram como uma palavra aparece em contexto, com que outras palavras combina e como é usada de forma natural.

### Revise todos os dias
Sem revisão, palavras novas são esquecidas rapidamente. O WordKing ajuda a revisar no momento certo e reforçar palavras fracas.

---

## Vantagens do WordKing

- Plano de estudo claro
- Revisão útil para memória de longo prazo
- Sessões curtas para aprender todos os dias
- Mais facilidade para transformar vocabulário passivo em uso ativo

---

## Comece agora

Baixe o **WordKing** e aprenda $language com um método mais sistemático.

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

aprender $language, vocabulário $language, aplicativo de idiomas, WordKing, revisão inteligente
"@ }
        "Marathi" { return @"
# WordKing वापरून $language कसे शिकावे

$language शिकणे म्हणजे फक्त वेगवेगळे शब्द पाठ करणे नाही. उच्चार, शब्दसंग्रह, वाक्यरचना, वाचन, ऐकणे आणि अभिव्यक्ती एकत्र सरावली तरच भाषा वापरण्याची खरी क्षमता तयार होते.

**WordKing** नियोजित शब्दअभ्यास, नियमित पुनरावृत्ती, विविध सराव आणि स्पष्ट प्रगती माहिती देऊन शिकणे अधिक व्यवस्थित करते.

---

## सुरुवात कुठून करावी

### आधी वारंवार वापरले जाणारे शब्द शिका
दैनंदिन जीवन, अभ्यास, काम आणि संभाषणातील सामान्य शब्दांपासून सुरुवात करा. मजबूत शब्दसंग्रह वाचन आणि ऐकणे सोपे करतो.

### उदाहरण वाक्यांतून शिका
उदाहरणे शब्दाचा खरा वापर, त्याचे संयोजन आणि वाक्यातील स्थान दाखवतात.

### दररोज पुनरावृत्ती करा
पुनरावृत्ती नसेल तर नवीन शब्द पटकन विसरले जातात. WordKing कमकुवत शब्द योग्य वेळी पुन्हा सरावायला मदत करते.

---

## WordKing चे फायदे

- स्पष्ट अभ्यास योजना
- दीर्घकालीन स्मरणासाठी पुनरावृत्ती
- लहान दैनिक अभ्यास सत्रे
- ओळखीचे शब्द सक्रिय वापरात आणण्यास मदत

---

## आत्ताच सुरू करा

**WordKing** डाउनलोड करा आणि $language अधिक पद्धतशीरपणे शिका.

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

$language शिकणे, शब्दसंग्रह, भाषा शिकण्याचे अॅप, WordKing, स्मार्ट पुनरावृत्ती
"@ }
        "Punjabi" { return @"
# WordKing ਨਾਲ $language ਕਿਵੇਂ ਸਿੱਖੀਏ

$language ਸਿੱਖਣਾ ਸਿਰਫ਼ ਵੱਖਰੇ ਸ਼ਬਦ ਯਾਦ ਕਰਨਾ ਨਹੀਂ ਹੈ। ਉਚਾਰਨ, ਸ਼ਬਦਾਵਲੀ, ਵਾਕ, ਪੜ੍ਹਨਾ, ਸੁਣਨਾ ਅਤੇ ਪ੍ਰਗਟਾਵਾ ਇਕੱਠੇ ਅਭਿਆਸ ਕਰਨ ਨਾਲ ਹੀ ਅਸਲ ਭਾਸ਼ਾਈ ਯੋਗਤਾ ਬਣਦੀ ਹੈ।

**WordKing** ਯੋਜਨਾਬੱਧ ਸ਼ਬਦ ਸਿੱਖਣ, ਨਿਯਮਿਤ ਦੁਹਰਾਈ, ਵੱਖ-ਵੱਖ ਅਭਿਆਸ ਅਤੇ ਸਾਫ਼ ਪ੍ਰਗਤੀ ਡਾਟਾ ਨਾਲ ਸਿੱਖਣ ਨੂੰ ਆਸਾਨ ਬਣਾਉਂਦਾ ਹੈ।

---

## ਕਿੱਥੋਂ ਸ਼ੁਰੂ ਕਰੀਏ

### ਪਹਿਲਾਂ ਆਮ ਵਰਤੇ ਜਾਣ ਵਾਲੇ ਸ਼ਬਦ ਸਿੱਖੋ
ਰੋਜ਼ਾਨਾ ਜੀਵਨ, ਪੜ੍ਹਾਈ, ਕੰਮ ਅਤੇ ਗੱਲਬਾਤ ਵਿੱਚ ਆਉਣ ਵਾਲੇ ਸ਼ਬਦਾਂ ਤੋਂ ਸ਼ੁਰੂ ਕਰੋ। ਮਜ਼ਬੂਤ ਸ਼ਬਦਾਵਲੀ ਪੜ੍ਹਨ ਅਤੇ ਸੁਣਨ ਨੂੰ ਆਸਾਨ ਕਰਦੀ ਹੈ।

### ਉਦਾਹਰਨ ਵਾਕਾਂ ਨਾਲ ਸਿੱਖੋ
ਉਦਾਹਰਨਾਂ ਦਿਖਾਉਂਦੀਆਂ ਹਨ ਕਿ ਸ਼ਬਦ ਅਸਲ ਸੰਦਰਭ ਵਿੱਚ ਕਿਵੇਂ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ।

### ਹਰ ਰੋਜ਼ ਦੁਹਰਾਈ ਕਰੋ
ਦੁਹਰਾਈ ਤੋਂ ਬਿਨਾਂ ਨਵੇਂ ਸ਼ਬਦ ਜਲਦੀ ਭੁੱਲ ਜਾਂਦੇ ਹਨ। WordKing ਕਮਜ਼ੋਰ ਸ਼ਬਦਾਂ ਨੂੰ ਸਮੇਂ ਤੇ ਮੁੜ ਅਭਿਆਸ ਕਰਵਾਉਂਦਾ ਹੈ।

---

## WordKing ਦੇ ਫਾਇਦੇ

- ਸਾਫ਼ ਸਿੱਖਣ ਯੋਜਨਾ
- ਲੰਬੇ ਸਮੇਂ ਦੀ ਯਾਦ ਲਈ ਦੁਹਰਾਈ
- ਛੋਟੀਆਂ ਰੋਜ਼ਾਨਾ ਸੈਸ਼ਨ
- ਪਹਿਚਾਣ ਵਾਲੇ ਸ਼ਬਦਾਂ ਨੂੰ ਵਰਤਣ ਯੋਗ ਬਣਾਉਣਾ

---

## ਹੁਣੇ ਸ਼ੁਰੂ ਕਰੋ

**WordKing** ਡਾਊਨਲੋਡ ਕਰੋ ਅਤੇ $language ਨੂੰ ਹੋਰ ਢੰਗ ਨਾਲ ਸਿੱਖੋ।

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

$language ਸਿੱਖਣਾ, ਸ਼ਬਦਾਵਲੀ, ਭਾਸ਼ਾ ਸਿੱਖਣ ਐਪ, WordKing, ਸਮਾਰਟ ਦੁਹਰਾਈ
"@ }
        "Turkish" { return @"
# WordKing ile $language nasıl öğrenilir

$language öğrenmek yalnızca tek tek kelime ezberlemek değildir. Telaffuz, kelime bilgisi, cümleler, okuma, dinleme ve ifade birlikte çalışıldığında gerçek dil becerisi oluşur.

**WordKing** planlı kelime öğrenimi, düzenli tekrar, farklı alıştırmalar ve açık ilerleme verileriyle bu süreci destekler.

---

## Nereden başlamalı

### Önce sık kullanılan kelimeleri öğrenin
Günlük yaşamda, eğitimde, işte ve iletişimde kullanılan kelimeler sağlam bir temel oluşturur.

### Örnek cümlelerle öğrenin
Örnekler kelimenin bağlamda nasıl kullanıldığını, hangi kelimelerle birlikte geldiğini ve gerçek ifadelerde nasıl yer aldığını gösterir.

### Her gün tekrar yapın
Yeni kelimeler tekrar edilmezse çabuk unutulur. WordKing zayıf kelimeleri doğru zamanda yeniden çalıştırır.

---

## WordKing'in avantajları

- Açık öğrenme planı
- Uzun süreli hafızaya uygun tekrar
- Kısa günlük çalışma oturumları
- Pasif kelimeleri aktif kullanıma dönüştürme

---

## Şimdi başlayın

**WordKing** indirin ve $language öğrenimini daha sistemli hale getirin.

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

$language öğrenme, kelime uygulaması, dil öğrenme, WordKing, akıllı tekrar
"@ }
        "Tamil" { return @"
# WordKing மூலம் $language எப்படி கற்கலாம்

$language கற்பது தனித்தனி சொற்களை மனப்பாடம் செய்வது மட்டும் அல்ல. உச்சரிப்பு, சொற்களஞ்சியம், வாக்கியங்கள், வாசிப்பு, கேட்பு மற்றும் வெளிப்பாடு ஒன்றாக பயிற்சி செய்யும்போது உண்மையான மொழித் திறன் உருவாகிறது.

**WordKing** திட்டமிட்ட சொல் கற்றல், மீளாய்வு, பலவகை பயிற்சி மற்றும் தெளிவான முன்னேற்றத் தகவல்களால் கற்றலை எளிதாக்குகிறது.

---

## எங்கிருந்து தொடங்குவது

### முதலில் அடிக்கடி பயன்படும் சொற்களை கற்கவும்
நாள் தோறும், படிப்பு, வேலை மற்றும் உரையாடலில் வரும் சொற்கள் நல்ல அடிப்படை தரும்.

### எடுத்துக்காட்டு வாக்கியங்களுடன் கற்கவும்
வாக்கியங்கள் ஒரு சொல் சூழலில் எப்படி பயன்படுத்தப்படுகிறது என்பதை காட்டும்.

### தினமும் மீளாய்வு செய்யவும்
மீளாய்வு இல்லாமல் புதிய சொற்கள் விரைவாக மறந்து போகும். WordKing பலவீனமான சொற்களை சரியான நேரத்தில் மீண்டும் பயிற்சி செய்ய உதவும்.

---

## WordKing இன் நன்மைகள்

- தெளிவான கற்றல் திட்டம்
- நீண்டநாள் நினைவிற்கு உதவும் மீளாய்வு
- குறுகிய தினசரி அமர்வுகள்
- அறிந்த சொற்களை செயலில் பயன்படுத்த உதவி

---

## இப்போது தொடங்குங்கள்

**WordKing** பதிவிறக்கம் செய்து $language கற்றலை மேலும் முறையாக மாற்றுங்கள்.

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

$language கற்றல், சொற்களஞ்சியம், மொழி கற்றல் செயலி, WordKing, புத்திசாலி மீளாய்வு
"@ }
        "Telugu" { return @"
# WordKing తో $language ఎలా నేర్చుకోవాలి

$language నేర్చుకోవడం అంటే విడి పదాలను గుర్తుపెట్టుకోవడం మాత్రమే కాదు. ఉచ్చారణ, పదసంపద, వాక్యాలు, చదవడం, వినడం మరియు వ్యక్తీకరణ కలిసి సాధన చేసినప్పుడు నిజమైన భాషా నైపుణ్యం ఏర్పడుతుంది.

**WordKing** ప్రణాళికాబద్ధమైన పదాభ్యాసం, పునశ్చరణ, విభిన్న సాధన మరియు స్పష్టమైన పురోగతి సమాచారంతో అభ్యాసాన్ని సులభం చేస్తుంది.

---

## ఎక్కడి నుంచి ప్రారంభించాలి

### ముందుగా ఎక్కువగా ఉపయోగించే పదాలు నేర్చుకోండి
రోజువారీ జీవితం, చదువు, పని మరియు సంభాషణలో వచ్చే పదాలు బలమైన పునాది ఇస్తాయి.

### ఉదాహరణ వాక్యాలతో నేర్చుకోండి
ఉదాహరణలు పదం సందర్భంలో ఎలా ఉపయోగించబడుతుందో చూపిస్తాయి.

### ప్రతిరోజూ పునశ్చరణ చేయండి
పునశ్చరణ లేకపోతే కొత్త పదాలు త్వరగా మరచిపోతాం. WordKing బలహీనమైన పదాలను సరైన సమయంలో మళ్లీ సాధన చేయిస్తుంది.

---

## WordKing ప్రయోజనాలు

- స్పష్టమైన అభ్యాస ప్రణాళిక
- దీర్ఘకాలిక జ్ఞాపకానికి పునశ్చరణ
- చిన్న రోజువారీ సెషన్లు
- తెలిసిన పదాలను క్రియాశీల వినియోగంగా మార్చడం

---

## ఇప్పుడే ప్రారంభించండి

**WordKing** డౌన్‌లోడ్ చేసి $language నేర్చుకోవడాన్ని మరింత వ్యవస్థీకృతం చేయండి.

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

$language నేర్చుకోవడం, పదసంపద, భాషా అభ్యాస యాప్, WordKing, స్మార్ట్ పునశ్చరణ
"@ }
        "Urdu" { return @"
# WordKing کے ساتھ $language کیسے سیکھیں

$language سیکھنا صرف الگ الگ الفاظ یاد کرنا نہیں ہے۔ اصل ترقی تب ہوتی ہے جب تلفظ، الفاظ، جملے، پڑھنا، سننا اور اظہار ایک ساتھ مشق کیے جائیں۔

**WordKing** منصوبہ بند الفاظ، باقاعدہ دہرائی، مختلف مشقوں اور واضح پیش رفت کے ذریعے سیکھنے کو منظم بناتا ہے۔

---

## کہاں سے شروع کریں

### پہلے عام الفاظ سیکھیں
روزمرہ زندگی، تعلیم، کام اور گفتگو میں آنے والے الفاظ مضبوط بنیاد بناتے ہیں۔

### مثالوں کے ساتھ سیکھیں
مثالی جملے دکھاتے ہیں کہ لفظ حقیقی سیاق و سباق میں کیسے استعمال ہوتا ہے۔

### روزانہ دہرائی کریں
دہرائی کے بغیر نئے الفاظ جلد بھول جاتے ہیں۔ WordKing کمزور الفاظ کو صحیح وقت پر دوبارہ مشق میں لاتا ہے۔

---

## WordKing کے فوائد

- واضح تعلیمی منصوبہ
- طویل مدتی یادداشت کے لیے دہرائی
- مختصر روزانہ نشستیں
- پہچانے ہوئے الفاظ کو فعال استعمال میں بدلنا

---

## ابھی شروع کریں

**WordKing** ڈاؤن لوڈ کریں اور $language کو زیادہ منظم انداز میں سیکھیں۔

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

$language سیکھنا, الفاظ, زبان سیکھنے کی ایپ, WordKing, اسمارٹ دہرائی
"@ }
        "Vietnamese" { return @"
# Cách học $language với WordKing

Học $language không chỉ là ghi nhớ từng từ riêng lẻ. Tiến bộ thật sự đến khi phát âm, từ vựng, câu, đọc, nghe và diễn đạt được luyện tập cùng nhau.

**WordKing** giúp xây dựng thói quen học từ vựng có kế hoạch, ôn tập đều đặn, luyện tập đa dạng và theo dõi tiến bộ rõ ràng.

---

## Nên bắt đầu từ đâu

### Học từ thường gặp trước
Hãy bắt đầu với các từ xuất hiện trong đời sống hằng ngày, học tập, công việc và giao tiếp. Nền tảng từ vựng vững giúp đọc và nghe dễ hơn.

### Học qua câu ví dụ
Câu ví dụ cho thấy từ được dùng trong ngữ cảnh thật, kết hợp với từ nào và xuất hiện trong cách diễn đạt tự nhiên ra sao.

### Ôn tập mỗi ngày
Từ mới rất dễ quên nếu không ôn lại. WordKing giúp đưa các từ yếu quay lại đúng lúc để củng cố.

---

## Ưu điểm của WordKing

- Kế hoạch học rõ ràng
- Ôn tập hỗ trợ trí nhớ dài hạn
- Phiên học ngắn phù hợp mỗi ngày
- Giúp biến từ vựng thụ động thành khả năng sử dụng thật

---

## Bắt đầu ngay

Tải **WordKing** và học $language theo cách hệ thống hơn.

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

học $language, từ vựng $language, ứng dụng học ngôn ngữ, WordKing, ôn tập thông minh
"@ }
        default { return EnglishArticle $language }
    }
}

$sourceDirs = Get-ChildItem -LiteralPath $repoRoot -Directory |
    Where-Object { $excludedRootDirs -notcontains $_.Name } |
    Sort-Object Name

$written = 0
$skipped = 0
foreach ($source in $sourceDirs) {
    $targetDirs = Get-ChildItem -LiteralPath $source.FullName -Directory | Sort-Object Name
    foreach ($target in $targetDirs) {
        $path = Join-Path $target.FullName "$Date.md"
        if ($source.Name -eq "Swedish" -and $target.Name -eq "Chinese") {
            $skipped++
            continue
        }

        if ((Test-Path -LiteralPath $path) -and -not $Overwrite) {
            $skipped++
            continue
        }

        $language = LearnName $source.Name $target.Name
        $content = ((Article $target.Name $language).TrimEnd() + "`n" + (GoogleTag) + "`n")
        Write-Utf8File $path $content
        $written++
    }
}

Write-Host "Wrote $written files; skipped $skipped existing files."
