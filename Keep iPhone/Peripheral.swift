//
//  Peripheral.swift
//  Keep iPhone
//
//  Created by Yoshiaki Aibara on 2020/11/18.
//

import UIKit
import CoreBluetooth

class Peripheral: NSObject, ObservableObject, CBPeripheralManagerDelegate {
    var peripheralManager: CBPeripheralManager!
    
    override init() {
        super.init()
        peripheralManager = CBPeripheralManager(delegate: self, queue: nil)
    }
    
    
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        if peripheral.state == .poweredOn {print("[BLE]  poweredOn")}
    }
    
    func startAdvertise(){
        print("[BLE] start Advertise")
        let service =  CBMutableService(type: CBUUID(string: "6B5C4A86-CFB7-4031-98EB-09DF5E2543F0"), primary: true)
        peripheralManager.add(service)
    }
    
    func stopAdvertise() {
        print("[BLE] stop Advertise")
        peripheralManager.stopAdvertising()
    }

    
    func peripheralManager(_ peripheral: CBPeripheralManager,
                           didAdd service: CBService,
                           error: Error?){
        
//        self.service = service as? CBMutableService
        
        let advertisementData = [CBAdvertisementDataServiceUUIDsKey: [service.uuid], CBAdvertisementDataLocalNameKey: "sample"] as [String : Any]
        peripheralManager.startAdvertising(advertisementData)
    }
    
    func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager, error: Error?) {
        print("[BLE] peripheralManagerDidStartAdvertising error=\(String(describing: error))")
    }
    
}

