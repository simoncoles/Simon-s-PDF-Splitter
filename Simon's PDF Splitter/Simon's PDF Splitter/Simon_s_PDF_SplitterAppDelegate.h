//
//  Simon_s_PDF_SplitterAppDelegate.h
//  Simon's PDF Splitter
//
//  Created by Simon Coles on 06/05/2011.
//  Copyright 2011 Amphora Research Systems. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Simon_s_PDF_SplitterAppDelegate : NSObject <NSApplicationDelegate> {
@private
    NSWindow *window;
    NSButtonCell *go;
}
@property (assign) IBOutlet NSButtonCell *go;

@property (assign) IBOutlet NSWindow *window;

@end
