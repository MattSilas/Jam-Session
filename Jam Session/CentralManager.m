//
//  CentralManager.m
//  Jam Session
//
//  Created by Matthew Silas on 4/25/14.
//  Copyright (c) 2014 Random Glove Development. All rights reserved.
//

#import "CentralManager.h"

@interface CentralManager ()
{
    CBService *receivedService;
    CBDescriptor *receivedDesriptor;
    CBCentralManager *centralManager;
}

@end

@implementation CentralManager

-(CentralManager *) init
{
    centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    CentralManager *myCentralManager = [[CentralManager alloc] init];
    return myCentralManager;
}

-(void) startScan
{
    //TO-DO create an array of CBUUIDs that match what the peripheral advertises
    [centralManager scanForPeripheralsWithServices:nil options:nil];
}



#pragma CBCentralManager delegate methods

-(void) centralManagerDidUpdateState:(CBCentralManager *)central
{
    if (central.state != CBCentralManagerStatePoweredOn)
    {
        return;
    }
}

-(void) centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI
{
    [centralManager stopScan];
    [centralManager connectPeripheral:peripheral options:nil];
}

- (void) centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral
{
    peripheral.delegate = self;
    //TO-DO create NSArray of services matching the broadcasting peripheral
    [peripheral discoverServices:nil];
    
}

#pragma Peripheral delegate methods

-(void) peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error
{
    
}

@end
