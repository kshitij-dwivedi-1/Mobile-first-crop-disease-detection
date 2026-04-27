import tensorflow as tf
interp = tf.lite.Interpreter(model_path='K:/Laptop/Kshitij_Major_Project/code/model.tflite')
interp.allocate_tensors()
inp = interp.get_input_details()[0]
out = interp.get_output_details()[0]
print('Input shape :', inp['shape'])
print('Input dtype :', inp['dtype'])
print('Output shape:', out['shape'])
print('OK - model works in Python TFLite')