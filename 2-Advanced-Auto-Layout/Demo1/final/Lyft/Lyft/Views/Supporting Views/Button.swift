/**
 * Copyright (c) 2017 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit

final class Button: UIButton {

  // MARK: - Properties
  @IBInspectable var background: UIColor? {
    didSet {
      if let background = background {
        setBackgroundImage(background.asImage(), for: .normal)
      }
    }
  }

  @IBInspectable var highlightedBackground: UIColor? {
    didSet {
      if let background = highlightedBackground {
        setBackgroundImage(background.asImage(), for: .highlighted)
      }
    }
  }
}

// MARK: - Private-UIColor
private extension UIColor {

  func asImage() -> UIImage {
    let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)

    defer { UIGraphicsEndImageContext() }

    if let context = UIGraphicsGetCurrentContext() {
      context.setFillColor(cgColor)
      context.fill(rect)
    }

    return UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
  }
}
