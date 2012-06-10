//
//  STViewController.m
//  SensorTest
//
//  Created by Kevin Jenkins on 5/23/12.
//  Copyright (c) 2012 somethingpointless. All rights reserved.
//

#import "STViewController.h"
#import "STMotionMagic.h"
#import "STRecordingModel.h"

@interface STViewController ()

@property (strong, retain) STMotionMagic *motionMagic;
@property (strong, retain) STRecordingModel *model;

@property (strong, retain) NSTimer *timer;
@property (nonatomic, assign) BOOL isRecording;

@end

@implementation STViewController

@synthesize xAccelerometerLabel = _xAccelerometerLabel;
@synthesize yAccelerometerLabel = _yAccelerometerLabel;
@synthesize zAccelerometerLabel = _zAccelerometerLabel;

@synthesize xGyroscopeLabel = _xGyroscopeLabel;
@synthesize yGyroscopeLabel = _yGyroscopeLabel;
@synthesize zGyroscopeLabel = _zGyroscopeLabel;

@synthesize xMagnetometerLabel = _xMagnetometerLabel;
@synthesize yMagnetometerLabel = _yMagnetometerLabel;
@synthesize zMagnetometerLabel = _zMagnetometerLabel;

@synthesize timeLabel = _timeLabel;

@synthesize recordButton = _recordButton;
@synthesize sendDataButton = _sendDataButton;

@synthesize motionMagic = _motionMagic;
@synthesize model = _model;

@synthesize timer = _timer;
@synthesize isRecording = _isRecording;

- (void) setupMotionMagic
{
    self.motionMagic = [[STMotionMagic alloc] init];
    // TODO any setup?
}

- (void) setupModel
{
    self.model = [[STRecordingModel alloc] init];
}

- (void)setupViewState
{
    self.isRecording = NO;
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setupViewState];
    [self setupMotionMagic];
    [self setupModel];
}

- (void)viewDidUnload
{

    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void) viewWillAppear:(BOOL)animated {

    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self
                                                selector:@selector(update:) userInfo:nil repeats:YES];

    [super viewWillAppear:animated];
}

- (void) viewWillDisappear:(BOOL)animated {


    [super viewWillDisappear:animated];
    [self.timer invalidate];
    self.timer = nil;
}

- (void) updateViewWithDataPoint:(STDataPointModel *) dataPoint
{
    self.xAccelerometerLabel.text = [NSString stringWithFormat:@"%f", dataPoint.xAccelerometerValue];
    self.yAccelerometerLabel.text = [NSString stringWithFormat:@"%f", dataPoint.yAccelerometerValue];
    self.zAccelerometerLabel.text = [NSString stringWithFormat:@"%f", dataPoint.zAccelerometerValue];

    self.xGyroscopeLabel.text = [NSString stringWithFormat:@"%f", dataPoint.xGyroscopeValue];
    self.yGyroscopeLabel.text = [NSString stringWithFormat:@"%f", dataPoint.yGyroscopeValue];
    self.zGyroscopeLabel.text = [NSString stringWithFormat:@"%f", dataPoint.zGyroscopeValue];

    self.xMagnetometerLabel.text = [NSString stringWithFormat:@"%f", dataPoint.xMagnetometerValue];
    self.yMagnetometerLabel.text = [NSString stringWithFormat:@"%f", dataPoint.yMagnetometerValue];
    self.zMagnetometerLabel.text = [NSString stringWithFormat:@"%f", dataPoint.zMagnetometerValue];

    self.timeLabel.text = [NSString stringWithFormat:@"Time:  %.3f", dataPoint.timePoint];
}

- (void) update:(double) dt
{
    if (self.isRecording)
    {
        STDataPointModel *dataPoint = [self.motionMagic senseDataPoint];
        if (dataPoint)
        {
            [self.model recordDataPoint:dataPoint];
            [self updateViewWithDataPoint:dataPoint];
        }
    }
}

#pragma mark - Event Handlers
- (IBAction)handleRecordButtonPress:(id)sender
{
    if (self.isRecording) {
        [self.recordButton setTitle:[NSString stringWithString:@"Record"] forState:UIControlStateNormal];
        [self.sendDataButton setEnabled:YES];
        [self.motionMagic stopSensing];
        self.isRecording = NO;
    } else {
        // TODO: [self.model reset];
        [self.recordButton setTitle:[NSString stringWithString:@"Stop Recording"] forState:UIControlStateNormal];
        [self.sendDataButton setEnabled:NO];
        self.model = nil;
        [self setupModel]; // new model
        self.isRecording = YES;
        [self.motionMagic startSensing];
    }

}
- (NSString *) createResultsBody
{
    return [NSString stringWithFormat:@"Accelerometer Data: \n \n %@ \n \n \n \n Gyroscope Data: \n \n %@", self.model.stringDataForAccelerometer, self.model.stringDataForGyroscope];
}
- (void) emailData
{
    MFMailComposeViewController *controller = [[MFMailComposeViewController alloc] init];
    controller.mailComposeDelegate = self;

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];

    [controller setSubject:[NSString stringWithFormat:@"SensorTest Data %@", [formatter stringFromDate:[NSDate date]]]];
    [controller setMessageBody:[self createResultsBody] isHTML:NO];
    [self presentModalViewController:controller animated:YES];
}
- (IBAction)handleSendDataButtonPress:(id)sender
{
    if (!self.isRecording && self.motionMagic != nil)
    {
        [self emailData];
    }
}

#pragma mark - MFMailComposeViewControllerDelegate
/* Dismisses the email composition interface when users tap Cancel or Send. Proceeds to update the message field with the result of the operation. */
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissModalViewControllerAnimated:YES];
    switch (result) {
        case MFMailComposeResultSent:
            self.model = nil;
            [self.sendDataButton setEnabled:NO];
            break;

        default:
            break;
    }
}

@end
