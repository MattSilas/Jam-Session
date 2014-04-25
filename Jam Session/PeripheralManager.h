//
//  PeripheralManager.h
//  Jam Session
//
//  Created by Matthew Silas on 4/25/14.
//  Copyright (c) 2014 Random Glove Development. All rights reserved.
//

#import <CoreBluetooth/CoreBluetooth.h>

@interface PeripheralManager : NSObject <CBPeripheralManagerDelegate>

-(void) startBroadcast;

@end
