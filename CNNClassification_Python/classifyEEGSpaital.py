# This is an image classifier used to classify onset of a seizure

import os
import numpy as np
from keras.models import Sequential
from keras.layers import Activation, Dropout, Flatten, Dense
from keras.preprocessing.image import ImageDataGenerator
from keras.layers import Convolution2D, MaxPooling2D, ZeroPadding2D
from keras import optimizers
from keras import metrics

#dimensions of the images being used in training
img_width, img_height = 320, 320

#Specify the directories used for traning and validation of the data.
train_data_dir =
validation_data_dir

#Ensure the data that is being imported has pixel values from [0 1] interval

#retrive the images from their respective classes for training and validation of the data
train_generator

#CNN Architecture flowthrough
model = Sequential()

model.add(Convolution2D(32, ,3,3), input_shape = (img_width, img_width, 3))
model.add(Activation('relu'))
model.add(MaxPooling2D(pool_size = (2, 2)))

model.add(Convolution2D(32, 3, 3))
model.add(Activation('relu'))
model.add(MaxPooling2D(pool_size(2, 2)))

model.add(Convolution2D(64, 3, 3))
model.add(Activation('relu'))
model.add(MaxPooling2D(pool_size =(2,2)))

model.add(Flatten())
model.add(Dense(64))
model.add(Activation('relu'))
model.add(Dropout(0.5))
model.add(Dense(1))
model.add(Activation('sigmoid'))

model.compile(loss = 'binary_crossentropy',
              optomizer = 'rmsprop',
              metrics = ['mae', 'acc'])

# Training
nb_epoch = 30
nb_train_samples = 2040
nb_validation_samples = 832

model.fit_generator(
    train_generator,
    samples_per_epoch
)
