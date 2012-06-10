//
//  STMotionMagic.h
//  SensorTest
//
//  Created by Kevin Jenkins on 5/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>
#import "STModel.h"

@interface STMotionMagic : NSObject

@property (strong, retain) CMMotionManager *motionManager;

- (void) updateModel:(STModel *) model;

- (void) startSensing;
- (void) stopSensing;

@end