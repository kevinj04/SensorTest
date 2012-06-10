//
//  STMotionMagic.m
//  SensorTest
//
//  Created by Kevin Jenkins on 5/23/12.
//  Copyright (c) 2012 somethingpointless. All rights reserved.
//

#import "STMotionMagic.h"

@interface STMotionMagic ()

@property (nonatomic, assign) double lastTimeStamp;
@property (nonatomic, assign) double cumulativeTime;

@end

@implementation STMotionMagic

@synthesize motionManager = _motionManager;
@synthesize lastTimeStamp = _lastTimeStamp;
@synthesize cumulativeTime = _cumulativeTime;

- (id) init
{

    self = [super init];

    self.lastTimeStamp = 0.0;
    self.cumulativeTime = 0.0;
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

    double measurementTimeStamp = self.motionManager.accelerometerData.timestamp;
    double deltaTime = 0.0;

    if (self.lastTimeStamp != 0.0)
    {
        deltaTime =  measurementTimeStamp - self.lastTimeStamp;
        if (deltaTime == 0.0) return nil;
    } else {
        deltaTime = 0.0;
    }

    self.cumulativeTime += deltaTime;
    self.lastTimeStamp = measurementTimeStamp;

    model.timePoint = self.cumulativeTime;

    return model;
}

- (void) startSensing
{
    self.lastTimeStamp = 0.0;
    self.cumulativeTime = 0.0;
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
