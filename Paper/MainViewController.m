//
//  MainViewController.m
//  Paper
//
//  Created by Matt Mitchell on 6/18/14.
//  Copyright (c) 2014 Matt Mitchell. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UIView *headlineView;
@property (weak, nonatomic) IBOutlet UIView *newsView;
@property (assign,nonatomic) CGPoint offset;

- (IBAction)onHeadlinePan:(UIPanGestureRecognizer *)sender;
- (IBAction)onNewsPan:(UIPanGestureRecognizer *)sender;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onHeadlinePan:(UIPanGestureRecognizer *)sender {
    CGPoint touchPosition = [sender locationInView:self.view];
    
    if (sender.state == UIGestureRecognizerStateBegan ) {
        
        self.offset = CGPointMake(touchPosition.x - self.headlineView.center.x, touchPosition.y - self.headlineView.center.y);
        
        
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        NSLog(@"Pan moved %f %f", touchPosition.x + self.offset.x , touchPosition.y + self.offset.y);
        
        if (self.headlineView.center.y < 284) {
            self.headlineView.center = CGPointMake(160, 284);
        }
        else {
            
            [UIView animateWithDuration:0.5
                    delay:0
                    options:UIViewAnimationOptionCurveEaseInOut
                    animations:^{
                        self.headlineView.center = CGPointMake(160, touchPosition.y - self.offset.y);
                    }
                    completion:^(BOOL finished) {
            }];
            
            
            
        }
    
    }
    
}

- (IBAction)onNewsPan:(UIPanGestureRecognizer *)sender {
    CGPoint touchPosition = [sender locationInView:self.view];
    
    if (sender.state == UIGestureRecognizerStateBegan ) {
        
        self.offset = CGPointMake(touchPosition.x - self.newsView.center.x, touchPosition.y - self.newsView.center.y);
        
        
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        NSLog(@"Pan moved %f %f", touchPosition.x + self.offset.x , touchPosition.y + self.offset.y);
        
        if (self.newsView.center.x < 0) {
            self.newsView.center = CGPointMake(742, 442);
        }
        else {
            
            [UIView animateWithDuration:0.5
                                  delay:0
                                options:UIViewAnimationOptionCurveEaseInOut
                             animations:^{
                                 self.newsView.center = CGPointMake(touchPosition.x - self.offset.x, 442);
                             }
                             completion:^(BOOL finished) {
                             }];
            
        }
        
    }
    
}
@end
