import UIKit

public enum SystemColors {
  public static var label: UIColor {
    if #available(iOS 13, *) {
      return .label
    }
    return .black
  }
  public static var secondaryLabel: UIColor {
    if #available(iOS 13, *) {
      return .secondaryLabel
    }
    return .lightGray
  }
  public static var systemBackground: UIColor {
    if #available(iOS 13, *) {
      return .systemBackground
    }
    return .white
  }
  public static var secondarySystemBackground: UIColor {
    if #available(iOS 13, *) {
      return .secondarySystemBackground
    }
    return UIColor(white: 247/255, alpha: 1)
  }
  public static var systemRed: UIColor {
    if #available(iOS 13, *) {
      return .systemRed
    }
    return .red
  }
  public static var systemBlue: UIColor {
    if #available(iOS 13, *) {
      return .systemBlue
    }
    return .blue
  }
}
