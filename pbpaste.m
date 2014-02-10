#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>

int pbpaste() {
    NSString *pasteboardString = [[UIPasteboard generalPasteboard] string];
    printf("%s", [pasteboardString UTF8String]);
    
    return !pasteboardString;
}

int main(int argc, char **argv, char **envp) {
    @autoreleasepool {
        if (argc > 1) {
            printf("Usage: %s [-help]\n%s takes the string from the clipboard and writes it to the standdard output.\n", argv[0], argv[0]);
            return 0;
        } else {
            return pbpaste();
        }
    }
}
