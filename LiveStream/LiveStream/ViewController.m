//
//  ViewController.m
//  LiveStream
//
//  Created by Dalton on 9/25/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import "ViewController.h"
#import <OpenEars/OELanguageModelGenerator.h>
#import <OpenEars/OEAcousticModel.h>

#import <OpenEars/OEPocketsphinxController.h>
#import <OpenEars/OEAcousticModel.h>

@interface ViewController ()

@property (nonatomic, strong) NSString *alertWord;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // set up openears speech model
    
    OELanguageModelGenerator *lmGenerator = [[OELanguageModelGenerator alloc] init];
    
    self.alertWord = [NSString stringWithFormat:@"%@", self.alertWordTextField.text];

    NSArray *words = [NSArray arrayWithObjects:self.alertWord, nil];
    NSString *name = @"NameIWantForMyLanguageModelFiles";
    NSError *err = [lmGenerator generateLanguageModelFromArray:words withFilesNamed:name forAcousticModelAtPath:[OEAcousticModel pathToModel:@"AcousticModelEnglish"]]; // Change "AcousticModelEnglish" to "AcousticModelSpanish" to create a Spanish language model instead of an English one.
    
    NSString *lmPath = nil;
    NSString *dicPath = nil;
    
    if(err == nil) {
        
        lmPath = [lmGenerator pathToSuccessfullyGeneratedLanguageModelWithRequestedName:@"NameIWantForMyLanguageModelFiles"];
        dicPath = [lmGenerator pathToSuccessfullyGeneratedDictionaryWithRequestedName:@"NameIWantForMyLanguageModelFiles"];
        
    } else {
        NSLog(@"Error: %@",[err localizedDescription]);
    }
    
    
    // set up speech recognition to start listening with oepocketsphinxcontroller
    
    [[OEPocketsphinxController sharedInstance] setActive:TRUE error:nil];
    [[OEPocketsphinxController sharedInstance] startListeningWithLanguageModelAtPath:lmPath dictionaryAtPath:dicPath acousticModelAtPath:[OEAcousticModel pathToModel:@"AcousticModelEnglish"] languageModelIsJSGF:NO]; // Change "AcousticModelEnglish" to "AcousticModelSpanish" to perform Spanish recognition instead of English.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {

    [textField resignFirstResponder];
    return NO;
}

- (IBAction)okButtonTapped:(id)sender {
    
    self.alertWord = [NSString stringWithFormat:@"%@", self.alertWordTextField.text];
    
    self.fliteController = [[OEFliteController alloc] init];
    self.slt = [[Slt alloc] init];
    [self.fliteController say:self.alertWord withVoice:self.slt];
    
}



@end
