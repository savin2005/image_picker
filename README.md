# image_picker 
# Offline Image Upload with In-Memory Storage

यह Flutter ऐप offline image को RAM में स्टोर करता है और internet आने पर auto-upload करता है।

## Getting Started 

1. इस प्रोजेक्ट को clone या download करें।
2. VS Code या Android Studio में खोलें।
3. Command चलाएं:
flutter pub get
flutter run 
## Used Packages
- image_picker
- provider
- connectivity_plus
- http
## Features
- Gallery से image चुनना
- Internet न होने पर RAM में temporarily स्टोर करना
- Internet आने पर automatic upload
- Upload status दिखाना (Pending, Uploading…, Success, Failed)
- Retry का option
## Limitations
- अभी सिर्फ एक image support करता है
- Local notification feature add नहीं किया गया है 

## Future Scope
- Multiple images queue में भेज सकते हैं
- Success पर local notification भेज सकते हैं
