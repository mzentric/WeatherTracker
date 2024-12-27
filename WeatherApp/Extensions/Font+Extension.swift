import SwiftUI

extension Font {
    static func listAllFonts() {
        for family in UIFont.familyNames.sorted() {
            print("Family: \(family)")
            for name in UIFont.fontNames(forFamilyName: family).sorted() {
                print("   Font: \(name)")
            }
        }
    }
    
    static func poppinsRegular(size: CGFloat) -> Font {
        .custom("Poppins-Regular", size: size)
    }
    
    static func poppinsMedium(size: CGFloat) -> Font {
        .custom("Poppins-Medium", size: size)
    }
    
    static func poppinsLight(size: CGFloat) -> Font {
        .custom("Poppins-Light", size: size)
    }
    
    static func poppinsBold(size: CGFloat) -> Font {
        .custom("Poppins-Bold", size: size)
    }
    
    static func poppinsSemiBold(size: CGFloat) -> Font {
        .custom("Poppins-SemiBold", size: size)
    }
} 