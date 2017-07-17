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

import MapKit
import UIKit

final class MapViewController: UIViewController {

  // MARK: - IBOutlets
  @IBOutlet fileprivate var mapView: MKMapView!
  @IBOutlet fileprivate var rideConfigurationWidget: RideConfigurationWidget!

  // MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    centerMap()

    DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
      self?.rideConfigurationWidget.setPrimeTime("50%")
    }
  }
}

// MARK: - Private
private extension MapViewController {

  func centerMap() {
    let center = CLLocationCoordinate2D(latitude: 38.803023, longitude: -77.065299)
    let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    let region = MKCoordinateRegion(center: center, span: span)
    mapView.setRegion(region, animated: false)
  }
}

