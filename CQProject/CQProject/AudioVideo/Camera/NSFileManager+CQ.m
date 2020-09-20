//
//  NSFileManager+CQ.m
//  CQProject
//
//  Created by CharType on 2020/9/20.
//  Copyright © 2020 CharType. All rights reserved.
//

#import "NSFileManager+CQ.h"

@implementation NSFileManager (CQ)
- (NSString *)temporaryDirectoryWithTemplateString:(NSString *)templateString {
    NSString *mkdTemplate =
        [NSTemporaryDirectory() stringByAppendingPathComponent:templateString];
    const char *templateCString = [mkdTemplate fileSystemRepresentation];
    char *buffer = (char *)malloc(strlen(templateCString) + 1);
    strcpy(buffer, templateCString);
    NSString *directoryPath = nil;
    char *result = mkdtemp(buffer);
    if (result) {
        directoryPath = [self stringWithFileSystemRepresentation:buffer                        length:strlen(result)];
    }
    free(buffer);
    return directoryPath;
}
@end
