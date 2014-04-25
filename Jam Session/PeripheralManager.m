//
//  PeripheralManager.m
//  Jam Session
//
//  Created by Matthew Silas on 4/25/14.
//  Copyright (c) 2014 Random Glove Development. All rights reserved.
//

#import "PeripheralManager.h"

@interface PeripheralManager ()
{
    CBMutableService *broadcastService;
    CBMutableDescriptor *broadcastDescriptor;
    
    
    NSMutableData *data;
    CBPeripheralManager *peripheralManager;
}

@end

@implementation PeripheralManager

-(PeripheralManager *) init
{
    peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil];
    data = [[NSMutableData alloc] init];
    PeripheralManager *myPeripheralManager = [[PeripheralManager alloc] init];
    return myPeripheralManager;
}

-(void) setupService
{
    
}



#pragma delegate methods

-(void) peripheralManagerDidUpdateState:(CBPeripheralManager *) peripheral
{
    switch (peripheral.state) {
        case CBPeripheralManagerStatePoweredOn:
            [self setupService];
            break;
            
        default:
            break;
    }
}

@end
