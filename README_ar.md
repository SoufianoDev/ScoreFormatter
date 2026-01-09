# منسق الأرقام (ScoreFormater)

Author: SoufianoDev

## اللغة / Language

يتوفر هذا المشروع أيضًا بالإنجليزية. لعرض النسخة الإنجليزية، انقر على الرابط أدناه:

* [عرض README الإنجليزي](README.md)

منسق الأرقام هو أداة صغيرة وخفيفة لمشاريع Godot تقوم بتحويل الأعداد الصحيحة الكبيرة إلى نصوص مختصرة وسهلة القراءة باستخدام لاحقات **K / M / B** المألوفة. الأداة متوافقة مع **Godot 3.x** و **Godot 4.x**، ويمكن استخدامها كسكربت عادي أو تسجيلها كـ **Autoload (Singleton)**.

## المميزات

* تحويل الأرقام الكبيرة إلى صيغ مختصرة مع دقة عشرية واحدة عند الحاجة (مثال: 23444334 → $23.4M)
* بدون أي تبعيات خارجية، وحجم خفيف جدًا
* متوافقة مع Godot 3.x و Godot 4.x
* إمكانية الاستخدام محليًا أو بشكل عام عبر Autoload

## التثبيت (إضافة المكتبة إلى مشروعك)

### التثبيت عبر Git (موصى به)

يمكنك إضافة **ScoreFormater** إلى مشروعك باستخدام Git، مما يسهل التحديث والتحكم في الإصدارات.

**الخيار A: كـ Git Submodule (أفضل ممارسة)**

```bash
git submodule add https://github.com/SoufianoDev/ScoreFormater.git addons/ScoreFormater
```

ثم تهيئة وتحديث الـ submodules:

```bash
git submodule update --init --recursive
```

**الخيار B: الاستنساخ المباشر (أبسط)**

```bash
git clone https://github.com/SoufianoDev/ScoreFormater.git addons/ScoreFormater
```

بعد ذلك ستكون المكتبة متوفرة في المسار:

```
res://addons/ScoreFormater/
```

### التحميل كملف ZIP (بدون Git)

إذا كنت لا تفضل استخدام Git، يمكنك تثبيت **ScoreFormater** عبر تحميل المشروع كملف ZIP.

**الخطوات:**

1. انتقل إلى صفحة المشروع على GitHub
2. اضغط على **Code → Download ZIP**
3. فك ضغط الملف
4. انسخ المجلد `ScoreFormater/` إلى مشروعك داخل:

```
res://addons/ScoreFormater/
```

### تفعيل Autoload (اختياري)

1. افتح: Project → Project Settings → Autoload
2. المسار: `res://addons/ScoreFormatter/ScoreFormatter.gd`
3. الاسم: `ScoreFormatter`
4. فعّل الخيار

## دليل الاستخدام والتطبيق

يوضح هذا القسم الطريقة الصحيحة لاستخدام **ScoreFormater** في مشاريع Godot حسب حجم المشروع وبنيته.

### 1. المشاريع الصغيرة / البسيطة (استخدام محلي)

إذا كان مشروعك يحتاج تنسيق النقاط في مكان أو مكانين فقط (مثل HUD أو شاشة Game Over)، فالاستخدام المحلي هو الأنسب.

**الخطوات:**

1. تأكد من وجود `ScoreFormatter.gd` داخل `addons/ScoreFormatter/`
2. قم بتحميل السكربت وإنشاء كائن عند الحاجة

**مثال:**

```gdscript
var sf = load("res://addons/ScoreFormatter/ScoreFormatter.gd").new()
label.text = sf.format_score(player_score)
```

**متى يُفضّل هذا الأسلوب؟**

* الألعاب الصغيرة
* النماذج الأولية (Prototypes)
* تجنب الحالة العامة (Global State)

---

### 2. المشاريع المتوسطة / الكبيرة (Autoload Singleton)

عند استخدام النقاط في عدة أماكن (HUD، القوائم، لوحة النتائج)، يُنصح بتفعيل **ScoreFormater** كـ Autoload.

**الخطوات:**

1. Project → Project Settings → Autoload
2. أضف:

   * المسار: `res://addons/ScoreFormatter/ScoreFormatter.gd`
   * الاسم: `ScoreFormatter`
3. فعّل الخيار

بعد ذلك يمكن الوصول إلى المنسق من أي مكان في المشروع.

**مثال:**

```gdscript
label.text = ScoreFormatter.format_score(score)
```

**المزايا:**

* لا حاجة لإنشاء كائنات
* تنسيق موحد في كامل المشروع
* كود أنظف وأقصر

---

### 3. ملاحظات Godot 3.x و Godot 4.x

* المكتبة تستخدم ميزات GDScript الأساسية فقط
* لا تعتمد على أي API خاص بالمحرك
* تعمل بنفس السلوك على Godot 3.x و Godot 4.x

---

### 4. الأداء

* تعتمد فقط على العمليات الحسابية البسيطة
* لا يتم إنشاء كائنات إلا للنص النهائي
* آمنة للاستخدام في التحديث المستمر لواجهة المستخدم (HUD)

---

## الاستخدام

```gdscript
var text = ScoreFormatter.format_score(23444334)
print(text) # $23.4M
```

بدون Autoload:

```gdscript
var sf = load("res://addons/ScoreFormatter/ScoreFormatter.gd").new()
var text = sf.format_score(23444334)
```

## الواجهة البرمجية (API)

### `format_score(score: int) -> String`

تقوم هذه الدالة بتحويل الرقم إلى نص مختصر وسهل القراءة باستخدام لاحقات **K / M / B**.

**المعاملات:**

* `score` (`int`): قيمة النقاط الخام.

**القيمة المعادة:**

* `String`: النص المنسق (مثل: `950`، `1K`، `2.5M`).

**ملاحظات:**

* يتم استخدام خانة عشرية واحدة فقط عند الحاجة
* القيم الأكبر من `MAX_SCL` تُعاد كنص عادي بدون تنسيق

## التعامل مع القيم الكبيرة

أقصى قيمة مسموح بها:

```
MAX_SCL = 2_000_000_000
```

أي قيمة تتجاوز هذا الحد سيتم إرجاعها كما هي كنص.

## الترخيص

MIT License

## المساهمة

مساهماتك مرحب بها. يمكنك اقتراح تحسينات أو إرسال Pull Requests.

