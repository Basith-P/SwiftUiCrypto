//
//  Double.swift
//  SwiftUiCrypto
//
//  Created by Basith on 20/10/24.
//

import Foundation

extension Double {
    
    /// Converts a Double into a Currency with 2 decimal places
    /// ```
    /// Convert 1234.56 to $1,234.56
    /// ```
    private var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    /// Converts a Double into a Currency as a String with 2 decimal places
    /// ```
    /// Convert 1234.56 to "$1,234.56"
    /// ```
    func asCurrencyWith2DecimalPlaces() -> String {
        return currencyFormatter2.string(from: NSNumber(value: self)) ?? "$0.00"
    }
    
    /// Converts a Double into a Currency with 2-6 decimal places
    /// ```
    /// Convert 1234.56 to $1,234.56
    /// Convert 12.3456 to $12.3456
    /// Convert 0.123456 to $0.123456
    /// ```
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
//        formatter.locale = .current
//        formatter.currencyCode = "USD"
//        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    /// Converts a Double into a Currency as a String with 2-6 decimal places
    /// ```
    /// Convert 1234.56 to "$1,234.56"
    /// Convert 12.3456 to "$12.3456"
    /// Convert 0.123456 to "$0.123456"
    /// ```
    func asCurrencyWith6DecimalPlaces() -> String {
        return currencyFormatter6.string(from: NSNumber(value: self)) ?? "$0.00"
    }
    
    /// Converts a Double into a String representation
    /// ```
    /// Convert 1.23456 to "1.23"
    /// ```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    /// Converts a Double into a String representation with  percent symbol
    /// ```
    /// Convert 1.23456 to "1.23%"
    /// ```
    func asPercentString() -> String {
//        let formatter = NumberFormatter()
//        let number = NSNumber(value: self)
//        
//        if self.isNaN {
//            return "0.00%"
//        }
//        
//        if self.isInfinite {
//            return self.isSignalingNaN ? "-inf" : "inf"
//        }
//        
//        formatter.numberStyle = .percent
//        formatter.minimumFractionDigits = 2
//        formatter.maximumFractionDigits = 2
//        
//        return formatter.string(from: number) ?? "0.00%"
        return asNumberString() + "%"
    }
}
