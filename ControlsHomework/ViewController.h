//
//  ViewController.h
//  ControlsHomework
//
//  Created by kateryna.zaikina on 26.07.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController



@property (weak, nonatomic) IBOutlet UIImageView *alienView;

@property (weak, nonatomic) IBOutlet UILabel *rotationLabel;
@property (weak, nonatomic) IBOutlet UILabel *scaleLabel;
@property (weak, nonatomic) IBOutlet UILabel *transitionLabel;
@property (weak, nonatomic) IBOutlet UISlider *valueSlider;
@property (weak, nonatomic) IBOutlet UISwitch *rotationSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *scaleSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *transitionSwitch;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentPics;


- (IBAction)actionChangeValue:(id)sender;
- (IBAction)actionMakeRotation:(id)sender;
- (IBAction)actionMove:(id)sender;
- (IBAction)actionChoosePic:(UISegmentedControl *)sender;


@end

