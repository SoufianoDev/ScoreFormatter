# منسق الأرقام (ScoreFormatter)

Author: SoufianoDev

## اللغة / Language

يتوفر هذا المشروع أيضًا بالإنجليزية. لعرض النسخة الإنجليزية، انقر على الرابط أدناه:
- [عرض README الإنجليزي](README.md)


منسق الأرقام هو أداة صغيرة وخفيفة لمشاريع Godot تقوم بتحويل الأعداد الصحيحة الكبيرة إلى نصوص مختصرة وسهلة القراءة باستخدام لاحقات K / M / B المألوفة. متوافقة مع Godot 3.x و Godot 4.x، ويمكن استخدامها كسكربت مستقل أو تسجيلها كـ Autoload (Singleton).

## المميزات

- تحويل الأرقام الكبيرة إلى صيغ مختصرة مع دقة عشرية واحدة عند الحاجة (مثال: 23444334 → $23.4M)
- بدون مكتبات خارجية، حجم منخفض جداً
- متوافقة مع Godot 3.x و Godot 4.x
- يمكن استخدامها محلياً أو عالمياً عبر Autoload

## التثبيت (إضافة المكتبة إلى مشروعك)

### التثبيت اليدوي (موصى به)

1. انسخ المجلد `addons/ScoreFormatter/`
2. ضع المجلد في مشروعك تحت `res://addons/`

### تفعيل Autoload (اختياري)

1. افتح Project → Project Settings → Autoload
2. المسار: `res://addons/ScoreFormater/ScoreFormatter.gd`
3. الاسم: `ScoreFormatter`
4. فعّل

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

## الواجهة البرمجية 

`format_score(score: int) -> String`

## التعامل مع القيم الكبيرة

أقصى قيمة مسموح بها:
```
MAX_SCL = 2_000_000_000
```

القيم الأعلى من هذا الحد تُرجع الرقم الأصلي كنص.

## الترخيص

MIT License

## المساهمة

مساهماتك مرحب بها. يمكنك تقديم تحسينات أو تعديلات عبر Pull Request.


