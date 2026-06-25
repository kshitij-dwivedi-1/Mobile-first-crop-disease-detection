# Mobile Crop Disease Detection

Mobile Crop Disease Detection is a Flutter mobile application that identifies crop leaf diseases from photos using an on-device TensorFlow Lite model. The app lets users capture or select a leaf image, runs AI inference locally, and shows the predicted crop condition with a confidence score and care recommendations.

## Features

- Detects crop diseases from leaf images
- Supports camera capture and gallery image selection
- Runs inference offline using `model.tflite`
- Shows prediction confidence as a percentage
- Provides disease descriptions, symptoms, treatment tips, and prevention advice
- Includes healthy/diseased result states with crop-specific guidance
- Mobile-first Flutter UI under the app name `CropScan`

## Supported Crops

The app supports 14 crop categories:

- Apple
- Blueberry
- Cherry
- Corn
- Grape
- Orange
- Peach
- Pepper
- Potato
- Raspberry
- Soybean
- Squash
- Strawberry
- Tomato

## Tech Stack

- Flutter
- Dart
- TensorFlow Lite
- `tflite_flutter`
- `image_picker`
- `image`
- `flutter_animate`
- `percent_indicator`

## Project Structure

```text
Mobile_Crop_Disease_Detection/
+-- cropapp/                    # Flutter mobile app
|   +-- assets/
|   |   +-- model.tflite        # TFLite disease detection model
|   |   +-- labels.txt          # Class labels
|   +-- lib/
|   |   +-- main.dart           # App entry point
|   |   +-- screens/            # Home and result screens
|   |   +-- services/           # Image classifier service
|   |   +-- data/               # Disease advice data
|   +-- pubspec.yaml
+-- best_model.h5               # Trained Keras model
+-- model.tflite                # Exported TFLite model
+-- labels.txt                  # Model labels
+-- kaggle model train.ipynb    # Model training notebook
+-- test_model.py               # Model testing script
```

## Getting Started

### Prerequisites

- Flutter SDK installed
- Android Studio or VS Code with Flutter support
- Android emulator or physical mobile device

### Run the App

1. Open a terminal in the Flutter app folder:

   ```bash
   cd cropapp
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Connect a device or start an emulator.

4. Run the app:

   ```bash
   flutter run
   ```

## Model Assets

The app expects these files inside `cropapp/assets/`:

- `model.tflite`
- `labels.txt`

These assets are already declared in `cropapp/pubspec.yaml`. If the model fails to load, confirm both files exist in the assets folder and then run `flutter pub get` again.

## How It Works

1. The user takes a photo or selects a leaf image from the gallery.
2. The app resizes the image to `224x224`.
3. Pixel values are normalized and passed to the TensorFlow Lite model.
4. The highest scoring label is selected as the prediction.
5. The result screen displays the disease name, confidence score, and care advice.

## Disclaimer

This application provides AI-based crop disease estimates and should be used as a support tool only. Always confirm important treatment decisions with an agricultural expert or certified agronomist.
