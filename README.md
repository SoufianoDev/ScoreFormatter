# ScoreFormater

Author: SoufianoDev

## Language / اللغة

This project also provides an Arabic version of this README. To view the Arabic version, click the link below:

* [View Arabic README](README_ar.md)

ScoreFormater is a small, dependency-free utility for Godot projects that formats large integer scores into compact, human-friendly strings using the familiar K / M / B suffixes. It is compatible with Godot 3.x and Godot 4.x and can be used either as a simple script or registered as an Autoload singleton.

## Features

* Converts large numbers to shorthand with one decimal precision when needed (e.g., 23444334 → $23.4M)
* Zero dependencies, minimal footprint
* Compatible with Godot 3.x and Godot 4.x
* Can be used locally or globally via Autoload

## Installation (Adding the Library to Your Project)

### Git Installation (Recommended)

You can add **ScoreFormater** to your project using Git, which makes updating and version control easier.

**Option A: As a Git Submodule (Best Practice)**

```bash
git submodule add https://github.com/SoufianoDev/ScoreFormater.git addons/ScoreFormater
```

Then initialize and update submodules:

```bash
git submodule update --init --recursive
```

**Option B: Direct Clone (Simpler)**

```bash
git clone https://github.com/SoufianoDev/ScoreFormater.git addons/ScoreFormater
```

After cloning, the library will be available at:

```
res://addons/ScoreFormater/
```

### Download ZIP (No Git Required)

If you prefer not to use Git, you can install **ScoreFormater** by downloading the repository as a ZIP file.

**Steps:**

1. Go to the GitHub repository page
2. Click **Code → Download ZIP**
3. Extract the ZIP file
4. Copy the folder `ScoreFormater/` into your project at:

```
res://addons/ScoreFormater/
```

### Optional: Enable as Autoload

1. Project → Project Settings → Autoload
2. Path: `res://addons/ScoreFormatter/ScoreFormatter.gd`
3. Name: `ScoreFormater`
4. Enable

## Implementation Guide

This section explains how to integrate **ScoreFormater** correctly in real Godot projects, depending on your project scale and architecture.

### 1. Small / Simple Projects (Local Script Usage)

If your game only needs score formatting in one or two scenes (for example, a single HUD or Game Over screen), using the script locally is recommended.

**Steps:**

1. Keep `ScoreFormatter.gd` inside `addons/ScoreFormatter/`
2. Load and instantiate it where needed

**Example:**

```gdscript
var sf = load("res://addons/ScoreFormatter/ScoreFormatter.gd").new()
label.text = sf.format_score(player_score)
```

**When to use this approach:**

* Small games
* Prototypes
* Avoiding global state

---

### 2. Medium / Large Projects (Autoload Singleton)

For projects where scores are displayed in many places (HUD, pause menu, leaderboard, results screen), enabling **ScoreFormater** as an Autoload is the cleanest solution.

**Steps:**

1. Project → Project Settings → Autoload
2. Add:

   * Path: `res://addons/ScoreFormatter/ScoreFormatter.gd`
   * Name: `ScoreFormatter`
3. Enable the checkbox

Once enabled, the formatter is globally accessible.

**Example:**

```gdscript
label.text = ScoreFormatter.format_score(score)
```

**Advantages:**

* No instantiation needed
* Consistent formatting across the entire project
* Cleaner and shorter code

---

### 3. Godot 3.x vs Godot 4.x Notes

* The library uses only core GDScript features
* No engine-specific APIs are required
* Works identically in **Godot 3.x** and **Godot 4.x**

---

### 4. Performance Considerations

* The formatter operates on integers only
* No allocations except the final string
* Safe to call every frame for UI updates (HUD score counters)

---

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

### `format_score(score: int) -> String`

Formats a numeric score into a compact, human‑readable string using **K / M / B** suffixes.

**Parameters:**

* `score` (`int`): The raw score value to format.

**Returns:**

* `String`: Formatted score string (e.g. `950`, `1K`, `2.5M`).

**Notes:**

* Uses one decimal precision only when needed
* Values greater than `MAX_SCL` are returned as a plain string

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

