//
//  File.swift
//  Keep iPhone WatchKit Extension
//
//  Created by Yoshiaki Aibara on 2020/11/18.
//

import UIKit
import CoreBluetooth

class Central: NSObject, ObservableObject, CBCentralManagerDelegate {
    @Published var label: Int!
    
    var manager : CBCentralManager!
    
    override init() {
        super.init()
        manager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            central.scanForPeripherals(withServices: [CBUUID(string: "6B5C4A86-CFB7-4031-98EB-09DF5E2543F0")], options:[CBCentralManagerScanOptionAllowDuplicatesKey : true])
        }
    }
    
    func centralManager(_ central: CBCentralManager,
                        didDiscover peripheral: CBPeripheral,
                        advertisementData: [String : Any],
                        rssi RSSI: NSNumber) {
        print(RSSI)
        label = Int(truncating: RSSI)
    }
}
