//
//  STViewController.m
//  SensorTest
//
//  Created by Kevin Jenkins on 5/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "STViewController.h"

@interface STViewController ()

@property (strong, retain) NSTimer *timer;

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

@synthesize motionMagic = _motionMagic;
@synthesize model = _model;

@synthesize timer = _timer;

- (void) setupMotionMagic
{
    self.motionMagic = [[STMotionMagic alloc] init];
    // TODO any setup?
}

- (void) setupModel
{
    self.model = [[STModel alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [self setupMotionMagic];
    [self setupModel];
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

- (void) viewWillAppear:(BOOL)animated {

    [self.motionMagic startSensing];

    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self
                                                selector:@selector(update:) userInfo:nil repeats:YES];

    [super viewWillAppear:animated];
}

- (void) viewWillDisappear:(BOOL)animated {

    [self.motionMagic stopSensing];
    [super viewWillDisappear:animated];
    [self.timer invalidate];
    self.timer = nil;
}

- (void) update:(double) dt
{
    [self.motionMagic updateModel:self.model];

    self.xAccelerometerLabel.text = [NSString stringWithFormat:@"%f", self.model.xAccelerometerValue];
    self.yAccelerometerLabel.text = [NSString stringWithFormat:@"%f", self.model.yAccelerometerValue];
    self.zAccelerometerLabel.text = [NSString stringWithFormat:@"%f", self.model.zAccelerometerValue];

    self.xGyroscopeLabel.text = [NSString stringWithFormat:@"%f", self.model.xGyroscopeValue];
    self.yGyroscopeLabel.text = [NSString stringWithFormat:@"%f", self.model.yGyroscopeValue];
    self.zGyroscopeLabel.text = [NSString stringWithFormat:@"%f", self.model.zGyroscopeValue];

    self.xMagnetometerLabel.text = [NSString stringWithFormat:@"%f", self.model.xMagnetometerValue];
    self.yMagnetometerLabel.text = [NSString stringWithFormat:@"%f", self.model.yMagnetometerValue];
    self.zMagnetometerLabel.text = [NSString stringWithFormat:@"%f", self.model.zMagnetometerValue];
}

@end
