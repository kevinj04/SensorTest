//
//  STRecordingModel.h
//  SensorTest
//
//  Created by Kevin Jenkins on 6/10/12.
//  Copyright (c) 2012 somethingpointless. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STDataPointModel.h"

@interface STRecordingModel : NSObject

@property (nonatomic, strong) NSMutableArray *dataPoints;

- (STDataPointModel *) lastDataPoint;
- (void) recordDataPoint:(STDataPointModel *) newPoint;

- (NSString *) stringDataForAccelerometer;
- (NSString *) stringDataForGyroscope;
- (NSString *) stringDataForMagnetometer;

@end
