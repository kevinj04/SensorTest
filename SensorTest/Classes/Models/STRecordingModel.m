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

@end
