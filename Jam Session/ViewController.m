//
//  ViewController.m
//  Jam Session
//
//  Created by Matthew Silas on 4/19/14.
//  Copyright (c) 2014 Random Glove Development. All rights reserved.
//

#import "ViewController.h"
#import "CentralManager.h"
#import "PeripheralManager.h"

@interface ViewController ()
{
    __strong IBOutlet UISegmentedControl *broadcastReceiveControl;
}
@end


@implementation ViewController 


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    CGRect frame = broadcastReceiveControl.frame;
    //TO-DO customize the UISegmentedControl
    [broadcastReceiveControl setFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 800) ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (IBAction)broadcastReceiveControlValueDidChange:(id)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl*) sender;
    bool receiveMode = segmentedControl.selectedSegmentIndex;
    if(receiveMode)
    {
        CentralManager *central = [CentralManager init];
        [central startScan];
    }
    else
    {
        PeripheralManager *peripheralManager = [PeripheralManager init];
        [peripheralManager startBroadcast];
    }
}



@end
