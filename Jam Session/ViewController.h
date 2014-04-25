//
//  ViewController.h
//  Jam Session
//
//  Created by Matthew Silas on 4/19/14.
//  Copyright (c) 2014 Random Glove Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>


@interface ViewController : UIViewController <CBPeripheralManagerDelegate, CBPeripheralDelegate,CBCentralManagerDelegate>


@end
