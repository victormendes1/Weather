//
//  ViewController.swift
//  Weather
//
//  Created by Victor Mendes on 14/02/23.
//

import UIKit
import Combine

final class ViewController: UIViewController {
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    
    private var subscriptions = Set<AnyCancellable>()
    let viewModel: WeatherViewModelProtocol = WeatherViewModel()
    
    // MARK: - Init
//    init(viewModel: WeatherViewModelProtocol) {
//        self.viewModel = viewModel
//        super.init(nibName: nil, bundle: nil)
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    // MARK: - Life cycle
    override func loadView() {
        super.loadView()
        bind()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadCurrentTemperature()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.temperature.alpha = 0
        self.currentWeatherImage.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
            self.currentWeatherImage.alpha = 1
        }
    }
    
    private func bind() {
        viewModel.currentTemperature1
            .sink { completion in
                
            } receiveValue: { currentTemperature in
                self.temperature.text = currentTemperature
                UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut) {
                    self.temperature.alpha = 1
                }
            }
            .store(in: &subscriptions)

        viewModel.currentTemperature
            .sink { completion in
                
            } receiveValue: { currentTemperature in
                self.temperature.text = currentTemperature
            }
            .store(in: &subscriptions)

        
    }
    
}

