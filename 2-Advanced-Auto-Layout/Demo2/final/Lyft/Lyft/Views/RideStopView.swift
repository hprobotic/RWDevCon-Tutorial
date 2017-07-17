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

@IBDesignable
final class RideStopView: NibView {

  // MARK: - IBOutlets
  @IBOutlet private var addressLabel: UILabel!
  @IBOutlet private var horizontalSeparator: UIView!
  @IBOutlet private var verticalSeparator: UIView!
  @IBOutlet private var newRowButton: UIButton!

  // MARK: - Properties
  @IBInspectable var separatorsVisible: Bool = false {
    didSet {
      horizontalSeparator.isHidden = !separatorsVisible
      verticalSeparator.isHidden = !separatorsVisible
    }
  }

  @IBInspectable var address: String? {
    get { return self.addressLabel.text }
    set { addressLabel.text = newValue }
  }

  var onAddingRow: (() -> Void)? {
    didSet { newRowButton.isHidden = onAddingRow == nil }
  }

  // MARK: - View Life Cycle
  override func awakeFromNib() {
    super.awakeFromNib()

    horizontalSeparator.isHidden = true
    verticalSeparator.isHidden = true
  }
}

// MARK: - IBActions
private extension RideStopView {

  @IBAction func addIconTapped() {
    onAddingRow?()
  }
}
