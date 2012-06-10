//
//  STDataPointModel.h
//  SensorTest
//
//  Created by Kevin Jenkins on 5/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STDataPointModel : NSObject

@property (nonatomic, assign) double xAccelerometerValue;
@property (nonatomic, assign) double yAccelerometerValue;
@property (nonatomic, assign) double zAccelerometerValue;

@property (nonatomic, assign) double xGyroscopeValue;
@property (nonatomic, assign) double yGyroscopeValue;
@property (nonatomic, assign) double zGyroscopeValue;

@property (nonatomic, assign) double xMagnetometerValue;
@property (nonatomic, assign) double yMagnetometerValue;
@property (nonatomic, assign) double zMagnetometerValue;

@property (nonatomic, assign) double timePoint;

@end
