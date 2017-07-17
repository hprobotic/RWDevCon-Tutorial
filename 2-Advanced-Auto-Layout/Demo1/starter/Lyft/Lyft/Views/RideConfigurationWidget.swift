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
final class RideConfigurationWidget: NibView {

  // MARK: - IBOutlets
  @IBOutlet fileprivate var roundedContainer: UIView!
  @IBOutlet fileprivate var pickupView: RideStopView!

  @IBOutlet fileprivate var primeTimeContainer: UIView!
  @IBOutlet fileprivate var primeTimeLabel: UILabel!

  // MARK: - View Life Cycle
  override func awakeFromNib() {
    super.awakeFromNib()

    setPrimeTime(nil, animated: false)
  }
}

// MARK: - Internal
extension RideConfigurationWidget {
  func setPrimeTime(_ primeTime: String?, animated: Bool = true) {

  }
}

// MARK: - Private
private extension RideConfigurationWidget {

  func createNewStop(withTitle title: String, below previousStop: RideStopView) -> RideStopView {
    let newView = RideStopView()
    newView.address = title
    newView.backgroundColor = .white
    newView.cornerRadius = previousStop.cornerRadius
    newView.onAddingRow = !kSimulatedStops.isEmpty ? previousStop.onAddingRow : nil
    newView.tintColor = #colorLiteral(red: 1, green: 0, blue: 0.7490196078, alpha: 1)

    previousStop.tintColor = previousStop == pickupView ? #colorLiteral(red: 0.2078431373, green: 0.137254902, blue: 0.5176470588, alpha: 1) : .gray
    previousStop.onAddingRow = nil
    previousStop.separatorsVisible = true
    previousStop.cornerRadius = 0

    return newView
  }
}

// MARK: - IBActions
extension RideConfigurationWidget {}

// - MARK: Test data
private var kSimulatedStops = [
  "Jefferson Memorial",
  "Lincoln Memorial",
  "Washington Monument",
  "Dulles Airport",
]
