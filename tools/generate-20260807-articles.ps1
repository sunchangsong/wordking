param(
    [string] $Date = "20260807",
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
    if ($target -eq "Chinese" -and $learnNamesZh.ContainsKey($source)) { return $learnNamesZh[$source] }
    if ($target -eq "Traditional_Chinese" -and $learnNamesZhTw.ContainsKey($source)) { return $learnNamesZhTw[$source] }
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
# WordKing 在${language}学习方面的优势：不止背单词，更是综合训练工具

学习${language}时，很多人一开始会把重点放在“背了多少单词”上。但真正进入阅读、听力、写作和口语表达后，很快就会发现：只记住母语释义还不够。一个单词要能够被听出来、拼正确、放进句子里理解，还要知道它的变形、搭配和真实语境，才算逐渐变成自己的语言能力。

**WordKing** 的优势就在于，它不是把语言学习压缩成单一的单词记忆，而是围绕词汇建立多种训练路径：单词记忆、复习巩固、听单词、手写练习、句子拼写、变形训练、影视精听、阅读和听力挑战等功能互相配合，让学习者从“认识单词”一步步走向“能听、能写、能理解、能使用”。

---

## 为什么语言学习不能只靠死记硬背

### 单词需要反复在不同场景中出现
${language}单词有发音、拼写、词性、例句、变形和语境。只看一遍释义，很容易形成短暂印象；但在听力中听不到、写作时写不出、阅读时认不准，都会影响真实使用。有效的学习应该让同一个词在不同任务中多次出现，让大脑从多个角度建立连接。

### 输出训练决定掌握深度
认识一个词和准确写出一个词，是两种不同能力。选择题可以帮助快速识别，拼写和句子练习则能检查是否真正记牢。对于有词形变化的语言，复数、时态、派生和其他变形也需要通过输出训练反复巩固。

### 真实输入能提升听力反应
很多学习者背过单词，但听影视材料或真实对话时仍然反应不过来。原因往往是声音、字幕、句子结构和语境没有被连接起来。精听训练可以把词汇放回真实语言环境，让学习者逐句理解声音和含义。

---

## WordKing 的多种单词记忆方式

WordKing 支持多步骤学习，用户可以通过掌握判断、词义辨析、发音辨析、词义反选、拼写练习等方式接触同一批单词。不同练习检查的是不同能力：有的帮助建立初始印象，有的强化听辨，有的训练主动回忆，有的暴露易混淆词。

语言学习最怕“今天记住，几天后忘光”。WordKing 会围绕学习记录、复习状态和掌握情况安排复习，让用户每天知道该学什么、该复习什么。已经熟悉的词减少无效重复，容易忘的词获得更多出现机会，长期积累更稳。

不同学习者的目标并不一样。WordKing 支持词书学习和自定义词书，用户可以把自己的单词列表整理成学习内容，让学习计划更贴近考试、阅读、工作交流或日常提升等真实需求。

---

## 影视精听：把单词放回真实语境

影视精听是 WordKing 在综合语言能力训练上的重要补充。用户可以添加视频，并结合字幕进行精听练习。相比单独听单词，影视精听更接近真实语言环境：语速、语调、停顿、连读、情绪和上下文都会同时出现。

通过影视精听，学习者可以反复听同一句话，借助字幕理解句子结构，把学过的单词放进真实场景中重新识别，并从影视片段中积累更自然的表达方式。单词不再只是词表里的孤立项目，而会变成能够在真实输入中被捕捉、被理解的语言单位。

---

## 句子拼写和变形训练：从认识走向会用

WordKing 的句子拼写训练通过单词例句进行拼写练习。它比单个单词拼写更进一步，因为学习者不仅要想起目标词，还要理解整句话的结构、顺序和含义。它适合训练单词位置、常见搭配、句子结构感，以及从理解输入到主动输出的转换。

变形训练则帮助学习者集中练习单词变形拼写。很多语言都有不同程度的词形变化，如果只背原形，阅读时可能认不出变化形式，写作时也容易出错。WordKing 会选择包含变形数据的单词进行训练，让用户把注意力放在最容易出错、最需要主动输出的部分。

---

## 听单词、手写和专项训练让学习更完整

- 听单词训练：连接发音、释义和例句，适合提升听辨和跟读习惯
- 手写训练：通过书写强化拼写记忆，适合容易拼错的单词
- 句子拼写：用例句训练完整表达，提升输出准确性
- 变形训练：集中巩固词形变化，减少阅读和写作中的识别错误
- 阅读和听力挑战：通过挑战查看当前词汇识别能力，并参与排名

这些功能让学习不再只有一种节奏。状态好时可以学习新词，碎片时间可以听单词，需要突破时可以做专项训练，想检测能力时可以参加挑战。

---

## WordKing 在语言学习中的核心优点

WordKing 不只关注单词释义，还覆盖发音、拼写、例句、听力、句子、变形和真实视频语境。每日目标、复习任务、学习记录和连续签到能帮助用户建立稳定习惯；今日学习、累计学习、复习任务、词汇量、听力单词量和阅读单词量等数据，也能让进步变得可见。

背单词的最终目标不是完成数量，而是在阅读时认得出、听力时听得懂、写作时写得准、表达时用得上。WordKing 通过多种训练方式把词汇推向真实使用，让${language}学习更系统、更灵活，也更接近真实能力提升。

---

## 立即开始学习${language}

如果你希望学习${language}时不只是“背过单词”，而是真正把词汇变成听、说、读、写都能调用的能力，可以从 WordKing 开始。用多种记忆方式建立基础，用复习机制保持节奏，再通过影视精听、句子拼写和变形训练不断加深掌握。

下载 **WordKing**，让语言学习更系统、更灵活，也更接近真实能力提升。

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

WordKing, ${language}学习, 语言学习工具, 背单词app推荐, 影视精听, 句子拼写, 单词变形训练, 听力训练, 拼写练习, 科学复习单词, 自定义词书
"@
}

