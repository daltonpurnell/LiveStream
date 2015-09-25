//
//  ViewController.h
//  LiveStream
//
//  Created by Dalton on 9/25/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <OpenEars/OEEventsObserver.h>
#import <Slt/Slt.h>
#import <OpenEars/OEFliteController.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *alertWordTextField;

@property (strong, nonatomic) OEFliteController *fliteController;

// this is a flite voice
@property (strong, nonatomic) Slt *slt;

@end

