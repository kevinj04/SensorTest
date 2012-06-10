//
//  STRecordingModel.m
//  SensorTest
//
//  Created by Kevin Jenkins on 6/10/12.
//  Copyright (c) 2012 somethingpointless. All rights reserved.
//

#import "STRecordingModel.h"

@interface STRecordingModel ()

@end

@implementation STRecordingModel

@synthesize dataPoints = _dataPoints;

- (id)init
{
    self = [super init];
    if (self) {
        self.dataPoints = [[NSMutableArray alloc] initWithCapacity:2000];
    }
    return self;
}

- (STDataPointModel *) lastDataPoint
{
    return [self.dataPoints lastObject];
}
- (void) recordDataPoint:(STDataPointModel *) newPoint
{
    [self.dataPoints addObject:newPoint];
}

- (NSString *) stringDataForAccelerometer
{
    NSMutableString *string = [NSMutableString string];

    if (self.dataPoints.count <= 0) return string;

    for (STDataPointModel *dataPoint in self.dataPoints)
    {
        [string appendFormat:@"%f %f %f %f\n", dataPoint.timePoint, dataPoint.xAccelerometerValue, dataPoint.yAccelerometerValue, dataPoint.zAccelerometerValue];
    }
    return string;
}
- (NSString *) stringDataForGyroscope
{
    NSMutableString *string = [NSMutableString string];

    if (self.dataPoints.count <= 0) return string;

    for (STDataPointModel *dataPoint in self.dataPoints)
    {
        [string appendFormat:@"%f %f %f %f\n", dataPoint.timePoint, dataPoint.xGyroscopeValue,
         dataPoint.yGyroscopeValue, dataPoint.zGyroscopeValue];
    }
    return string;
}
- (NSString *) stringDataForMagnetometer
{
    NSMutableString *string = [NSMutableString string];

    if (self.dataPoints.count <= 0) return string;

    for (STDataPointModel *dataPoint in self.dataPoints)
    {
        [string appendFormat:@"%f %f %f %f\n", dataPoint.timePoint, dataPoint.xAccelerometerValue, dataPoint.yAccelerometerValue, dataPoint.zAccelerometerValue];
    }
    return string;
}
@end
