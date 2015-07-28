//
//  ViewController.m
//  ControlsHomework
//
//  Created by kateryna.zaikina on 26.07.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import "ViewController.h"

typedef enum {
    
    KZImageSegmentsAlien,
    KZImageSegmentsSpaceship,
    KZImageSegmentsAngryAlien,


} KZImageSegments;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self actionChoosePic:KZImageSegmentsAlien];
    self.valueSlider.value = 0.5;
    self.rotationSwitch.on = NO;
    self.scaleSwitch.on = NO;
    self.transitionSwitch.on = NO;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Methods





#pragma mark - Actions


- (IBAction)actionChangeValue:(id)sender {
    
    if (self.scaleSwitch.isOn) {
        
        CGAffineTransform newTransform = CGAffineTransformMakeScale(self.valueSlider.value,
                                                                    self.valueSlider.value);
        self.alienView.transform = newTransform;
    }
    
}

- (IBAction)actionMakeRotation:(id)sender {
    
    
    
    if (self.rotationSwitch.isOn) {
        
        [UIView animateWithDuration:5
                              delay:0
                            options:UIViewAnimationCurveEaseInOut
                         animations:^{
                             
                             self.alienView.transform = CGAffineTransformRotate(self.alienView.transform, M_PI);
                             self.alienView.transform = CGAffineTransformRotate(self.alienView.transform, M_PI);
                             
                         }
                         completion:^(BOOL finished) {
                             
                             [self actionMakeRotation:sender];
                             
                         }];

        
    } else {
        
        [self.alienView.layer removeAllAnimations];
       
    
    }

    
}

- (IBAction)actionMove:(id)sender {
    
    if (self.transitionSwitch.isOn) {
        
        int coordinateX = arc4random()%300;
        int coordinateY = arc4random()%300;

        [UIView animateWithDuration:5
                              delay:0
                            options: UIViewAnimationCurveLinear | UIViewAnimationOptionAllowUserInteraction
                         animations:^{
                             
                             self.alienView.center = CGPointMake(coordinateX, coordinateY);

                         }
                         completion:^(BOOL finished) {
                            
                            [self actionMove:sender];
                         }];
    } else {
        
        [self.alienView.layer removeAllAnimations];
        self.alienView.transform = CGAffineTransformIdentity;
        
        [UIView animateWithDuration:5 animations:^{
            self.alienView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds) - 150 );
        }];
        
    
    }
    
}

- (IBAction)actionChoosePic:(UISegmentedControl *)sender {
    
    switch (sender.selectedSegmentIndex) {
        case KZImageSegmentsAlien:
            self.alienView.image = [UIImage imageNamed:@"alien.gif"];
            break;
            
        case KZImageSegmentsSpaceship:
            
            
            self.alienView.image = [UIImage imageNamed:@"alien2.jpg"];
            NSLog(@"%@", NSStringFromCGRect(self.alienView.frame));

            
            
            break;
            
        case KZImageSegmentsAngryAlien:
            self.alienView.image = [UIImage imageNamed:@"alien3.jpg"];
            self.alienView.frame = CGRectMake(111, 89, 140, 155);
            break;
            
        default:
            break;
    }
}

@end
