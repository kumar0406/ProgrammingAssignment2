
# coding: utf-8

# In[1]:


import numpy as np


# In[2]:


import matplotlib.pyplot as plt
import tensorflow as tf


# In[3]:


observations = 1000

xs = np.random.uniform(-10, 10, (observations,1))
zs = np.random.uniform(-10,10,(observations, 1))

generated_inputs = np.column_stack((xs,zs))

noise = np.random.uniform(-1,1,(observations,1))

generated_target = 2*xs + 3*zs + 5 + noise

np.savez('TF_intro', inputs = generated_inputs, targets = generated_target)


# In[4]:


## file is created 
## define the size of input and output


# In[5]:


input_size = 2
output_size = 1


# In[6]:


# outlying the model 


# In[12]:


## Define the placeholder
inputs = tf.placeholder(tf.float32, [None, input_size])
targets = tf.placeholder(tf.float32, [None, output_size])


# In[13]:


## Define weights and biases - variables
weights = tf.Variable(tf.random_uniform([input_size, output_size], minval = -0.1, maxval = 0.1))
biases = tf.Variable(tf.random_uniform([output_size], minval = -0.1, maxval = 0.1))

output = tf.matmul(inputs,weights) +biases


# ## choosing the objective function and optimization method

# In[16]:


mean_loss = tf.losses.mean_squared_error(labels = targets, predictions = output)/2.

optimize = tf.train.GradientDescentOptimizer(learning_rate=0.05).minimize(mean_loss)


# ## prepair for executation

# In[17]:


sess = tf.InteractiveSession()


# In[20]:


## training happens in session
## now we will change the value of weights and biases
## but first we must initialize the weights and biases.... this process is knownas initialization


# In[21]:


initializer = tf.global_variables_initializer()
## this method initialize all tensor objects as variable


# In[27]:


## sess.run(what we want to run)


sess.run(initializer)
## the variables have been initialize

## Load the training data

training_data = np.load('TF_intro.npz')

## Foe loop for minimizing the loss function

for e in range(100):
    _,curr_loss = sess.run([optimize, mean_loss ], 
                         feed_dict= {inputs: training_data['inputs'],targets :training_data['targets'] })
    print(curr_loss)

