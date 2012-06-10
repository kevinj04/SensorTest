//
//  STMotionMagic.h
//  SensorTest
//
//  Created by Kevin Jenkins on 5/23/12.
//  Copyright (c) 2012 somethingpointless. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>
#import "STDataPointModel.h"

@interface STMotionMagic : NSObject

@property (strong, retain) CMMotionManager *motionManager;

- (STDataPointModel *) senseDataPoint;

- (void) startSensing;
- (void) stopSensing;

@end
