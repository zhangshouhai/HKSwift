//
//  HKThemes.swift
//  BaseFramework
//
//  Created by mac on 2020/3/11.
//  Copyright © 2020 DH add LK. All rights reserved.
//

import Foundation
import SwiftTheme

private let lastThemeIndexKey = "lastedThemeIndex"
private let defaults = UserDefaults.standard

enum HKThemes: Int {
    
    case LightColor  = 0
    case nightColor  = 1
    
    // MARK: -
    
    static var current: HKThemes { return HKThemes(rawValue: ThemeManager.currentThemeIndex)! }
    static var before = HKThemes.LightColor
    
    // MARK: - Switch Theme
    
    static func switchTo(theme: HKThemes) {
        before = current
        ThemeManager.setTheme(index: theme.rawValue)
    }
    
    static func switchToNext() {
        var next = ThemeManager.currentThemeIndex + 1
        if next > 2 { next = 0 } // cycle and without Night
        switchTo(theme: HKThemes(rawValue: next)!)
    }
    
    // MARK: - Switch Night
    
    static func switchNight(isToNight: Bool) {
        switchTo(theme: isToNight ? .nightColor : before)
    }
    
    static func isNight() -> Bool {
        return current == .nightColor
    }
    
    static func restoreLastTheme() {
        switchTo(theme: HKThemes(rawValue: defaults.integer(forKey: lastThemeIndexKey))!)
    }
    
    static func saveLastTheme() {
        defaults.set(ThemeManager.currentThemeIndex, forKey: lastThemeIndexKey)
    }
    
}
