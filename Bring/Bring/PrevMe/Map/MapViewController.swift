//
//  MapViewController.swift
//  Bring
//
//  Created by 오예진 on 2022/11/16.
//

import UIKit
import MapKit
import CoreLocation

protocol PlaceCellDelegate: AnyObject {
    func insertPlace(_ text: String)
    func insertPlaceNickname(_ text: String)
}


class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    public weak var delegate: PlaceCellDelegate?

    var record: Record?
    
    @IBOutlet var mapView: MKMapView!
    @IBOutlet weak var miniModal: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let dobongLoc = CLLocationCoordinate2D(latitude: 37.6658609, longitude: 127.0317674) // 도봉구
    let eunpyeongLoc = CLLocationCoordinate2D(latitude: 37.6176125, longitude: 126.9227004) // 은평구
    let dongdaemoonLoc = CLLocationCoordinate2D(latitude: 37.5838012, longitude: 127.0507003) // 동대문구
    
    
    var locationManager: CLLocationManager = CLLocationManager() // location manager
    var currentLocation: CLLocation! // 내 위치 저장
    var currentLoc = CLLocationCoordinate2D(latitude: 37.572773983635, longitude: 126.9880430158)   // 낙원상가 -> 시뮬레이터 오류로 일단 현재 위치를 코드로 받아옴
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        self.mapView.showsUserLocation = true
        self.mapView.setUserTrackingMode(.follow, animated: true)
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.startMonitoringSignificantLocationChanges()
       
        setMapView(coordinate: currentLoc, addr: findAddr(lat: currentLoc.latitude, long: currentLoc.longitude))
        
        UICustom()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager = manager
        self.currentLocation = locationManager.location
        currentLoc = CLLocationCoordinate2D(latitude: self.currentLocation!.coordinate.latitude, longitude: self.currentLocation!.coordinate.longitude)
    }
    
    
    @IBAction func backTapped(_ sender: Any) {
        // 모달창 내리기
        self.dismiss(animated: true, completion: nil)
    }
    
    func UICustom() {
        searchBar.searchTextField.backgroundColor = UIColor.white
        searchBar.searchTextField.font = UIFont.systemFont(ofSize: 11)
        
        miniModal.layer.shadowOffset = CGSize(width: 10, height: 10)
        miniModal.layer.shadowOpacity = 0.2
        miniModal.layer.borderColor = UIColor(named: "boxLightGray")?.cgColor
        miniModal.layer.cornerRadius = 10
    }

    
    func firstSetting() {
        self.currentLocation = locationManager.location
    }
    
    // MARK : 위도, 경도에 따른 주소 찾기
    func findAddr(lat: CLLocationDegrees, long: CLLocationDegrees) -> String{
        let findLocation = CLLocation(latitude: lat, longitude: long)
        let geocoder = CLGeocoder()
        let locale = Locale(identifier: "Ko-kr")
        var myAdd: String = ""
        
        geocoder.reverseGeocodeLocation(findLocation, preferredLocale: locale, completionHandler: {(placemarks, error) in
            if let address: [CLPlacemark] = placemarks {
                
                if let area: String = address.last?.locality{
                    myAdd += area
                }
                if let name: String = address.last?.name {
                    myAdd += " "
                    myAdd += name
                }
            }
        })
        return myAdd
    }
    
    // MARK : 검색한 위치로 이동 & marker 추가
    func setMapView(coordinate: CLLocationCoordinate2D, addr: String){
        let region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta:0.01, longitudeDelta:0.01))
        self.mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = addr
        self.mapView.addAnnotation(annotation)
        
        self.findAddr(lat: coordinate.latitude, long: coordinate.longitude)
    }
}

extension MapViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        switch searchBar.text {
        case "도봉구":
            setMapView(coordinate: dobongLoc, addr: "도봉구")
        case "동대문구":
            setMapView(coordinate: dongdaemoonLoc, addr: "동대문구")
        case "도봉구":
            setMapView(coordinate: dobongLoc, addr: "도봉구")
        default:
            setMapView(coordinate: currentLoc, addr: "현재위치")
        }
        var searchPlace = searchBar.text!
        self.delegate?.insertPlace(searchPlace)
        print("****", searchPlace)
    }
}
