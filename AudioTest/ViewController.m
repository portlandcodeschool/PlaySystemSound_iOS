//
//  ViewController.m
//  AudioTest
//
//  Created by Erick Bennett on 3/5/15.
//  Copyright (c) 2015 Erick Bennett. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
        
    NSError *setCategoryError = nil;
    
    
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryAmbient error:&setCategoryError];
    
    if (setCategoryError) {
        NSLog(@"Error setting category! %ld", (long)[setCategoryError code]);
    }
    
    
    NSString *pianoSoundPath = [[NSBundle mainBundle] pathForResource:@"Piano" ofType:@"wav"];
    NSURL *pianoSoundURL = [NSURL fileURLWithPath:pianoSoundPath];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)pianoSoundURL, &_pianoSound);
}
- (IBAction)playSound:(id)sender {
    AudioServicesPlaySystemSound(self.pianoSound);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
