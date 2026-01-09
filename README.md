# ScoreFormater

Author: SoufianoDev

## Language / اللغة

This project also provides an Arabic version of this README. To view the Arabic version, click the link below:
- [View Arabic README](README_ar.md)


ScoreFormater is a small, dependency-free utility for Godot projects that formats large integer scores into compact, human-friendly strings using the familiar K / M / B suffixes. It is compatible with Godot 3.x and Godot 4.x and can be used either as a simple script or registered as an Autoload singleton.

## Features

- Converts large numbers to shorthand with one decimal precision when needed (e.g., 23444334 → $23.4M)
- Zero dependencies, minimal footprint
- Compatible with Godot 3.x and Godot 4.x
- Can be used locally or globally via Autoload

## Installation (Adding the Library to Your Project)

### Manual Installation (Recommended)

1. Copy the folder `addons/ScoreFormater/`
2. Paste it into your project at `res://addons/`

### Optional: Enable as Autoload

1. Project → Project Settings → Autoload
2. Path: `res://addons/ScoreFormatter/ScoreFormatter.gd`
3. Name: `ScoreFormater`
4. Enable

## Usage

```gdscript
var text = ScoreFormatter.format_score(23444334)
print(text) # $23.4M
```

Without Autoload:
```gdscript
var sf = load("res://addons/ScoreFormatter/ScoreFormatter.gd").new()
var text = sf.format_score(23444334)
```

## API

`format_score(score: int) -> String`

## Large Value Safety

Maximum allowed value:
```
MAX_SCL = 2_000_000_000
```

Values above this return the original number as a string.

## License

MIT License

## Contributing

Pull requests and improvements are welcome.

