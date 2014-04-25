//
//  ViewController.m
//  Jam Session
//
//  Created by Matthew Silas on 4/19/14.
//  Copyright (c) 2014 Random Glove Development. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CBMutableService *broadcastService;
    CBMutableDescriptor *broadcastDescriptor;
    
    CBService *receivedService;
    CBDescriptor *receivedDesriptor;
    
    NSMutableData *data;
    CBPeripheralManager *peripheralManager;
    CBCentralManager *centralManager;
    __strong IBOutlet UISegmentedControl *broadcastReceiveControl;
}
@end


@implementation ViewController 


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    CGRect frame = broadcastReceiveControl.frame;
    [broadcastReceiveControl setFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 800) ];
    
    centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil];
    
    data = [[NSMutableData alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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

-(void) peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error
{
    
}

-(void) setupService
{
    
}

-(void) startScan
{
    //TO-DO create an array of CBUUIDs that match what the peripheral advertises
    [centralManager scanForPeripheralsWithServices:nil options:nil];
}

-(void) startBroadcast
{
    
}

- (IBAction)broadcastReceiveControlValueDidChange:(id)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl*) sender;
    bool receiveMode = segmentedControl.selectedSegmentIndex;
    if(receiveMode)
    {
        [self startScan];
    }
    else
    {
        
    }
}



@end
