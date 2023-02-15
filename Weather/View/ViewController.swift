//
//  ViewController.swift
//  Weather
//
//  Created by Victor Mendes on 14/02/23.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa

final class ViewController: UIViewController {
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    
    private let viewModel: WeatherViewModelProtocol = WeatherViewModel()
    private let bag = DisposeBag()
    private var location: String = "Guarulhos"
    private var request: Bool = true
    
    // MARK: - Life cycle
    override func loadView() {
        super.loadView()
        bind()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadCurrentTemperature(location)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        temperature.alpha = 0
        currentWeatherImage.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startAnimation()
    }
}

// MARK: - Extension
extension ViewController {
    private func bind() {
        viewModel.currentTemperature
            .map { value in
                self.startAnimation(with: true)
                return value
            }
            .bind(to: temperature.rx.text)
            .disposed(by: bag)
    }
    
    private func startAnimation(with temperature: Bool = false)  {
        UIView.animate(withDuration: 0.2, delay: 0.1, options: .curveEaseOut) {
            self.temperature.alpha = temperature ? 1 : 0
            self.currentWeatherImage.alpha = 1
        }
    }
}