function TraditionalChineseArticle([string] $language) {
    return @"
# WordKing 在${language}學習方面的優勢：不只背單字，更是綜合訓練工具

學習${language}時，很多人一開始會把重點放在「背了多少單字」上。但真正進入閱讀、聽力、寫作和口說表達後，很快就會發現：只記住母語解釋還不夠。單字要能被聽出來、拼正確、放進句子裡理解，還要知道變形、搭配和真實語境，才會逐漸變成自己的語言能力。

**WordKing** 的優勢在於，它不是把語言學習壓縮成單一的單字記憶，而是圍繞詞彙建立多種訓練路徑：單字記憶、複習鞏固、聽單字、手寫練習、句子拼寫、變形訓練、影視精聽、閱讀和聽力挑戰等功能互相配合，讓學習者從「認識單字」一步步走向「能聽、能寫、能理解、能使用」。

---

## 為什麼語言學習不能只靠死記硬背

${language}單字有發音、拼寫、詞性、例句、變形和語境。只看一遍解釋，很容易形成短暫印象；但在聽力中聽不到、寫作時寫不出、閱讀時認不準，都會影響真實使用。有效的學習應該讓同一個詞在不同任務中多次出現，讓大腦從多個角度建立連結。

認識一個詞和準確寫出一個詞，是兩種不同能力。選擇題可以幫助快速識別，拼寫和句子練習則能檢查是否真正記牢。對於有詞形變化的語言，複數、時態、派生和其他變形也需要透過輸出訓練反覆鞏固。

---

## WordKing 的多種記憶方式

WordKing 支援多步驟學習，使用者可以透過掌握判斷、詞義辨析、發音辨析、詞義反選、拼寫練習等方式接觸同一批單字。WordKing 也會依照學習記錄、複習狀態和掌握情況安排複習，讓容易忘的詞獲得更多練習，已經熟悉的詞減少無效重複。

使用者還可以選擇詞書或建立自訂詞書，把自己的單字列表整理成學習內容，讓計畫更符合考試、閱讀、工作交流或日常提升等目標。

---

## 影視精聽、句子拼寫與變形訓練

影視精聽可以讓使用者加入影片並搭配字幕練習。它比單獨聽單字更接近真實語言環境，能把語速、語調、停頓、情緒和上下文一起放進訓練裡。學習者可以反覆聽同一句話，借助字幕理解結構，把學過的詞放回真實場景中辨認。

句子拼寫透過例句訓練完整表達，幫助學習者理解詞彙在句子中的位置、常見搭配和語序。變形訓練則集中練習單字變形拼寫，幫助使用者處理原形之外的變化形式，減少閱讀和寫作中的錯誤。

---

## 專項訓練讓學習更完整

- 聽單字訓練：連接發音、釋義和例句
- 手寫訓練：透過書寫強化拼寫記憶
- 句子拼寫：用例句訓練完整輸出
- 變形訓練：集中鞏固詞形變化
- 閱讀和聽力挑戰：檢查目前的詞彙識別能力

WordKing 不只關注單字解釋，還覆蓋發音、拼寫、例句、聽力、句子、變形和真實影片語境。每日目標、複習任務、學習記錄和連續簽到能幫助使用者建立穩定習慣，學習數據也能讓進步變得清楚可見。

---

## 立即開始學習${language}

如果你希望學習${language}時不只是「背過單字」，而是真正把詞彙變成聽、說、讀、寫都能調用的能力，可以從 WordKing 開始。

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

WordKing, ${language}學習, 語言學習工具, 背單字App推薦, 影視精聽, 句子拼寫, 單字變形訓練, 聽力訓練, 科學複習
"@
}

function EnglishArticle([string] $language) {
    return @"
# WordKing for $language Learning: More Than Vocabulary, a Complete Training Tool

When learning $language, many learners first focus on how many words they can memorize. But once reading, listening, writing, and speaking become real goals, vocabulary has to do more than sit in a word list. A word needs to be recognized in audio, spelled accurately, understood in sentences, and connected with forms, collocations, and real context.

**WordKing** is useful because it does not reduce language learning to one kind of memorization. It builds several training paths around vocabulary: word learning, review, word listening, handwriting, sentence spelling, inflection training, intensive listening with video, reading challenges, and listening challenges. Together, these features help learners move from recognizing words to understanding and using them.

---

## Why Memorization Alone Is Not Enough

$language words have sound, spelling, meaning, examples, forms, and context. Seeing a translation once may create a short impression, but real ability requires repeated contact in different tasks. Recognition exercises help with quick understanding, while spelling, sentence practice, and inflection training check whether the word can be actively recalled.

Many learners know words on paper but cannot catch them in videos or conversations. Intensive listening solves part of this problem by putting vocabulary back into real speech, subtitles, sentence rhythm, and context.

---

## Multiple Ways to Remember Words

WordKing supports several learning steps, including mastery checks, meaning recognition, pronunciation recognition, reverse meaning selection, and spelling practice. Each mode tests a different layer of knowledge: first impression, listening, active recall, and confusion between similar words.

WordKing also uses learning records and review status to organize review. Familiar words receive less unnecessary repetition, while weak words appear more often. Learners can use prepared word books or create custom word books for exams, reading, work, travel, or personal study goals.

---

## Intensive Listening, Sentence Spelling, and Inflection Training

With intensive listening, users can add videos and practice with subtitles. This is closer to real language than isolated audio because speed, rhythm, pauses, emotion, and context appear together. Learners can replay sentences, understand structure through subtitles, and recognize learned words in realistic scenes.

Sentence spelling uses example sentences to train full expression. It helps learners notice word order, common collocations, sentence structure, and the shift from understanding input to producing language. Inflection training focuses on word-form spelling, which is especially helpful for languages where tense, number, derivation, or other forms matter.

---

## Specialized Practice Makes Learning More Complete

- Word listening connects pronunciation, meaning, and example sentences
- Handwriting strengthens spelling memory through writing
- Sentence spelling improves accurate output
- Inflection training reinforces changing word forms
- Reading and listening challenges test current vocabulary recognition

These features give learners more than one study rhythm. They can learn new words when focused, listen during short breaks, use specialized practice for weak points, and check progress through challenges.

---

## Core Advantages of WordKing

WordKing covers meaning, pronunciation, spelling, examples, listening, sentences, inflections, and real video context. Daily goals, review tasks, learning records, and streaks help build a stable routine, while data such as daily study, total study, vocabulary size, listening vocabulary, and reading vocabulary makes progress visible.

The goal is not simply to finish more words inside an app. The goal is to recognize words while reading, hear them while listening, spell them correctly, and use them when expressing ideas. WordKing helps turn vocabulary into real $language ability.

---

## Start Learning $language

If you want $language vocabulary to become usable ability across listening, speaking, reading, and writing, WordKing gives you a structured and flexible way to practice.

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

WordKing, $language learning, language learning app, vocabulary app, intensive listening, sentence spelling, inflection training, listening practice, spelling practice, scientific review
"@
}

function GenericArticle([string] $language, [string] $title, [string] $intro, [string] $why, [string] $modes, [string] $video, [string] $sentence, [string] $practice, [string] $advantages, [string] $start, [string] $keywords) {
    return @"
# $title

$intro

---

## $why

$modes

---

## $video

$sentence

---

## $practice

$advantages

---

## $start

### Android: https://play.google.com/store/apps/details?id=cn.movingshop.wordking.word_front
### iOS: https://apps.apple.com/us/app/wordking-language-learning/id6742090263

---

$keywords
"@
}

