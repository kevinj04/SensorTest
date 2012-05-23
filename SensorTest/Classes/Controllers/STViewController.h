//
//  STViewController.h
//  SensorTest
//
//  Created by Kevin Jenkins on 5/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STViewController : UIViewController

@property (strong, retain) IBOutlet UILabel *xAccelerometerLabel;
@property (strong, retain) IBOutlet UILabel *yAccelerometerLabel;
@property (strong, retain) IBOutlet UILabel *zAccelerometerLabel;

@property (strong, retain) IBOutlet UILabel *xGyroscopeLabel;
@property (strong, retain) IBOutlet UILabel *yGyroscopeLabel;
@property (strong, retain) IBOutlet UILabel *zGyroscopeLabel;

@property (strong, retain) IBOutlet UILabel *xMagnetometerLabel;
@property (strong, retain) IBOutlet UILabel *yMagnetometerLabel;
@property (strong, retain) IBOutlet UILabel *zMagnetometerLabel;

@end
