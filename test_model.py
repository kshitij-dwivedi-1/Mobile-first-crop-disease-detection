import numpy as np
import tensorflow as tf
from PIL import Image

# --- Configuration ---
MODEL_PATH = "model.tflite"
LABELS_PATH = "labels.txt"
IMAGE_PATH = "test_leaf.jpg" # Change this to your actual test image name
IMAGE_SIZE = 224 # We established earlier your model uses 224x224

def load_labels(filename):
    with open(filename, 'r') as f:
        return [line.strip() for line in f.readlines()]

def main():
    print("Loading model and labels...")
    labels = load_labels(LABELS_PATH)
    
    # Load the TFLite model and allocate tensors
    interpreter = tf.lite.Interpreter(model_path=MODEL_PATH)
    interpreter.allocate_tensors()

    # Get input and output details
    input_details = interpreter.get_input_details()
    output_details = interpreter.get_output_details()

    print("Processing image...")
    # Load the image and resize it to 224x224
    img = Image.open(IMAGE_PATH).convert('RGB')
    img = img.resize((IMAGE_SIZE, IMAGE_SIZE))

    # Convert image to numpy array and add a batch dimension: shape [1, 224, 224, 3]
    input_data = np.expand_dims(img, axis=0)

    # Normalize the pixel values to 0.0 - 1.0 (Standard for FLOAT32 models)
    input_data = input_data.astype(np.float32) / 255.0

    print("Running inference...")
    # Feed the image to the model
    interpreter.set_tensor(input_details[0]['index'], input_data)
    interpreter.invoke()

    # Extract the output probabilities
    output_data = interpreter.get_tensor(output_details[0]['index'])[0]

    # Get the top 3 predictions
    # argsort() sorts ascending, so we take the last 3 and reverse them ([::-1])
    top_3_indices = output_data.argsort()[-3:][::-1]

    print("\n--- TOP 3 PREDICTIONS ---")
    for i in top_3_indices:
        confidence = output_data[i] * 100
        # Check to make sure we don't go out of bounds if labels.txt is incomplete
        label = labels[i] if i < len(labels) else f"Unknown Index {i}"
        print(f"{label}: {confidence:.2f}%")

if __name__ == "__main__":
    main()