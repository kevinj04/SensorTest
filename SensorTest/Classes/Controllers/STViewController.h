//
//  STViewController.h
//  SensorTest
//
//  Created by Kevin Jenkins on 5/23/12.
//  Copyright (c) 2012 somethingpointless. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface STViewController : UIViewController<MFMailComposeViewControllerDelegate>

@property (strong, retain) IBOutlet UILabel *xAccelerometerLabel;
@property (strong, retain) IBOutlet UILabel *yAccelerometerLabel;
@property (strong, retain) IBOutlet UILabel *zAccelerometerLabel;

@property (strong, retain) IBOutlet UILabel *xGyroscopeLabel;
@property (strong, retain) IBOutlet UILabel *yGyroscopeLabel;
@property (strong, retain) IBOutlet UILabel *zGyroscopeLabel;

@property (strong, retain) IBOutlet UILabel *xMagnetometerLabel;
@property (strong, retain) IBOutlet UILabel *yMagnetometerLabel;
@property (strong, retain) IBOutlet UILabel *zMagnetometerLabel;

@property (strong, retain) IBOutlet UIButton *recordButton;
@property (strong, retain) IBOutlet UIButton *sendDataButton;

- (IBAction)handleRecordButtonPress:(id)sender;
- (IBAction)handleSendDataButtonPress:(id)sender;

@end