function Article([string] $target, [string] $language) {
    switch ($target) {
        "Chinese" { return (ChineseArticle $language) }
        "Traditional_Chinese" { return (TraditionalChineseArticle $language) }
        "English" { return (EnglishArticle $language) }
        "Arabic" { return (GenericArticle $language "WordKing في تعلم ${language}: أكثر من حفظ الكلمات" "**WordKing** يساعد متعلمي $language على تحويل المفردات إلى قدرة حقيقية. فهو يجمع بين حفظ الكلمات، المراجعة، الاستماع إلى الكلمات، الكتابة اليدوية، تهجئة الجمل، تدريب التصريف، الاستماع المكثف من الفيديو، وتحديات القراءة والاستماع." "لماذا لا يكفي الحفظ وحده" "الكلمة لا تعني ترجمة فقط؛ لها صوت وتهجئة وسياق وأمثلة وأشكال مختلفة. لذلك يقدم WordKing أنماطا متعددة للتعلم: تمييز المعنى، تمييز النطق، الاختيار العكسي، التهجئة، والمراجعة العلمية. تظهر الكلمات الضعيفة أكثر، بينما تقل التكرارات غير الضرورية للكلمات المتقنة. يمكن أيضا استخدام كتب الكلمات الجاهزة أو إنشاء كتاب كلمات خاص." "الاستماع المكثف والسياق الحقيقي" "يتيح WordKing إضافة مقاطع فيديو واستخدام الترجمة للتدريب المكثف. يستطيع المتعلم إعادة الجملة، ملاحظة الإيقاع والنبرة، وربط الكلمات التي تعلمها بمشهد حقيقي. كما تساعد تهجئة الجمل على تدريب ترتيب الكلمات والتراكيب، بينما يركز تدريب التصريف على كتابة الأشكال المختلفة للكلمة." "تدريبات متخصصة لتعلم أعمق" "يشمل WordKing الاستماع إلى الكلمات، الكتابة اليدوية، تهجئة الجمل، تدريب التصريف، وتحديات القراءة والاستماع. هذه الأدوات تجعل التعلم مرنا: يمكن تعلم كلمات جديدة، الاستماع في وقت قصير، أو التركيز على نقطة ضعف محددة. كما تعرض البيانات اليومية والتراكمية وحجم المفردات تقدما واضحا يساعد على الاستمرار." "ابدأ تعلم $language" "WordKing, تعلم $language, تطبيق تعلم اللغات, حفظ الكلمات, الاستماع المكثف, تهجئة الجمل, تدريب التصريف, مراجعة علمية") }
        "Bengali" { return (GenericArticle $language "ভাষা শেখায় WordKing: শুধু শব্দ মুখস্থ নয়, সম্পূর্ণ অনুশীলন" "**WordKing** $language শেখাকে শুধু শব্দতালিকা মুখস্থ করার মধ্যে সীমাবদ্ধ রাখে না। এতে শব্দ শেখা, পুনরাবৃত্তি, শব্দ শুনে অনুশীলন, হাতের লেখা, বাক্য বানান, রূপ পরিবর্তন অনুশীলন, ভিডিও দিয়ে গভীর শ্রবণ, পড়া ও শোনার চ্যালেঞ্জ একসঙ্গে কাজ করে।" "কেন শুধু মুখস্থ যথেষ্ট নয়" "একটি শব্দের অর্থের সঙ্গে উচ্চারণ, বানান, উদাহরণ, রূপ এবং প্রসঙ্গও শেখা দরকার। WordKing বিভিন্ন ধাপে একই শব্দ অনুশীলন করায়: অর্থ বোঝা, উচ্চারণ চেনা, বিপরীত অর্থ নির্বাচন, বানান এবং নিয়মিত রিভিউ। দুর্বল শব্দ বেশি ফিরে আসে, আর পরিচিত শব্দে অপ্রয়োজনীয় পুনরাবৃত্তি কমে।" "ভিডিও শ্রবণ ও বাস্তব প্রসঙ্গ" "ভিডিও ও সাবটাইটেল দিয়ে intensive listening করলে শব্দ বাস্তব ভাষার গতি, স্বর, বিরতি ও প্রসঙ্গে ফিরে আসে। শিক্ষার্থী একই বাক্য বারবার শুনতে পারে এবং শেখা শব্দকে বাস্তব দৃশ্যে চিনতে পারে। বাক্য বানান পূর্ণ প্রকাশ অনুশীলন করায়, আর inflection training শব্দের পরিবর্তিত রূপ লিখতে সাহায্য করে।" "বিশেষ অনুশীলনে শেখা আরও পূর্ণ" "শব্দ শুনে অনুশীলন উচ্চারণ ও অর্থ যুক্ত করে, হাতের লেখা বানান স্মৃতি মজবুত করে, বাক্য বানান আউটপুট উন্নত করে, রূপ পরিবর্তন অনুশীলন ভুল কমায়, আর পড়া ও শোনার চ্যালেঞ্জ বর্তমান সক্ষমতা যাচাই করে। শেখার সময়, রিভিউ, শব্দভান্ডার এবং ধারাবাহিকতার ডেটা অগ্রগতি স্পষ্ট করে।" "$language শেখা শুরু করুন" "WordKing, $language শেখা, ভাষা শেখার অ্যাপ, শব্দ মুখস্থ, intensive listening, বাক্য বানান, inflection training, বৈজ্ঞানিক রিভিউ") }
        "French" { return (GenericArticle $language "WordKing pour apprendre le $language : bien plus que mémoriser des mots" "**WordKing** aide les apprenants de $language à transformer le vocabulaire en compétence réelle. L'application réunit mémorisation, révision, écoute de mots, écriture manuscrite, dictée de phrases, entraînement aux formes, écoute intensive avec vidéo, défis de lecture et défis d'écoute." "Pourquoi la mémorisation seule ne suffit pas" "Un mot ne se résume pas à une traduction. Il a une prononciation, une orthographe, des exemples, des formes et un contexte. WordKing propose plusieurs modes : jugement de maîtrise, discrimination du sens, reconnaissance de la prononciation, choix inverse, orthographe et révision planifiée. Les mots faibles reviennent plus souvent, les mots maîtrisés moins inutilement." "Écoute intensive et contexte réel" "Avec l'écoute intensive, l'utilisateur ajoute des vidéos et travaille avec les sous-titres. Il peut répéter une phrase, observer le rythme et relier les mots appris à une situation réelle. La dictée de phrases développe l'ordre des mots et les expressions, tandis que l'entraînement aux formes renforce les variantes du mot." "Des entraînements spécialisés pour progresser" "L'écoute de mots relie son, sens et exemples. L'écriture manuscrite renforce l'orthographe. La dictée de phrases améliore la production. L'entraînement aux formes réduit les erreurs. Les défis de lecture et d'écoute mesurent la reconnaissance du vocabulaire. Les objectifs quotidiens, les révisions et les données rendent les progrès visibles." "Commencer à apprendre le $language" "WordKing, apprentissage du $language, application de langues, vocabulaire, écoute intensive, dictée de phrases, entraînement aux formes, révision scientifique") }
        "German" { return (GenericArticle $language "WordKing beim Lernen von ${language}: mehr als Vokabeln, ein vollständiges Training" "**WordKing** hilft Lernenden von $language, Wortschatz in echte Sprachfähigkeit zu verwandeln. Die App verbindet Vokabellernen, Wiederholung, Worthören, Handschrift, Satzschreibung, Formen-Training, intensives Hören mit Video sowie Lese- und Hör-Challenges." "Warum Auswendiglernen allein nicht reicht" "Ein Wort besteht nicht nur aus einer Übersetzung. Es hat Klang, Schreibweise, Beispiele, Formen und Kontext. WordKing bietet mehrere Lernschritte: Bedeutung erkennen, Aussprache unterscheiden, Rückübersetzung, Rechtschreibung und geplante Wiederholung. Schwache Wörter erscheinen häufiger, sicher beherrschte Wörter weniger." "Intensives Hören und echter Kontext" "Beim intensiven Hören können Nutzer Videos hinzufügen und mit Untertiteln üben. So treffen Wörter auf echtes Tempo, Rhythmus, Pausen und Situation. Satzschreibung trainiert Wortstellung und Ausdruck, während das Formen-Training veränderte Wortformen festigt." "Spezialtraining macht das Lernen vollständiger" "Worthören verbindet Aussprache, Bedeutung und Beispiele. Handschrift stärkt die Rechtschreibung. Satzschreibung verbessert aktive Ausgabe. Formen-Training verringert Fehler beim Lesen und Schreiben. Lese- und Hör-Challenges prüfen den aktuellen Wortschatz. Lernziele, Wiederholungen und Statistiken machen Fortschritte sichtbar." "$language mit WordKing lernen" "WordKing, $language lernen, Sprachlern-App, Vokabel-App, intensives Hören, Satzschreibung, Formen-Training, wissenschaftliche Wiederholung") }
        "Hindi" { return (GenericArticle $language "WordKing से $language सीखना: सिर्फ शब्द याद करना नहीं, पूरा अभ्यास" "**WordKing** $language सीखने वालों को शब्दावली को असली भाषा क्षमता में बदलने में मदद करता है। इसमें शब्द सीखना, दोहराव, शब्द सुनना, हस्तलेखन, वाक्य वर्तनी, रूप-परिवर्तन अभ्यास, वीडियो के साथ गहन श्रवण, पढ़ने और सुनने की चुनौतियां शामिल हैं।" "सिर्फ रटने से काम क्यों नहीं चलता" "एक शब्द केवल अनुवाद नहीं होता। उसमें ध्वनि, वर्तनी, उदाहरण, रूप और संदर्भ होते हैं। WordKing अर्थ पहचान, उच्चारण पहचान, उल्टा चयन, वर्तनी और वैज्ञानिक पुनरावृत्ति जैसे कई अभ्यास देता है। कमजोर शब्द अधिक बार आते हैं और पक्के शब्दों पर अनावश्यक समय कम लगता है।" "वीडियो श्रवण और वास्तविक संदर्भ" "गहन श्रवण में उपयोगकर्ता वीडियो जोड़कर उपशीर्षकों के साथ अभ्यास कर सकते हैं। इससे गति, लय, विराम और प्रसंग साथ आते हैं। वाक्य वर्तनी शब्द क्रम और अभिव्यक्ति को मजबूत करती है, जबकि रूप-परिवर्तन अभ्यास शब्दों के बदले हुए रूपों पर ध्यान देता है।" "विशेष अभ्यास से सीखना पूरा होता है" "शब्द सुनना ध्वनि और अर्थ जोड़ता है, हस्तलेखन वर्तनी मजबूत करता है, वाक्य वर्तनी सटीक आउटपुट बनाती है, रूप अभ्यास गलतियां घटाता है, और पढ़ने-सुनने की चुनौतियां क्षमता जांचती हैं। दैनिक लक्ष्य, समीक्षा और आंकड़े प्रगति को स्पष्ट बनाते हैं।" "$language सीखना शुरू करें" "WordKing, $language सीखना, भाषा सीखने वाला ऐप, शब्दावली ऐप, गहन श्रवण, वाक्य वर्तनी, रूप अभ्यास, वैज्ञानिक पुनरावृत्ति") }
        "Italian" { return (GenericArticle $language "WordKing per imparare ${language}: non solo vocaboli, ma allenamento completo" "**WordKing** aiuta chi studia $language a trasformare il vocabolario in abilità reale. Combina memorizzazione, ripasso, ascolto delle parole, scrittura a mano, spelling di frasi, allenamento delle forme, ascolto intensivo con video e sfide di lettura e ascolto." "Perché memorizzare non basta" "Una parola non è solo una traduzione: ha suono, ortografia, esempi, forme e contesto. WordKing offre controllo di padronanza, scelta del significato, riconoscimento della pronuncia, scelta inversa, spelling e ripasso scientifico. Le parole deboli tornano più spesso, quelle note meno inutilmente." "Ascolto intensivo e contesto reale" "Con l'ascolto intensivo puoi aggiungere video e lavorare con i sottotitoli. Le parole appaiono con ritmo, velocità, pause e situazione reale. Lo spelling di frasi allena ordine e strutture, mentre l'allenamento delle forme rafforza variazioni e derivazioni." "Allenamenti mirati per imparare meglio" "L'ascolto delle parole collega suono, significato ed esempi. La scrittura a mano rafforza l'ortografia. Lo spelling di frasi migliora la produzione. Le forme riducono errori in lettura e scrittura. Le sfide misurano il riconoscimento. Obiettivi, ripassi e dati rendono visibili i progressi." "Inizia a imparare $language" "WordKing, imparare $language, app lingue, vocabolario, ascolto intensivo, spelling frasi, forme delle parole, ripasso scientifico") }
        "Japanese" { return (GenericArticle $language "WordKingで学ぶ$language：単語暗記を超えた総合トレーニング" "**WordKing** は、$language の語彙を実際に使える力へ変えるための学習ツールです。単語学習、復習、単語リスニング、手書き練習、文のスペリング、語形変化トレーニング、動画を使った精聴、読解とリスニングのチャレンジを組み合わせます。" "暗記だけでは足りない理由" "単語には意味だけでなく、音、つづり、例文、語形、文脈があります。WordKing では意味判別、発音判別、逆選択、スペリング、計画的な復習など、複数の角度から同じ単語に触れます。苦手な単語は多く出現し、覚えた単語の無駄な反復は減ります。" "動画精聴と本物の文脈" "動画と字幕を使った精聴では、語速、リズム、間、感情、文脈をまとめて練習できます。文のスペリングは語順や表現を鍛え、語形変化トレーニングは原形以外の形を正しく認識し書く力を強化します。" "専門練習で学習を立体化" "単語リスニングは音と意味を結び、手書きはつづりの記憶を強めます。文のスペリングは正確なアウトプットを育て、語形変化は読解と作文のミスを減らします。読解・リスニングチャレンジや学習データにより、進歩を確認しながら続けられます。" "$language 学習を始める" "WordKing, $language 学習, 語学アプリ, 単語アプリ, 精聴, 文スペリング, 語形変化, 科学的復習") }
        "Javanese" { return (GenericArticle $language "WordKing kanggo sinau ${language}: ora mung ngapalake tembung" "**WordKing** mbantu sing sinau $language supaya kosakata dadi kemampuan nyata. Ana sinau tembung, mbaleni, ngrungokake tembung, latihan tulisan tangan, ejaan ukara, latihan owah-owahan tembung, ngrungokake intensif nganggo video, lan tantangan maca utawa ngrungokake." "Napa ngapalake wae ora cukup" "Tembung ora mung tegese. Ana swara, ejaan, conto, bentuk, lan konteks. WordKing menehi latihan makna, pangucapan, pilihan balik, ejaan, lan review sing teratur. Tembung sing ringkih muncul luwih kerep, dene tembung sing wis kuwat ora bola-bali tanpa perlu." "Ngrungokake intensif lan konteks nyata" "Kanthi video lan subtitle, pangguna bisa mbaleni ukara, ngrasakake irama lan kacepetan, lan ngenali tembung ing kahanan nyata. Ejaan ukara nglatih susunan lan ekspresi, dene latihan bentuk tembung mbantu nguwatake owah-owahan tembung." "Latihan khusus nggawe sinau luwih lengkap" "Ngrungokake tembung nyambungake swara lan makna, tulisan tangan nguwatake ejaan, ejaan ukara nglatih output, latihan bentuk nyuda kesalahan, lan tantangan maca-ngrungokake mriksa kemampuan. Data sinau nuduhake kemajuan saben dina." "Miwiti sinau $language" "WordKing, sinau $language, aplikasi basa, kosakata, ngrungokake intensif, ejaan ukara, latihan bentuk tembung, review ilmiah") }
        "Korean" { return (GenericArticle $language "WordKing으로 배우는 ${language}: 단어 암기를 넘어선 종합 훈련" "**WordKing**은 $language 학습자가 어휘를 실제 언어 능력으로 바꾸도록 돕습니다. 단어 학습, 복습, 단어 듣기, 손글씨, 문장 스펠링, 변화형 훈련, 영상 정밀 듣기, 읽기와 듣기 챌린지를 함께 제공합니다." "암기만으로 부족한 이유" "단어에는 뜻뿐 아니라 소리, 철자, 예문, 형태, 문맥이 있습니다. WordKing은 의미 구별, 발음 구별, 역선택, 철자 연습, 계획 복습 등 여러 방식으로 같은 단어를 반복하게 합니다. 약한 단어는 더 자주 나오고 익숙한 단어의 불필요한 반복은 줄어듭니다." "영상 정밀 듣기와 실제 문맥" "영상과 자막을 활용한 정밀 듣기는 실제 속도, 리듬, 멈춤, 감정, 문맥을 함께 훈련합니다. 문장 스펠링은 어순과 표현을 익히게 하고, 변화형 훈련은 단어의 다양한 형태를 정확히 쓰고 알아보는 데 도움을 줍니다." "전문 훈련으로 더 완성도 있게" "단어 듣기는 발음과 뜻을 연결하고, 손글씨는 철자 기억을 강화합니다. 문장 스펠링은 정확한 출력 능력을 키우며, 변화형 훈련은 읽기와 쓰기 오류를 줄입니다. 읽기와 듣기 챌린지, 학습 데이터는 진전을 눈에 보이게 합니다." "$language 학습 시작하기" "WordKing, $language 학습, 언어 학습 앱, 단어 앱, 정밀 듣기, 문장 스펠링, 변화형 훈련, 과학적 복습") }
        "Marathi" { return (GenericArticle $language "WordKing द्वारे $language शिकणे: फक्त शब्द पाठांतर नाही" "**WordKing** $language शिकणाऱ्यांना शब्दसंग्रहाला खऱ्या भाषिक क्षमतेत बदलण्यास मदत करते. यात शब्द शिकणे, पुनरावृत्ती, शब्द ऐकणे, हस्तलेखन, वाक्य स्पेलिंग, रूप-प्रशिक्षण, व्हिडिओसह सखोल श्रवण आणि वाचन-श्रवण आव्हाने एकत्र येतात." "फक्त पाठांतर पुरेसे का नाही" "एखादा शब्द म्हणजे केवळ भाषांतर नसते. त्यात उच्चार, स्पेलिंग, उदाहरणे, रूपे आणि संदर्भ असतो. WordKing अर्थ ओळख, उच्चार ओळख, उलट निवड, स्पेलिंग आणि नियोजित पुनरावृत्ती देतो. कमकुवत शब्द जास्त वेळा दिसतात आणि पक्क्या शब्दांवरील अनावश्यक पुनरावृत्ती कमी होते." "सखोल श्रवण आणि खरा संदर्भ" "व्हिडिओ आणि उपशीर्षकांसह सराव केल्याने वेग, लय, थांबे, भावना आणि संदर्भ एकत्र शिकता येतात. वाक्य स्पेलिंग शब्दक्रम आणि पूर्ण अभिव्यक्ती मजबूत करते. रूप-प्रशिक्षण बदललेल्या शब्दरूपांना ओळखणे आणि लिहिणे सोपे करते." "विशेष सरावामुळे शिकणे पूर्ण होते" "शब्द ऐकणे उच्चार आणि अर्थ जोडते, हस्तलेखन स्पेलिंग मजबूत करते, वाक्य स्पेलिंग अचूक आउटपुट वाढवते, रूप सराव चुका कमी करतो. वाचन आणि श्रवण आव्हाने शब्द ओळख तपासतात. दैनंदिन ध्येये, पुनरावृत्ती आणि आकडेवारी प्रगती स्पष्ट करतात." "$language शिकायला सुरुवात करा" "WordKing, $language शिकणे, भाषा शिक्षण अॅप, शब्दसंग्रह, सखोल श्रवण, वाक्य स्पेलिंग, रूप प्रशिक्षण, वैज्ञानिक पुनरावृत्ती") }
        "Punjabi" { return (GenericArticle $language "WordKing ਨਾਲ $language ਸਿੱਖਣਾ: ਸਿਰਫ਼ ਸ਼ਬਦ ਯਾਦ ਕਰਨ ਤੋਂ ਅੱਗੇ" "**WordKing** $language ਸਿੱਖਣ ਵਾਲਿਆਂ ਨੂੰ ਸ਼ਬਦਾਵਲੀ ਨੂੰ ਅਸਲੀ ਭਾਸ਼ਾਈ ਯੋਗਤਾ ਵਿੱਚ ਬਦਲਣ ਵਿੱਚ ਮਦਦ ਕਰਦਾ ਹੈ। ਇਸ ਵਿੱਚ ਸ਼ਬਦ ਸਿੱਖਣਾ, ਦੁਹਰਾਈ, ਸ਼ਬਦ ਸੁਣਨਾ, ਹੱਥ ਨਾਲ ਲਿਖਣਾ, ਵਾਕ ਸਪੈਲਿੰਗ, ਰੂਪ ਬਦਲਾਅ ਅਭਿਆਸ, ਵੀਡੀਓ ਨਾਲ ਗਹਿਰਾ ਸੁਣਨਾ, ਪੜ੍ਹਨ ਅਤੇ ਸੁਣਨ ਦੀਆਂ ਚੁਣੌਤੀਆਂ ਸ਼ਾਮਲ ਹਨ।" "ਸਿਰਫ਼ ਰਟਣਾ ਕਿਉਂ ਕਾਫ਼ੀ ਨਹੀਂ" "ਇੱਕ ਸ਼ਬਦ ਸਿਰਫ਼ ਅਨੁਵਾਦ ਨਹੀਂ ਹੁੰਦਾ। ਇਸ ਦੀ ਆਵਾਜ਼, ਸਪੈਲਿੰਗ, ਉਦਾਹਰਣਾਂ, ਰੂਪ ਅਤੇ ਸੰਦਰਭ ਹੁੰਦੇ ਹਨ। WordKing ਅਰਥ ਪਛਾਣ, ਉਚਾਰਣ ਪਛਾਣ, ਉਲਟੀ ਚੋਣ, ਸਪੈਲਿੰਗ ਅਤੇ ਵਿਗਿਆਨਕ ਦੁਹਰਾਈ ਦਿੰਦਾ ਹੈ। ਕਮਜ਼ੋਰ ਸ਼ਬਦ ਵੱਧ ਆਉਂਦੇ ਹਨ ਅਤੇ ਪੱਕੇ ਸ਼ਬਦਾਂ ਦੀ ਗੈਰ-ਜ਼ਰੂਰੀ ਦੁਹਰਾਈ ਘਟਦੀ ਹੈ।" "ਗਹਿਰਾ ਸੁਣਨਾ ਅਤੇ ਅਸਲੀ ਸੰਦਰਭ" "ਵੀਡੀਓ ਅਤੇ ਸਬਟਾਈਟਲ ਨਾਲ ਅਭਿਆਸ ਵਿੱਚ ਗਤੀ, ਲਹਿਰ, ਠਹਿਰਾਅ, ਭਾਵਨਾ ਅਤੇ ਸੰਦਰਭ ਇਕੱਠੇ ਆਉਂਦੇ ਹਨ। ਵਾਕ ਸਪੈਲਿੰਗ ਸ਼ਬਦ ਕ੍ਰਮ ਅਤੇ ਪੂਰੀ ਅਭਿਵਿਅਕਤੀ ਨੂੰ ਮਜ਼ਬੂਤ ਕਰਦੀ ਹੈ। ਰੂਪ ਅਭਿਆਸ ਬਦਲੇ ਹੋਏ ਸ਼ਬਦ ਰੂਪ ਪਛਾਣਨ ਅਤੇ ਲਿਖਣ ਵਿੱਚ ਮਦਦ ਕਰਦਾ ਹੈ।" "ਖਾਸ ਅਭਿਆਸ ਸਿੱਖਣ ਨੂੰ ਪੂਰਾ ਕਰਦਾ ਹੈ" "ਸ਼ਬਦ ਸੁਣਨਾ ਆਵਾਜ਼ ਅਤੇ ਅਰਥ ਜੋੜਦਾ ਹੈ, ਹੱਥ ਨਾਲ ਲਿਖਣਾ ਸਪੈਲਿੰਗ ਮਜ਼ਬੂਤ ਕਰਦਾ ਹੈ, ਵਾਕ ਸਪੈਲਿੰਗ ਸਹੀ ਲਿਖਣ ਦੀ ਯੋਗਤਾ ਵਧਾਉਂਦੀ ਹੈ, ਰੂਪ ਅਭਿਆਸ ਗਲਤੀਆਂ ਘਟਾਉਂਦਾ ਹੈ। ਪੜ੍ਹਨ ਅਤੇ ਸੁਣਨ ਚੁਣੌਤੀਆਂ ਮੌਜੂਦਾ ਯੋਗਤਾ ਮਾਪਦੀਆਂ ਹਨ। ਡਾਟਾ ਪ੍ਰਗਤੀ ਨੂੰ ਸਾਫ਼ ਦਿਖਾਉਂਦਾ ਹੈ।" "$language ਸਿੱਖਣਾ ਸ਼ੁਰੂ ਕਰੋ" "WordKing, $language ਸਿੱਖਣਾ, ਭਾਸ਼ਾ ਸਿੱਖਣ ਐਪ, ਸ਼ਬਦਾਵਲੀ, ਗਹਿਰਾ ਸੁਣਨਾ, ਵਾਕ ਸਪੈਲਿੰਗ, ਰੂਪ ਅਭਿਆਸ, ਵਿਗਿਆਨਕ ਦੁਹਰਾਈ") }
        "Portuguese" { return (GenericArticle $language "WordKing para aprender ${language}: mais que memorizar palavras" "**WordKing** ajuda estudantes de $language a transformar vocabulário em habilidade real. Ele combina memorização, revisão, escuta de palavras, escrita manual, soletração de frases, treino de flexões, escuta intensiva com vídeo e desafios de leitura e audição." "Por que memorizar não basta" "Uma palavra não é apenas tradução. Ela tem som, ortografia, exemplos, formas e contexto. WordKing oferece reconhecimento de significado, reconhecimento de pronúncia, seleção inversa, soletração e revisão científica. Palavras fracas aparecem mais vezes; palavras dominadas recebem menos repetição desnecessária." "Escuta intensiva e contexto real" "Com vídeos e legendas, o estudante pratica velocidade, ritmo, pausas, emoção e contexto. A soletração de frases treina ordem das palavras e expressão completa. O treino de flexões ajuda a reconhecer e escrever formas diferentes da palavra." "Prática especializada para aprender melhor" "Escutar palavras liga som, sentido e exemplos. Escrever à mão fortalece a ortografia. Soletrar frases melhora a produção. Treinar flexões reduz erros. Desafios de leitura e audição medem reconhecimento. Metas, revisões e dados tornam o progresso visível." "Comece a aprender $language" "WordKing, aprender $language, aplicativo de idiomas, vocabulário, escuta intensiva, soletração de frases, treino de flexões, revisão científica") }
        "Russian" { return (GenericArticle $language "WordKing для изучения ${language}: не только слова, а полноценная тренировка" "**WordKing** помогает изучающим $language превращать словарный запас в реальный навык. Приложение объединяет запоминание слов, повторение, прослушивание слов, рукописную практику, написание предложений, тренировку форм, интенсивное аудирование с видео, а также задания на чтение и слушание." "Почему одного запоминания мало" "Слово состоит не только из перевода. У него есть звучание, написание, примеры, формы и контекст. WordKing предлагает распознавание значения, распознавание произношения, обратный выбор, правописание и научное повторение. Слабые слова появляются чаще, а хорошо знакомые не повторяются без необходимости." "Интенсивное аудирование и реальный контекст" "Пользователь может добавлять видео и работать с субтитрами. Так слова возвращаются в живую речь: темп, ритм, паузы, эмоции и контекст. Написание предложений тренирует порядок слов и выражения, а тренировка форм помогает закрепить измененные формы слов." "Специальные упражнения делают обучение полнее" "Прослушивание слов связывает звук, значение и примеры. Рукописная практика укрепляет орфографию. Написание предложений развивает точный вывод. Тренировка форм снижает ошибки. Челленджи по чтению и аудированию проверяют распознавание, а статистика показывает прогресс." "Начните изучать $language" "WordKing, изучение $language, приложение для языков, словарный запас, интенсивное аудирование, написание предложений, тренировка форм, научное повторение") }
        "Spanish" { return (GenericArticle $language "WordKing para aprender ${language}: más que memorizar palabras" "**WordKing** ayuda a los estudiantes de $language a convertir el vocabulario en una habilidad real. Combina aprendizaje de palabras, repaso, escucha de palabras, escritura a mano, deletreo de oraciones, entrenamiento de formas, escucha intensiva con video y retos de lectura y escucha." "Por qué memorizar no es suficiente" "Una palabra no es solo una traducción. Tiene sonido, ortografía, ejemplos, formas y contexto. WordKing ofrece reconocimiento de significado, reconocimiento de pronunciación, selección inversa, deletreo y repaso científico. Las palabras débiles aparecen más y las dominadas reciben menos repetición innecesaria." "Escucha intensiva y contexto real" "Con videos y subtítulos, el estudiante practica velocidad, ritmo, pausas, emoción y contexto. El deletreo de oraciones entrena el orden de palabras y la expresión completa. El entrenamiento de formas ayuda a reconocer y escribir variantes de una palabra." "Práctica especializada para avanzar" "Escuchar palabras conecta sonido, significado y ejemplos. La escritura a mano refuerza la ortografía. El deletreo de oraciones mejora la producción. Las formas reducen errores. Los retos de lectura y escucha miden el reconocimiento. Metas, repasos y datos hacen visible el progreso." "Empieza a aprender $language" "WordKing, aprender $language, app de idiomas, vocabulario, escucha intensiva, deletreo de oraciones, entrenamiento de formas, repaso científico") }
        "Tamil" { return (GenericArticle $language "WordKing மூலம் $language கற்றல்: சொற்களை மனப்பாடம் செய்வதை விட அதிகம்" "**WordKing** $language கற்றவர்களுக்கு சொற்களை உண்மையான மொழித் திறனாக மாற்ற உதவுகிறது. சொல் கற்றல், மீளாய்வு, சொல் கேட்பு, கைஎழுத்து, வாக்கிய எழுத்துப்பிழை பயிற்சி, சொல் வடிவ மாற்றப் பயிற்சி, வீடியோவுடன் தீவிர கேட்பு, வாசிப்பு மற்றும் கேட்பு சவால்கள் ஆகியவை இதில் இணைகின்றன." "மனப்பாடம் மட்டும் ஏன் போதாது" "ஒரு சொல் வெறும் மொழிபெயர்ப்பு அல்ல. அதற்கு ஒலி, எழுத்து, எடுத்துக்காட்டுகள், வடிவங்கள் மற்றும் சூழல் உள்ளன. WordKing அர்த்தம் அறிதல், உச்சரிப்பு அறிதல், எதிர் தேர்வு, எழுத்துப்பயிற்சி மற்றும் திட்டமிட்ட மீளாய்வு வழங்குகிறது. பலவீனமான சொற்கள் அதிகம் தோன்றும்; நன்கு அறிந்த சொற்களில் தேவையற்ற மீட்பு குறையும்." "தீவிர கேட்பு மற்றும் உண்மையான சூழல்" "வீடியோ மற்றும் வசனங்களுடன் பயிற்சி செய்தால் வேகம், தாளம், இடைநிறுத்தம், உணர்ச்சி மற்றும் சூழல் ஒன்றாக கற்றுக்கொள்ள முடியும். வாக்கிய எழுத்துப்பயிற்சி சொல் வரிசை மற்றும் முழு வெளிப்பாட்டை வலுப்படுத்தும். வடிவ மாற்றப் பயிற்சி சொற்களின் மாறிய வடிவங்களை எழுதவும் அடையாளம் காணவும் உதவும்." "சிறப்பு பயிற்சிகள் கற்றலை முழுமையாக்கும்" "சொல் கேட்பு ஒலியும் அர்த்தமும் இணைக்கும், கைஎழுத்து எழுத்து நினைவைக் காக்கும், வாக்கிய எழுத்து துல்லியமான வெளிப்பாட்டை மேம்படுத்தும், வடிவப் பயிற்சி பிழைகளை குறைக்கும். வாசிப்பு மற்றும் கேட்பு சவால்கள் திறனை மதிப்பிடும். இலக்குகள், மீளாய்வு மற்றும் தரவுகள் முன்னேற்றத்தை தெளிவாக காட்டும்." "$language கற்றலை தொடங்குங்கள்" "WordKing, $language கற்றல், மொழி கற்றல் செயலி, சொற்களஞ்சியம், தீவிர கேட்பு, வாக்கிய எழுத்துப்பயிற்சி, வடிவ மாற்றப் பயிற்சி, அறிவியல் மீளாய்வு") }
        "Telugu" { return (GenericArticle $language "WordKing తో $language నేర్చుకోవడం: పదాలు కంఠస్థం చేయడాన్ని మించి" "**WordKing** $language నేర్చుకునేవారికి పదసంపదను నిజమైన భాషా సామర్థ్యంగా మార్చడంలో సహాయపడుతుంది. పదాల అభ్యాసం, పునశ్చరణ, పదాలు వినడం, చేతిరాత, వాక్య స్పెల్లింగ్, రూప మార్పు శిక్షణ, వీడియోతో గాఢ వినికిడి, చదవడం మరియు వినికిడి ఛాలెంజ్‌లు ఇందులో కలిసుంటాయి." "కంఠస్థం మాత్రమే ఎందుకు సరిపోదు" "ఒక పదం కేవలం అనువాదం కాదు. దానికి శబ్దం, స్పెల్లింగ్, ఉదాహరణలు, రూపాలు మరియు సందర్భం ఉంటాయి. WordKing అర్థ గుర్తింపు, ఉచ్చారణ గుర్తింపు, రివర్స్ ఎంపిక, స్పెల్లింగ్ మరియు శాస్త్రీయ పునశ్చరణను అందిస్తుంది. బలహీన పదాలు ఎక్కువగా కనిపిస్తాయి; తెలిసిన పదాల అనవసర పునరావృతం తగ్గుతుంది." "గాఢ వినికిడి మరియు నిజమైన సందర్భం" "వీడియోలు మరియు సబ్‌టైటిళ్లతో సాధన చేస్తే వేగం, లయ, విరామం, భావం మరియు సందర్భం కలిసి వస్తాయి. వాక్య స్పెల్లింగ్ పద క్రమం మరియు పూర్తి వ్యక్తీకరణను బలోపేతం చేస్తుంది. రూప మార్పు శిక్షణ పదాల మారిన రూపాలను గుర్తించడానికి మరియు రాయడానికి సహాయపడుతుంది." "ప్రత్యేక సాధనతో అభ్యాసం పూర్తవుతుంది" "పద వినికిడి శబ్దం మరియు అర్థాన్ని కలుపుతుంది, చేతిరాత స్పెల్లింగ్ జ్ఞాపకాన్ని బలపరుస్తుంది, వాక్య స్పెల్లింగ్ ఖచ్చితమైన అవుట్‌పుట్‌ను మెరుగుపరుస్తుంది, రూప సాధన తప్పులను తగ్గిస్తుంది. చదవడం మరియు వినికిడి ఛాలెంజ్‌లు సామర్థ్యాన్ని పరీక్షిస్తాయి. లక్ష్యాలు, పునశ్చరణలు మరియు డేటా పురోగతిని స్పష్టంగా చూపిస్తాయి." "$language నేర్చుకోవడం ప్రారంభించండి" "WordKing, $language నేర్చుకోవడం, భాషా అభ్యాస యాప్, పదసంపద, గాఢ వినికిడి, వాక్య స్పెల్లింగ్, రూప మార్పు శిక్షణ, శాస్త్రీయ పునశ్చరణ") }
        "Turkish" { return (GenericArticle $language "WordKing ile $language öğrenmek: kelime ezberinden daha fazlası" "**WordKing**, $language öğrenenlerin kelimeleri gerçek dil becerisine dönüştürmesine yardımcı olur. Kelime öğrenme, tekrar, kelime dinleme, el yazısı, cümle yazımı, çekim çalışması, video ile yoğun dinleme, okuma ve dinleme meydan okumalarını bir araya getirir." "Neden sadece ezber yeterli değildir" "Bir kelime yalnızca anlamdan ibaret değildir; sesi, yazımı, örnekleri, biçimleri ve bağlamı vardır. WordKing anlam ayırt etme, telaffuz ayırt etme, ters seçim, yazım ve bilimsel tekrar sunar. Zayıf kelimeler daha sık görünür, öğrenilmiş kelimelerde gereksiz tekrar azalır." "Yoğun dinleme ve gerçek bağlam" "Video ve altyazılarla yapılan yoğun dinleme, kelimeleri gerçek hız, ritim, duraklama, duygu ve bağlam içinde gösterir. Cümle yazımı kelime sırasını ve ifadeyi güçlendirir. Çekim çalışması ise kelimenin farklı biçimlerini tanımaya ve yazmaya yardımcı olur." "Özel çalışmalar öğrenmeyi tamamlar" "Kelime dinleme ses ve anlamı bağlar, el yazısı yazımı güçlendirir, cümle yazımı doğru üretimi geliştirir, çekim çalışması hataları azaltır. Okuma ve dinleme meydan okumaları mevcut kelime tanıma gücünü ölçer. Hedefler, tekrarlar ve veriler ilerlemeyi görünür kılar." "$language öğrenmeye başlayın" "WordKing, $language öğrenme, dil öğrenme uygulaması, kelime uygulaması, yoğun dinleme, cümle yazımı, çekim çalışması, bilimsel tekrar") }
        "Urdu" { return (GenericArticle $language "WordKing سے $language سیکھنا: صرف الفاظ یاد کرنا نہیں" "**WordKing** $language سیکھنے والوں کو الفاظ کو حقیقی زبان کی صلاحیت میں بدلنے میں مدد دیتا ہے۔ اس میں الفاظ سیکھنا، دہرائی، الفاظ سننا، ہاتھ سے لکھنا، جملوں کی ہجے، لفظی صورتوں کی مشق، ویڈیو کے ساتھ گہری سماعت، پڑھنے اور سننے کے چیلنج شامل ہیں۔" "صرف رٹنا کافی کیوں نہیں" "ایک لفظ صرف ترجمہ نہیں ہوتا؛ اس کی آواز، ہجے، مثالیں، صورتیں اور سیاق بھی ہوتے ہیں۔ WordKing معنی پہچاننے، تلفظ پہچاننے، الٹی انتخابی مشق، ہجے اور سائنسی دہرائی کے ذریعے ایک ہی لفظ کو کئی زاویوں سے مضبوط کرتا ہے۔ کمزور الفاظ زیادہ آتے ہیں اور پکے الفاظ پر غیر ضروری وقت کم لگتا ہے۔" "گہری سماعت اور حقیقی سیاق" "ویڈیو اور سب ٹائٹل کے ساتھ مشق میں رفتار، لہجہ، وقفہ، جذبات اور سیاق ایک ساتھ آتے ہیں۔ جملوں کی ہجے لفظوں کی ترتیب اور مکمل اظہار کو مضبوط کرتی ہے، جبکہ صورتوں کی مشق بدلی ہوئی شکلوں کو پہچاننے اور لکھنے میں مدد دیتی ہے۔" "خصوصی مشق سے سیکھنا مکمل ہوتا ہے" "الفاظ سننا آواز اور معنی کو جوڑتا ہے، ہاتھ سے لکھنا ہجے مضبوط کرتا ہے، جملوں کی ہجے درست اظہار بناتی ہے، صورتوں کی مشق غلطیاں کم کرتی ہے، اور پڑھنے سننے کے چیلنج صلاحیت جانچتے ہیں۔ روزانہ اہداف، دہرائی اور اعداد و شمار ترقی کو واضح کرتے ہیں۔" "$language سیکھنا شروع کریں" "WordKing, $language سیکھنا, زبان سیکھنے کی ایپ, الفاظ, گہری سماعت, جملوں کی ہجے, صورتوں کی مشق, سائنسی دہرائی") }
        "Vietnamese" { return (GenericArticle $language "Học $language với WordKing: không chỉ ghi nhớ từ vựng" "**WordKing** giúp người học $language biến từ vựng thành năng lực ngôn ngữ thật sự. Ứng dụng kết hợp học từ, ôn tập, nghe từ, viết tay, chính tả câu, luyện biến đổi từ, nghe chuyên sâu bằng video, thử thách đọc và thử thách nghe." "Vì sao chỉ học thuộc là chưa đủ" "Một từ không chỉ có nghĩa dịch. Nó còn có âm thanh, cách viết, ví dụ, hình thái và ngữ cảnh. WordKing cung cấp nhận biết nghĩa, nhận biết phát âm, chọn nghĩa ngược, luyện chính tả và ôn tập khoa học. Từ yếu xuất hiện nhiều hơn, còn từ đã quen giảm lặp lại không cần thiết." "Nghe chuyên sâu và ngữ cảnh thật" "Với video và phụ đề, người học luyện được tốc độ, nhịp điệu, khoảng dừng, cảm xúc và ngữ cảnh cùng lúc. Chính tả câu giúp luyện trật tự từ và cách diễn đạt hoàn chỉnh. Luyện biến đổi từ giúp nhận ra và viết đúng các dạng khác nhau của từ." "Luyện tập chuyên biệt giúp học toàn diện" "Nghe từ kết nối âm thanh, nghĩa và ví dụ. Viết tay củng cố chính tả. Chính tả câu cải thiện khả năng diễn đạt chính xác. Luyện biến đổi từ giảm lỗi khi đọc và viết. Thử thách đọc và nghe kiểm tra khả năng nhận diện từ vựng. Mục tiêu, ôn tập và dữ liệu giúp tiến bộ trở nên rõ ràng." "Bắt đầu học $language" "WordKing, học $language, ứng dụng học ngôn ngữ, từ vựng, nghe chuyên sâu, chính tả câu, luyện biến đổi từ, ôn tập khoa học") }
        default { return (EnglishArticle $language) }
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
        if ((Test-Path -LiteralPath $path) -and -not $Overwrite) {
            $skipped++
            continue
        }

        $language = LearnName $source.Name $target.Name
        $content = (Article $target.Name $language).TrimEnd() + "`r`n" + (GoogleTag)
        Write-Utf8File $path $content
        $written++
    }
}

Write-Host "Generated $written article files for $Date. Skipped $skipped existing files."

