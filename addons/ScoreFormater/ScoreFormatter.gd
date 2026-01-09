extends Node

# =====================================================
# ScoreFormatter.gd
# Author: SoufianoDev
# Description: Professional Godot utility to format
# large integer scores into human-readable strings
# with K / M / B suffixes, compatible with Godot 3.x & 4.x.
# =====================================================

class_name ScoreFormatter

# =====================================================
# Constants for thresholds
# =====================================================
class Scl:
    const K = 1000
    const M = 1000000
    const B = 1000000000
    const MAX_SCL = 2000000000

class Sfx:
    const K = "K"
    const M = "M"
    const B = "B"

# =====================================================
# Private helper function: formats a number with a suffix
# @param s: int - the number to format
# @param scl: int - threshold value for the suffix
# @param sfx: String - suffix to append (K, M, B)
# @return: String - formatted score
# =====================================================
func _fs(s: int, scl: int, sfx: String) -> String:
    if s % scl == 0:
        return "$" + str(s / scl) + sfx
    else:
        return "$" + String("%.1f" % (float(s) / scl)) + sfx

# =====================================================
# Public function: format_score
# Converts a large integer into human-friendly string
# Example: 23444334 -> $23.4M
# @param score: int - the number to format
# @return: String - formatted score with suffix
# =====================================================
func format_score(score: int) -> String:
    var s = score

    if s > Scl.MAX_SCL:
        print("You Are A Cheater!")
        return str(s)

    if s >= Scl.B:
        return _fs(s, Scl.B, Sfx.B)
    elif s >= Scl.M:
        return _fs(s, Scl.M, Sfx.M)
    elif s >= Scl.K:
        return _fs(s, Scl.K, Sfx.K)
    else:
        return str(s)
