//
//  singleViewController2.h
//  AFAppBoosterSDK
//
//  Created by Nick Jouannem on 10/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface singleViewController : UIViewController {
    IBOutlet UIButton *forceOpenNotification;
    IBOutlet UIButton *forceOpenFeedback;
    
}

- (IBAction)forceOpenNotificationWindow;
- (IBAction)forceOpenFeedbackWindow;

@end