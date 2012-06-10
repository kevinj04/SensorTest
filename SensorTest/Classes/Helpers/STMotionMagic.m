//
//  STMotionMagic.m
//  SensorTest
//
//  Created by Kevin Jenkins on 5/23/12.
//  Copyright (c) 2012 somethingpointless. All rights reserved.
//

#import "STMotionMagic.h"

@implementation STMotionMagic

@synthesize motionManager = _motionManager;

- (id) init
{

    self = [super init];

    [self setupMotionManager];

    return self;

}

- (void) setupMotionManager
{
    self.motionManager = [[CMMotionManager alloc] init];
}

- (STDataPointModel *) senseDataPoint
{
    STDataPointModel *model = [STDataPointModel new];

    model.xAccelerometerValue = self.motionManager.accelerometerData.acceleration.x;
    model.yAccelerometerValue = self.motionManager.accelerometerData.acceleration.y;
    model.zAccelerometerValue = self.motionManager.accelerometerData.acceleration.z;

    model.xGyroscopeValue = self.motionManager.gyroData.rotationRate.x;
    model.yGyroscopeValue = self.motionManager.gyroData.rotationRate.y;
    model.zGyroscopeValue = self.motionManager.gyroData.rotationRate.z;

    model.xMagnetometerValue = self.motionManager.magnetometerData.magneticField.x;
    model.yMagnetometerValue = self.motionManager.magnetometerData.magneticField.y;
    model.zMagnetometerValue = self.motionManager.magnetometerData.magneticField.z;

    // should have time stamp for each, poll once too, not sequential access.
    model.timePoint = self.motionManager.accelerometerData.timestamp;

    return model;
}

- (void) startSensing
{
    [self.motionManager startAccelerometerUpdates];
    [self.motionManager startGyroUpdates];
    [self.motionManager startMagnetometerUpdates];
}

- (void) stopSensing
{
    [self.motionManager stopAccelerometerUpdates];
    [self.motionManager stopGyroUpdates];
    [self.motionManager stopMagnetometerUpdates];
}

@end
