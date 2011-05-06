//
//  Simon_s_PDF_SplitterAppDelegate.m
//  Simon's PDF Splitter
//
//  Created by Simon Coles on 06/05/2011.
//  Copyright 2011 Amphora Research Systems. All rights reserved.
//

#import "Simon_s_PDF_SplitterAppDelegate.h"

// To get the PDF Kit stuff
#import <Quartz/Quartz.h>


@implementation Simon_s_PDF_SplitterAppDelegate

@synthesize go;
@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    [self go:nil];
}

- (IBAction)go:(id)sender {
    // Hard code the URL for now
    NSURL *documentURL = [[NSURL alloc] initWithString:@"file:///Users/simonc/Desktop/tosplit.pdf"];
    PDFDocument *inputDocument = [[PDFDocument alloc] initWithURL:documentURL];
    
    // Note if this comes back as Null, it can't find the file
    
    NSLog(@"Got document - %@", inputDocument);

    
    // Get the number of pages
    NSUInteger pageCount = [inputDocument pageCount];
    
    // Desitination document is going to be pageCount/2 pages
    NSUInteger destDocCount = div(pageCount, 2).quot;
    
    // Where we are in the document
    // Start at -1 because the first page is 0
    NSUInteger documentIndex = -1;
    
    // Now run over each page, splitting out every other one - so count over the documents we want to look at
    for (NSUInteger i = 0; i < destDocCount; i++) {
        
        // Create a new PDFDocument to put documents in
        PDFDocument *destDocument = [[PDFDocument alloc] init];
        
        // Get the first page, then the second
        documentIndex++;
        PDFPage *page1 = [[inputDocument pageAtIndex: documentIndex] copy];
        documentIndex++;
        PDFPage *page2 = [[inputDocument pageAtIndex: documentIndex] copy];
        
        // Put the pages into the document
        [destDocument insertPage:page1 atIndex:0];
        [destDocument insertPage:page2 atIndex:1];
        
        NSString *outputFilename = [NSString stringWithFormat:@"/Users/simonc/Desktop/splits/%d.pdf", i];
        NSLog(@"Outputting - %@", outputFilename);
        
        // Save the document
        [destDocument writeToFile: outputFilename];
        
        // Now release everything
        [page1 release];
        [page2 release];
        [destDocument release];
        
        
    }
    
    [inputDocument release];
    
}


@end
