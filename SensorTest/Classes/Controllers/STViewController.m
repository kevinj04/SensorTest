//
//  STViewController.m
//  SensorTest
//
//  Created by Kevin Jenkins on 5/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "STViewController.h"

@interface STViewController ()

@end

@implementation STViewController

@synthesize xAccelerometerLabel = _xAccelerometerLabel;
@synthesize yAccelerometerLabel = _yAccelerometerLabel;
@synthesize zAccelerometerLabel = _zAccelerometerLabel;

@synthesize xGyroscopeLabel = _xGyroscopeLabel;
@synthesize yGyroscopeLabel = _yGyroscopeLabel;
@synthesize zGyroscopeLabel = _zGyroscopeLabel;

@synthesize xMagnetometerLabel = _xMagnetometerLabel;
@synthesize yMagnetometerLabel = _yMagnetometerLabel;
@synthesize zMagnetometerLabel = _zMagnetometerLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
